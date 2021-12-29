---
layout: post
title: 'A Mindset for Better Code'
categories: refactoring quick-tip
description: The key for better code is making it easy to delete.
---

An app is like a living being: it comprises several small parts that interact,
forming larger, more complex parts. Also, like a living thing, some elements
(cells) die every day, being replaced by new ones.

No code stays the same forever. Sometimes it needs to be refactored, sometimes
it needs to be deleted, and a few times, it actually lasts. Now imagine every
time we had to touch a method/function/class/module, we had to **completely
delete it first**, then **rewrite everything again**. Sounds nuts, right? But bear
with me.

What would be the side-effects of doing this?

## More code == More work

First of all, we would despise large blocks of code. For the simple reason that
they would require us to write more when changing it. Also, it's more code to
read and understand before rewriting it.

To make things easier, we would split a large function/class into a couple of
small, meaningful ones, so we would avoid rewriting the whole thing when
changing a single one.

Oh, sure, we would think more about [YAGNI] and [KISS] more often.

## Fewer dependencies

Code with lots of dependencies is a pain to maintain. Everything is related to
everything else! Imagine replacing an HTTP client that's used throughout the
app. We would essentially have to rewrite the entire app!

That's definitely not ideal, so we'd be sure to have external libraries like
that wrapped in an internal module/class, so we could update them in a single
place.

Our code would probably be using more [dependency injection] too.

## Well named things

Before changing something, we first need to read it and
understand it. This is harder when the code is not well named.

{%
include aside.html
title= "Naming is intention"
content="
Yeah, naming things is one of the [hardest things] on Computer Science, and
that's precisely why it's important.

Names reveal the intent of the code. Good naming matters because the
implementation does not always match the original purpose. This is especially
relevant for languages without type annotations like Ruby since naming is the
only way to reveal intent to the reader.

[hardest things]: https://martinfowler.com/bliki/TwoHardThings.html"
%}

Vague names in important places like `data`, `value`, for example, would make
our jobs much harder

```ruby
# Literally everything in code is data.
# And what in the world is `process`?
# This method could do anything!
def process_data(data)
  # ...
end
```

If, instead, we had

```ruby
def convert_to_json(user)
  # ...
end
```

Small change, but this is _way_ easier to understand what's going on, even
without the method body. The name hints at what the method does, and we'd know
what to expect from it.

When poorly named, even small variables would bother us

```rust
// What the heck is this number?
let r = 6371;
```

It seems silly, but when writing code, we can't expect someone to know by
heart/recognize Earth's radius.

## The winds of change

Thinking about code as something ephemeral helps us write code that is easier to
understand and change. It also makes us not too attached to the code we wrote.

Remember, this is not a rule but an exercise. What's essential is understanding
what makes a codebase easy to work with: small, well-named, self-contained
parts.

Doing this exercise is future-proofing ourselves because we can be sure:
**things will change**. And when they do, we want our code to be easy to
change as well.

[kiss]: https://thoughtbot.com/blog/ruby-and-kiss-sitting-in-a-tree
[yagni]: https://martinfowler.com/bliki/Yagni.html

[dependency injection]: {% post_url 2021-04-22-mocking-made-simple %}
