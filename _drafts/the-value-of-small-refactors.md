---
layout: post
title: 'The Value Of Small Refactors'
categories: refactoring
---

Key points:

- refactoring is not "special". You don't need to "stop working to do it" it's part of your day-to-day job.
- just good naming and extracting method/classes/modules goes a looong way

I don't believe in _"refactor week"_, _"refactor month"_, or --- God forbid --- _"refactor
**year**"_. Good code is not built overnight by some mythical omniscient wizard developer. It's a
craft of many small steps.

Refactoring shouldn't be something special, but part of your day-to-day task. It's like personal
hygiene, you should do it every day! You won't wait, accumulate dirt and, when no one can stand your
smell, you do a week-long bath (_right?!_). Yet that's what many developers do (with their
software). And you know the next step: "This software is crap, it's all <current-language>'s fault!
Let's rewrite it in _<some-shiny-new-thing>_". Hear me out: [the rewrite is a trap][rewrite]!

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
