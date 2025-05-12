---
layout: post
title: "Don't use comments! Use code."
date: 2021-03-26 17:56:17 -0300
categories: refactoring comments
---

> Let's get this straight: **comments are a code smell**.

Whenever I feel like adding comments to my code I stop and ask myself: _"Is there any way to NOT use
comments here and use code instead?"_. Often the answer is _"yes"_.

Comments are a lazy solution for developers. They spare us from thinking about abstractions and
naming (which is [one of the hardest things][hard] in Computer Science indeed), and that's why
they're so tempting.

However, we can easily avoid (most) comments! As the saying goes _"Talk is cheap, show me the
code"_. So, here we go:

## Describing the obvious

Let's get this one out of the way: these "describing" comments are just useless. They're just
duplications and add no value. On the contrary, they encourage other developers to do the same! Just
get rid of them. Good variable and function naming is the way to go here.

```ruby

### DON'T ###

module Dungeon
  # Generates an array of rooms
 def generate_arr
    # Initializes an empty array of rooms
    arr = []

    # Creates five rooms with the given width and height and add them the `arr` variable
    5.times { arr << create_room(10, 12) }

    # ...
 end
end

### DO ###

module Dungeon
 def generate_rooms
    rooms = []

    5.times { rooms << create_room(width: 10, height: 12) }

    # ...
 end
end
```

## Just do it

