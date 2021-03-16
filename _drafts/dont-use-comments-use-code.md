---
layout: post
title: "Don't Use Comments! Use Code."
date: 2021-03-15 08:52:14 -0300
categories: code refactoring comments
---

> Let's get this straight: comments are a code smell.

Whenever I feel like commenting something in my code I stop and ask myself: _"Is there any way
to NOT use comments here and use code instead?"_. Often the answer is "yes".

Comments are a lazy solution for developers. They spare us from thinking about abstractions and
naming (which is [one of the hardest things][hard] in Computer Science), and that's why they're so
tempting.

However, we can avoid (most) comments using simple code! As the saying goes _"Talk is cheap, show me the
code"_. So, here we go:

## Describind the obvious

Let's get this out of the way: these "describing" comments are just useless. They're just
duplication and add no value. On the contrary, they encourage other developers to do the same! Just
get rid of them. Good variable and function naming is the way to go here.

```ruby
### DON'T ###

module Dungeon
 def generate_arr
    # Initializes an empty array of rooms
    arr = []

    # Creates five retangular rooms and add them the `rooms` variable
    5.times { arr << retangle(10, 12) }

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

## Don't tell what the code is doing. Do the thing!

This is probably the most common case for comments. If we have the principle ["Tell, don't
ask"][tell] in OOP, for commenting it should be **"Do, don't tell"**. Extracting behavior into
modules/functions makes searching, modifying and testing far better than comments.

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

Fixing those is pretty simple: add a constant. You can use a simple type like an integer, or get
fancy with hash-tables and objects if needed.

```ruby
### DON'T ###

def notify
  send_msg "Hello world!", channel: 0 # General
end

### DO ###

GENERAL_CHANNEL_ID = 0

def notify
  send_slack_msg 'Hello world!', channel: GENERAL_CHANNEL_ID
end

### DO² ###

CHANNEL_IDS = OpenStruct.new(general: 0).freeze

def notify
  send_slack_msg 'Hello world!', channel: CHANNEL_IDS.general
end
```

## Comments for measurement units

Some people think this kind of comment is OK. I think that, as most of these sections, a simple function replaces them. This is the kind of thing that spreads quickly throughout your code, but it's easy to avoid:

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

Using a module like that opens the possibility for other converstions, like `from_minutes`, `from_days`, etc.

## Don't use comments to separate things

If you're using comments to separate sections of a file, this may indicate that this file does too
much. It's better to split it into several modules:

```ruby

### DON'T ###

module Utils
  ### File System ###

  def create_file(path, content = "")
    # ...
  end

  def file_exists?
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

  def file_exists?
    # ...
  end
end

module Utils::Format
  def bold(str)
    #
  end

  def italic(str)
    #
  end
end
```

## Don't add TODO's

These kind of TODO's rarely get done. If you're the one adding the comment, you're the one that
cares about it. Do it now!

```ruby
### DON'T ###

# TODO: add
def notify
  send_msg "Hello world!", channel: 0 # General
end
```

Don't have time to deal with it? **Open an issue** instead. Issues are prioritized and end up in
your development pipeline (or maybe in some OSS contributor). Those comments will be forgotten as
soon as your code goes to production.

## Don't add deprecation notes

```ruby
### DON'T ###

# deprecated use `puts` instead

def printf(str)
  # ...
end

### DO ###

def deprecate(target, alternative:)
  Log.warning("[DEPRECATION] `#{target}` is deprecated. Use #{alternative} instead.")
end

deprecate(:printf, alternative: :puts)

def printf(str)
  # ...
end
```

## Don't add after-update notes

This is the same principle as the one before. Codify your comments.

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

If an Exception is too hard for you, you can just give a warning.

You could go ever further:

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

This is specially usefull if the new method is more performant than the older one. You'll get
instant performance without changing your code.

## Don't use comments as backup

Developers shouldn't fear deleting code. Commented code just muddles everthing around it. Do you
think you may need it later? Short answer: _you'll probably don't_. And even if you do, that's why we
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
Languages like Ruby doesn't ()

## Comments are not code!

Comments tend to get lost and collect dust. When you're in a big refactor, you'll rarely think in
refactoring comments too. Comments _are not tested_, so they end up with typos, wrong information,
and worse: **bugs**.

Codifying your comments, on the other hand, brings all code benefits: syntax hightlighting,
grepping, compile/runtime checks, _testing_!

Comments are a confession that we were unable to represent our ideas with code. That happens
sometimes, but try your best to avoid them.

**TLDL:** Don't use comments. Codify your comments.

[hard]: https://martinfowler.com/bliki/TwoHardThings.html
[tell]: https://martinfowler.com/bliki/TellDontAsk.html