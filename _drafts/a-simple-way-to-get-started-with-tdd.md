---
layout: post
title: 'A Simple Way To Get Started With TDD'
date: 2020-12-29 23:42:37 -0300
categories: testing tdd
---

TDD is **awesome**, but also confusing (and even scary) for those who never practiced it. But it
doesn't have to! We're gonna learn how to get started with it by **fixing bugs** (so we can kill two
birds with one stone).

<small>_OBS: the code snippets are below are in ruby, but the core concept applies to any language._</small>

## Oh no! You got a bug in production!

Your monitoring tool is screaming at you the famous [Billion Dollar Mistake][null]: `NoMethodError: undefined method 'split' for nil:NilClass`

You look at the logs a see where this exception raised:

```
NoMethodError: undefined method `split' for nil:NilClass
your_app/models/user.rb:7:in `first_name'
```

Something went wrong on that User model. Let's check its code:

```ruby
class User < BaseModel
  def first_name
    @name.split.first # <-- The error ocurred here
  end

  def invalid?
    @name.empty?
  end

  def save!
    raise 'Cannot save invalid user!' if invalid?

    :saved_on_db # I'm simplifying the record creation on DB here
  end
end
```

So, somehow a user has a `nil` name. We have a validation, but it only check if name is not empty.
Well, this is probably the bug: it shouldn't allow `nil` values too.

Now, before we run to fix this bug, let's confirm our thesis **by writing a test that reproduces the error**.
This is very important! If our test fails with the same error that the monitoring tool had,
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

  ### New test here ###
  def test_that_user_with_nil_name_is_invalid
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

## Next steps

Well, now our model doesn't allow creating user with `nil` names, but the database still allows it. Write a migration to add a constraint to reject null values. Plus, now we may have invalid data on database, that's a bummer! It's probably a good idea to add a default value for all users without a name too.

[null]: https://en.wikipedia.org/wiki/Null_pointer#History:~:text=History,-%5B