Probably the most common use of comments: explaining what the code does. If we have the principle ["Tell, don't
ask"][tell] in OOP, for commenting it should be **"Do, don't tell"**. Extracting behavior into modules/functions makes
searching, modifying, and testing far easier than when using comments.

```ruby

### DON'T ###

def something_important
  system("stty -echo") # disables echo on terminal
  read_password
  system("stty echo") # enables echo on terminal
end

### DO ###

module Terminal
  def self.enable_echo
    system("stty echo")
  end

  def self.disable_echo
    system("stty -echo")
  end
end

def something_important
  Terminal.disable_echo
  read_password
  Terminal.enable_echo
end
```

## No magic numbers!

I'll admit this: comments are a _bit_ better than **nothing** in this case. But we can do better! Fixing
those is pretty simple: add a constant. You can use a simple type like an integer, or get fancy with
hash-tables, structs and objects if needed.

```ruby

### DON'T ###

def notify
  send_slack_msg "Hello world!", channel_id: 0 # General
end

### DO ###

GENERAL_CHANNEL_ID = 0

def notify
  send_slack_msg 'Hello world!', channel_id: GENERAL_CHANNEL_ID
end

### DO² ###

CHANNEL_IDS = OpenStruct.new(general: 0).freeze

def notify
  send_slack_msg 'Hello world!', channel_id: CHANNEL_IDS.general
end
```

## Comments for measurement units

Some people think this kind of comment is OK. I think, as in most of the cases, that a simple function replaces them. This
is the kind of thing that spreads quickly throughout your code, but it's easy to avoid:

```ruby

### DON'T ###

module RecurringJob
  def perform
    do_important_stuff

    seconds = 60 * 60 * 6 # 6 hours
    RecurringJob.run_in(seconds)
  end
end

### DO ###

module Seconds
  def self.from_hours(hours)
    hours * 3600
  end
end

module RecurringJob
  def perform
    do_important_stuff

    seconds = Seconds.from_hours(6)
    RecurringJob.run_in(seconds)
  end
end
```

Using a module like that opens the possibility for other conversions, like `from_minutes`, `from_days`, etc.

## Don't use comments to separate things

If you're using comments to divide a file into sections, this may indicate that this file does too
much. It's better to split it into several modules:

```ruby

### DON'T ###

module Utils
  ### File System ###

  def create_file(path, content = "")
    # ...
  end

  def file_exists?(path)
    # ...
  end

  ### Text format ###

  def bold(str)
    # ...
  end

  def italic(str)
    # ...
  end
end

### DO ###

module Utils::FS
  def create_file(path, content = "")
    # ...
  end

  def file_exists?(path)
    # ...
  end
end

module Utils::Format
  def bold(str)
    # ...
  end

  def italic(str)
    # ...
  end
end
```

## Don't add TODO's

These kinds of TODO's rarely get done. If you're the one adding the comment, you're the one that
cares about it. Do it now!

```ruby

### DON'T ###

# TODO: handle exceptions
def tweet(msg)
  TwitterClient.tweet(msg)
end

### DO ###

def tweet(msg)
  TwitterClient.tweet(msg)
rescue TwitterClient => e
  log_error(e)
end
```

Don't have time to deal with it? **Open an issue** instead. Issues are prioritized and end up in
your development pipeline (or maybe in some OSS contributor's). Those TODO comments will be
forgotten as soon as your code goes to production.

{%
  include aside.html
    type="info"
    title="TODO or die!"
    content="If you're using Ruby, check out the gem [todo or die](https://github.com/searls/todo_or_die). It helps you keep those TODO's done."
%}

## Don't add deprecation notes

Deprecating code with comments is not efficient. Especially in libraries, developers won't read
source code before using it. Be proactive and do something actionable (like a warning) right away.

```ruby

### DON'T ###

# DEPRECATED: use `puts` instead
def printf(str)
  # ...
end

### DO ###

def deprecate(target, alternative:)
  Log.warning("[DEPRECATION] `#{target}` is deprecated. Use #{alternative} instead.")
end

def printf(str)
  deprecate(:printf, alternative: :puts)

  # ...
end
```

Are you using comments to generate deprecation documentation? Read [this section](#when-comments-are-ok).

## Don't add after-update notes

This is the same principle as the one before: codify your comments.

```ruby

### DON'T ###

class Post < BaseModel
  def self.without_author
    # TODO: Use Post.where.missing(:author) after Rails 6.1
    Post.left_joins(:author).where(authors: { id: nil })
  end
end

### DO ###

class Post < BaseModel
  def self.without_author
    raise 'Use `Post.where.missing(:author)` instead' if Rails.version >= '6.1'

    Post.left_joins(:author).where(authors: { id: nil })
  end
end
```

If an `exception` is too harsh for you, you can just give a warning.

You could go even further:

```ruby

### DO² ###

class Post < BaseModel
  def self.without_author
    if Rails.version >= '6.1'
      Log.warn 'Delete the else branch of this conditional'
      Post.where.missing(:author)
    else
      Post.left_joins(:author).where(authors: { id: nil })
    end
  end
end
```

This is especially useful if the new method is more performant than the older one. You'll get
instant performance without changing your code.

## Don't use comments as backup

Developers shouldn't fear deleting code. Commented code just muddles everything around it. Do you
think you may need it later? Short answer: _you probably won't_. And even if you do, that's why we
have Version Control Systems like Git <small>(If you're not using a VCS, what are you doing?!)</small>.

```ruby

### DON'T ###

# NOTE: Maybe I'll need this someday
# def my_algorithm
#   old(implementation)
# end

def my_algorithm
  new(implementation)
end
```

## When comments are OK

I'm not here to say that _every_ comment is bad. There are some cases when they're the last
resource. If _no code_ can do what you want, don't be ashamed to add a comment. Some examples:

### 1. Comments as documentation

Most languages have tools to generate documentation using code comments. That is nice because it keeps the docs near
the code it refers to. Here's an example of [YARD][yard], a Ruby documentation tool:

```ruby
# Reverses the contents of a String or IO object.
#
# @param contents [String, #read] the contents to reverse
# @return [String] the contents reversed lexically
def reverse(contents)
  contents = contents.read if contents.respond_to? :read
  contents.reverse
end
```

### 2. Comments as code (wut?)

Sometimes comments are _actually_ code. That is, they can be used to produce some behavior.

#### Magic comments

Ruby has [magic comments][magic-comments] that change the behavior of the interpreter in some ways. Just put them in the
beginning of the file, and it will take effect. For example:

- This comment makes the interpreter warns about wrong indentation:

```ruby
# warn_indent: true
```

- You can change the file’s encoding:

```ruby
# encoding: utf-8
```

#### Parsing comments

Some libraries parse comments too. Linters often use comments to disable rules momentarily:

```ruby
# rubocop:disable Layout/LineLength
def this_could_be_a_very_long_line_that_extends_forever_into_infinity
  # ...
end
# rubocop:enable Layout/LineLength
```

Another example is the library [Bake][bake], which parses documentation comments to get information about type
coercions.

```ruby
# Creates a new post
#
# @param post_name [String] name of the post to be created.
# @param categories [Array(Symbol)] categories of the post.
def new_post(post_name, categories: [])
  pp categories
end
```

This way it parses input from the terminal and automatically coerces params into the desired type.

```shell
$ bake new_post 'test-post' categories=ruby,testing
# output: [:ruby, :testing]
```

OBS: even though type checking _can_ be implemented with comments, [sorbet][sorbet], [rbs][rbs], and [several
others][type-checking] have shown that type checking dynamic-typed languages is possible with code.

#### Doctests

The [Elixir language] has a coold feature called [doctests]. They're basically
code examples inside comements, but they _actually run_ the code and check if
the output is correct. This way you can document your code and test it at the
same time. Here's an example:

```elixir
defmodule Calc do
  @doc ~S"""
  `add/2` adds two integers together.

  ## Examples

      iex> add(39, 3)
      42

  """
  def add(x, y) do
    x + y
  end
end
```

[Elixir language]: https://elixir-lang.org/
[doctests]: https://hexdocs.pm/elixir/docs-tests-and-with.html

### 3. When you have no other tool

Sometimes there are some things that you cannot explain with code. I'm not talking about how you
did, but _why_ you did them.

```ruby
def fetch_foos
  # NOTE: We're disabling params sorting because the FooAPI requires
  #       params to be in the following order: foo, bar, baz
  HTTP.get('/foo-api', params: { foo: true, bar: false, baz: false }, sort_params: false)
end
```

Do you have any other good cases for comments? Let me know in the comments!

## Comments are not code!

Comments tend to get lost and collect dust. When we're in a big refactor, we'll rarely think in
refactoring comments too. Comments _are not tested_, so they end up outdated, with typos, wrong
information, and worse: **bugs**.

Using code, on the other hand, has several benefits: syntax highlighting, grepping, compile/runtime
checks, _testing_!

Comments are a confession that we were unable to represent our ideas with code. That happens
sometimes, but try your best to avoid them.

**TLDL:** Don't use comments. Codify your comments.

[hard]: https://martinfowler.com/bliki/TwoHardThings.html
[tell]: https://martinfowler.com/bliki/TellDontAsk.html
[sorbet]: https://sorbet.org/
[rbs]: https://github.com/ruby/rbs
[type-checking]: https://www.ruby-toolbox.com/search?display=compact&q=type+check
[bake]: {% post_url 2020-07-18-baking-tasks-with-bake %}
[yard]: https://yardoc.org/
[magic-comments]: https://docs.ruby-lang.org/en/3.0.0/doc/syntax/comments_rdoc.html#label-Magic+Comments
