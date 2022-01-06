---
layout: post
title: "TIL: Object#presence_in"
date: 2022-01-05 21:47:30 -0300
categories: TIL rails
description: A small Rails addition that helps creating allow/block lists.
---

{%
  include aside.html
    content="This year I'm going to share small things I just learned
    (<acronym title='Today I Learned'>TILs</acronym>). This is the first of them. I hope you enjoy it!"
%}

Rails [adds] the `presence_in` method to the `Object` class. It basically returns
the receiver if it's included in the given object, or `nil` otherwise.

```ruby
class Object
  def presence_in(another_object)
    in?(another_object) ? self : nil
  end
end
```

To understand how it works, it might be useful to look at the definition of
`Object#in?`, which is basically `#include?` with left and right-hand side
swapped.

```ruby
def in?(another_object)
  another_object.include?(self)
rescue NoMethodError
  raise ArgumentError.new("The parameter passed to #in? must respond to #include?")
end
```

I think this is particularly useful for allowlists like

```ruby
class UsersController < BaseController
  def index
    sort_by = params[:sort_by].presence_in(["created_at", "id", "name"])
    @users = User.sort_by(sort_by)
  end
end
```

Note that it's really easy to add a default/fallback value in case you get a bad value.

{% highlight ruby highlight_lines="3" %}
class UsersController < BaseController
  def index
    sort_by = params[:sort_by].presence_in(["created_at", "id", "name"]) || "id"
    @users = User.sort_by(sort_by)
  end
end
{% endhighlight %}

[adds]: https://api.rubyonrails.org/classes/Object.html#method-i-presence_in
