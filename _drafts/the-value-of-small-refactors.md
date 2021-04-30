---
layout: post
title: 'The Value Of Small Refactors'
date: 2021-04-25 21:26:48 -0300
categories: refactoring
---

Key points:

- refactoring is not "special". You don't need to "stop working to do it" its part of your day to
  day job.
- just good naming and extracting method/classes/modules goes a looong way

I don't believe in _"refactor week"_, _"refactor month"_, or --- God forbid --- _"refactor
**year**"_. Good code is not built overnight by some mythical omniscient wizard developer. It's a
craft of many small steps.

Refactoring shouldn't be something special, but you day-to-day task. It's like personal higiene, you
should do it everyday! You won't wait, acumular sujeira e, when no one can stand your smell you do a
week-long bath (_right?!_). Yet that's what many developers do. And you know the next step: "This
software is crap, it's all <current-language>'s fault! Let's rewrite it in
_<some-shiny-new-thing>_". Hear me out: [the rewrite is a trap][rewrite]!

## Small refactors

Developers underestimate the value of small refactors. As my developer granny used to say:

> “A refactor a day keeps the rewrite away!” - Developer Granny

renaming variables explaining varaibles

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

they cost you so little in the short-term, but the payoff is huge. We read code more than we write,
when I read a good variable/method name I don't have to decipher what it mean, it's already there.

Turn your knowledge about the code in something tangible, so other (or your future self) can benefit
from it.

## The cycle of careness

this can lead

[rewrite]: https://www.joelonsoftware.com/2000/04/06/things-you-should-never-do-part-i/
