---
layout: post
title: "Don't Use Comments! Use Code"
date: 2021-03-15 08:52:14 -0300
categories: code refactoring comments
---

> Let's get this straight: comments are a code smell.

As the saying goes _"Talk is cheap, show me the code"_. So, here we go:

## Don't tell what the is doing. Do the thing!

```ruby
# DON'T

def something_important
  system("stty -echo") # disables echo on terminal
  do_stuff
  system("stty echo") # enables echo on terminal
end

# DO

module Terminal
  def enable_echo
    system("stty echo")
  end

  def disable_echo
    system("stty -echo")
  end
end

def something_important
  Terminal.disable_echo
  do_stuff
  Terminal.enable_echo
end
```

## No need for magic numbers

```ruby
# DON'T'
def something_important
  send_msg "Hello world!", channel: 0 # General
end

# DO
GENERAL_CHANNEL_ID = 0

def something_important
  send_slack_msg "Hello world!", channel: GENERAL_CHANNEL_ID
  send_slack_msg 'Hello world!', channel: GENERAL_CHANNEL_ID
end
```

## Don't use comments to separate things

If you're using comments to separate sections of a file, this may indicate that this file does too much. It's better to split it into several modules:

```ruby

# DON'T

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
    #
  end

  def italic(str)
    #
  end
end

# DO

module Utils::FS
  def create_file(path, content = "")
    # ...
  end

  def file_exists? # ...
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

Those TODO's rarely really get done. If you're the one adding the comment, you're the one that cares about it. Do it now!

Don't have time to deal with it? Open an issue instead.

## Don't add deprecation notes

```ruby
# DON'T

# deprecated use `puts` instead

def printf(str)
  # ...
end

# DO

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
# DON'T

class Post < BaseModel
  def self.without_author # TODO: Use Post.where.missing(:author) after Rails 6.1
    Post.left_joins(:author).where(authors: { id: nil })
  end
end

# DO

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
# DO

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

This is specially usefull if the new method is more performant than the older one. You'll get instant performance without changing your code.

## Comments are not code

Comments get lost. Comments are not tested. Comments are not code. Comments are a confession that we were unable to represent our ideas with code. That happens sometimes, but try your best to avoid it.

TLDL; Don't use comments. Codify your comments.
