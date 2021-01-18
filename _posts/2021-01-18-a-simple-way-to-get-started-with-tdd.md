---
layout: post
title: 'A Simple Way To Get Started With TDD'
date: 2021-01-18 10:49:33 -0300
categories: testing tdd ruby
---

TDD is **awesome**, but also confusing (and even scary) for those who never practiced it. But it
doesn't have to! We're gonna learn how to get started with it by **fixing bugs** (so we can kill two
birds with one stone).

[&raquo; If 3 min is too long, here's the TL;DL](#tldl)

<small>_OBS: the code snippets are below are in ruby, but the core concept applies to any language._</small>

## Oh, no! You got a bug in production!

Your monitoring tool is screaming at you the famous [Billion Dollar Mistake][null]: `NoMethodError: undefined method 'split' for nil:NilClass`

You look at the logs a see where this exception raised:

```
NoMethodError: undefined method `empty?' for nil:NilClass
your_app/models/user.rb:2:in `invalid?'
```

Something went wrong with that User model. Let's check its code:

```ruby
class User < BaseModel
  def invalid?
    @name.empty? # <-- The error occurred here
  end

  def save!
    raise 'Cannot save invalid user!' if invalid?

    :saved_on_db # I'm simplifying the record creation on DB here
  end

  # ...
end
```

So, before saving the user, it had a `nil` name. We have a validation, but it only checks if `@name` is not empty.
Well, this is probably the bug: it shouldn't allow `nil` values too.

Before we run to fix this bug, let's confirm our thesis **by writing a test that reproduces the error**.
This is very important! If our test fails with the _same error_ that the monitoring tool had,
we're on the right track.

```ruby
class UserTest < Test::Unit::TestCase
  def test_that_user_with_name_is_valid
    user = User.new(name: 'Matz')

    refute user.invalid?
  end

  def test_that_user_with_empty_name_is_invalid
    user = User.new(name: '')

    assert user.invalid?
  end

  def test_that_user_with_nil_name_is_invalid # <-- New test here
    user = User.new(name: nil)

    assert user.invalid?
  end

  def test_that_can_save_user_with_name
    user = User.new(name: 'Matz')

    assert_equal :saved_on_db, user.save!
  end

  def test_that_cannot_save_user_with_empty_name
    user = User.new(name: '')

    assert_raise_message('Cannot save invalid user!') do
      user.save!
    end
  end
end
```

We run it and... BOOM!

```
Error: test_that_user_with_nil_name_is_invalid(UserTest):
  NoMethodError: undefined method `empty?' for nil:NilClass
```

So, we're able to reproduce the error. Now we must fix the bug, and if we patch it correctly, this
test will pass.

We should check if user's name isn't `nil` before checking it isn't empty:

```ruby
class User < BaseModel
  def invalid?
    @name.nil? || @name.empty? # <-- In Rails this could be written as `@name.blank?`
  end

  # ...
end
```

We rerun our tests, and now we're green!

```
Loaded suite /your_app/tests/user_test
Started
.....
Finished in 0.000720944 seconds.
-------------------------------------------------------------------------------
5 tests, 5 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
```

## We TDDed, so...?

With this approach, we've not only fixed the bug but **added a test confirming our fix** (making
sure the error doesn't happen again). Now, just open a Merge Request for it (or push to master
you're feeling rebel enough).

## TL;DL

Let's review the steps:

1. Identify the bug;
2. Write a test that reproduces the error; _(This is the critical step)_
3. Fix the bug;
4. Watch the test pass.

I hope this helps you too see some TDD niceties! Happy TDDing!

[null]: https://en.wikipedia.org/wiki/Null_pointer#History:~:text=History,-%5B
