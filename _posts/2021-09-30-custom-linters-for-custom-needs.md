---
layout: post
title: "Custom Linters For Custom Needs"
date: 2021-09-30 15:17:47 -0300
categories: ruby rails rubocop linters
---

I'm working on a project that heavily relies on Feature Flags. Whenever we add a new feature or fix
a bug, we add a flag for it. Here's how that looks.

We list our flags in a YAML file:

```ruby
# config/feature_flags.yml
two_factor_authentication: "Enabled 2-factor auth for all users"
fix_1234: "Check for nils on User#can_vote?"
# ...
```

And we use them on our code:

```ruby
class User
  def can_vote?
    if Feature.enabled?(:fix_1234)
      age.present? && age >= 16
    else
      age >= 16
    end
  end
end
```

This is nice because we can toggle the flags in production and fix bugs or have different features available for different clients.

## Cleaning up flags

If flags refer to bugfixes (like the example above), when QA approves them and the patch goes to
production, we have to clean the flags up.

```diff
# config/feature_flags.yml
two_factor_authentication: "Enabled 2-factor auth for all users"
-fix_1234: "Check for nils on User#can_vote?"
# ...
```

```diff
 class User
   def can_vote?
-    if Feature.enabled?(:fix_1234)
-      age.present? && age >= 16
-    else
-      age >= 16
-    end
+    age.present? && age >= 16
   end
 end
```

While this works well, it's easy to forget old feature flags in the system. Test coverage helps
here, but what if we could do some static checking?

That's when Rubocop comes to play. We can create a custom cop that checks that for us!

The principle is simple: We need to search for calls like `Feature.enabled?(<some-flag>)` and check
if that flag exists on our YAML file. We _could_ do this by grepping, but it would be hard since
code can vary in style (indentation, use or lack of parentheses, etc.).

What we're going to do is to search for patterns directly into the parsed code. It's like grepping,
but on the AST.

## Grepping the _what_?

When Ruby reads your code, it transforms it from plain text to a data structure called [Abstract
Syntax Tree (AST)]. It is basically a tree that represents how Ruby will evaluate your code.

Let's look at an AST for the expression `3 * 5 + 1`:

```
     CODE                               AST
     ‾‾‾‾                               ‾‾‾
 ___________      ________             ( + )
| 3 * 5 + 1 | => | PARSER ｜  =>       /   \
 ‾‾‾‾‾‾‾‾‾‾‾      ‾‾‾‾‾‾‾‾         ( * )  ( 1 )
                                   /   \
                                ( 3 )  ( 5 )
```

<center>Figure 1 - Code to AST</center>
<br>

While ASCII art is fun, it's definitely not practical to textually represent trees this way. A better
way to do it is to use [S-expressions](https://en.wikipedia.org/wiki/S-expression). This is
straightforward if you already know
[LISP](<https://en.wikipedia.org/wiki/Lisp_(programming_language)>).

The S-expression representation for the tree in `Figure 1` could look like this:

```lisp
(+ (* 3 5) 1)
```

<small>Tip: If you wanna learn more about how languages (especially interpreted ones) work, check out the
**amazing** book [Crafting Interpreters](https://craftinginterpreters.com/) by [Bob
Nystrom](https://twitter.com/munificentbob).</small>

## Oh, ok. Grepping the AST

_Getting back to our topic..._ Rubocop allows us to grep the AST with S-expressions in the same fashion
that we're used to with regexes. So, we have to find what's the S-expression for our pattern
`Feature.enabled?(<some-flag>)`. Here's the best part: **we don't need to know this from the top of
our heads**. The gem called `parser`, which ships with Rubocop, does the job for us:

```lisp
$ ruby-parse -e "Feature.enabled?(:some_flag)"
(send
  (const nil :Feature) :enabled?
  (sym :some_flag))
```

Here we're using a hardcoded symbol `:some_flag`, but we're going to swap it out to
`$_`, which means that Rubocop will capture the symbol value and yield it for
us. Here's the final pattern we're going to use to search our code:

```lisp
(send
  (const nil :Feature) :enabled?
  (sym $_))
```

## Actually writing a cop

To create a custom Rubocop cop, we create a class that subclasses `RuboCop::Cop::Cop`. Then we
need to hop on one of the hooks Rubocop runs while reading our code, like
`on_class`, `on_if`, `on_send`. In this case, we're going to use `on_send`:

```ruby
module CustomCops
  class UnknownFeatureFlag < RuboCop::Cop::Cop
    def on_send(node)
      # do stuff with the AST node
    end
  end
end
```

Now we define a custom matcher for the pattern we specified earlier. It will
filter out all nodes that we're not interested in. Note how the matcher yields
back the captured symbol to the block so that we can use it.

```ruby
module CustomCops
  class UnknownFeatureFlag < RuboCop::Cop::Cop
    def_node_matcher :on_feature_flag, <<~PATTERN
      (send (const nil :Feature) :enabled? (sym $_))
    PATTERN

    def on_send(node)
      on_feature_flag(node) do |flag|
        # do stuff with the flag
      end
    end
  end
end
```

Now we check if this flag exists in our file and register an offense if it doesn't:

```ruby
module CustomCops
  class UnknownFeatureFlag < RuboCop::Cop::Cop
    def_node_matcher :on_feature_flag, <<~PATTERN
      (send (const nil :Feature) :enabled? (sym $_))
    PATTERN

    MSG = "Unknown feature flag `%<flag>s`".freeze
    FEATURE_FLAGS = YAML.load_file("config/feature_flags.yml").keys

    def on_send(node)
      on_feature_flag(node) do |flag|
        next if FEATURE_FLAGS.include?(flag.to_s) # known flag, move on

        register_offense(node, flag)
      end
    end

    private

    def register_offense(node, flag)
      message = format(MSG, flag: flag)

      add_offense(node, message: message)
    end
  end
end
```

## It's alive!

That's it! We can require our custom class to `.rubocop.yml` and run it along with other cops

```yaml
# .rubocop.yml
require:
  - ./lib/custom_cops/unknown_feature_flag.rb
```

or run it standalone

```sh
rubocop -r ./lib/custom_cops/unknown_feature_flag.rb --only CustomCops/UnknownFeatureFlag
....F
app/secret_file.rb:45:10: C: CustomCops/UnknownFeatureFlag: Unknown feature flag the_cake_is_a_lie
      if Feature.enabled?(:the_cake_is_a_lie)
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

What we did was just the tip of the iceberg. We could even make our cop
[autocorrectable] to delete old code. Something like

```ruby
def foo
  if Feature.enabled?(:some_flag_we_cleaned_up)
    new_code
  else
    old_code
  end
end
```

could be rewritten as

```ruby
def foo
  new_code
end
```

## Lessons learned

The major point here is not learning _how to write_ a custom Rubocop cop, but
knowing how writing one can save you/your team time by avoiding manual checks.

For more detail on how to write, test, and bundle custom cops in a gem, refer
to this fantastic post by [Evil Martians] and [Rubocop's official guide].

[abstract syntax tree (ast)]: https://en.wikipedia.org/wiki/Abstract_syntax_tree
[autocorrectable]: https://docs.rubocop.org/rubocop/1.13/development.html#auto-correct
[evil martians]: https://evilmartians.com/chronicles/custom-cops-for-rubocop-an-emergency-service-for-your-codebase
[rubocop's official guide]: https://docs.rubocop.org/rubocop/1.13/development.html

