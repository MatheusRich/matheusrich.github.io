---
layout: post
title: "The Value Of Small Refactors"
date: 2021-04-25 21:26:48 -0300
categories: refactoring
---

I don't believe in _"refactor week"_, _"refactor month"_, or --- God forbid --- _"refactor **year**"_.

Refactoring shouldn't be something special, but you day-to-day task. It's like personal higiene, you
should do it everyday! You won't wait, acumular sujeira e, when no one can stand your smell you do a
week-long bath (_right?!_). Yet that's what many developers do. And you know the next step: "This
software  is crap, let's rewrite it in _<some-shiny-new-thing>_". Hear me out: [the rewrite is a
trap][rewrite]!

## Small refactors

Developers underestimate the value of small refactors. As my developer granny used to say:

> “A refactor a day keeps the rewrite away!” - Developer Granny

renaming variables
explaining varaibles

extracting methods
```ruby
data = string.split(' ').last

# vs

last_name = name.split(' ').last

# or even better

class User
  def last_name
    name.split(' ').last
  end
end

last_name = user.last_name
```

extracting classes/modules/types

they cost you so little in the short-term, but the payoff is huge.
We read code more than we write, when I read a good variable/method name I don't have to decipher what it mean, it's already there.

Turn your knowledge about the code in something tangible, so other (or your future self) can benefit from it.

[rewrite]: https://www.joelonsoftware.com/2000/04/06/things-you-should-never-do-part-i/