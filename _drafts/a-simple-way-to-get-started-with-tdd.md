---
layout: post
title: 'A Simple Way To Get Started With TDD'
date: 2020-12-29 23:42:37 -0300
categories: testing tdd
---

TDD is **awesome**, but also confusing (and even scary) for those who never practiced it. It
doesn't have to! I'll show you how to get started with it by **fixing bugs** (so you can kill two
birds with one stone).

<small>_OBS: the code snippets are below are in ruby, but they apply for any dinamically typed language._</small>

Oh no! You got a bug in production. Your monitoring tool is screaming at you the most famous Ruby
error of all: `NoMethodError: undefined method 'split' for nil:NilClass`

You look at the logs a see where this exception raised:

```
NoMethodError: undefined method `split' for nil:NilClass
your_app/models/user.rb:7:in `first_name'
```

Something went wrong on that User model. Let's check its code:

```ruby
class User
  def initialize(name:)
    @name = name
  end

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

So, somehow the user has a `nil` name.

```ruby
puts 'asdf'
```

```crystal
puts 'asdf'
```

```python
print('asdf')
```

## Next steps

Well, now our model doesn't allow creating user with `nil` names, but the database still allows it. Write a migration to add a constraint to reject null values. Plus, now we may have invalid data on database, that's a bummer! It's probably a good idea to add a default value for all users without a name too.
