---
layout: post
title: "Kitchen Sink"
date: 2021-07-22 17:13:13 -0300
categories: refactoring
---

Imagine you drink a glass of water and go to the kitchen sink to wash it. When you get there, there's a HUGE pile of
dirty dishes in the sink. To wash your glass, you would have to clean all the mess before. You look around... no one's
watching. You carefully put the glass in the sink's corner and sneak out. You walk away thinking _"How things got this
way?"_. The ironic answer comes to your mind: _one glass a day_.

In the same way, software accumulates technical debt over time. Most of the time, tech debt starts from simple actions:
_"let's add another method to that class"_, _"let's add another parameter to that function"_, _"let's duplicate that
code for the 10th time... What? Don't look at me, it's how everyone does this!"_.

Giant classes/functions/modules are like magnets: they attract all responsibilities to themselves and tend to get even
bigger! There is so much code stuffed inside that everything seems to fit in there. That creates a sort of black hole
that won't stop growing.

I'm not saying you should abstract early. I'm all aboard with [ma'am Sandi Metz][sandi] on
_"duplication is far cheaper than the wrong abstraction"_, but an abstraction will _have_ to exist
at some point.

## 🚪 A way out

If you thought _"I can't touch this without breaking all the things"_, you're not the only one. Every developer will
eventually deal with software that has technical debt and sometimes it may even seem that there's no salvation. Luckily,
smart folks like Martin Fowler taught us patterns for dealing with this very situation! The [Strangler Fig
Pattern][strangler], for example, allows us to refactor big classes (or even applications) incrementally, without
breaking backward compatibility!

The point is, in the same way that there are [design patterns][d-patterns] for creating new code and addressing issues,
there [is a list of code smells and refactoring techniques][refactoring] to deal with them as well. Refactoring should
be part of our daily work, not something _~special~_. We should study, learn and teach others about it. The more we do it,
the easier (and natural) it gets!

> "A refactor a day keeps the rewrite away!" - _Developer Granny_

## 🎸 Gravity is working against me

Bad code attracts (more) bad code. Developers, especially when they're new in a codebase, tend to repeat patterns. That
way, expect a bad piece of code to influence similar instances. To prevent this **we must resist inertia**. Yeah, it's easy
just to follow what everyone's been doing, but this approach won't work forever.

How to do this? Following the [boy-scout rule][b-rule] _"always leave the code behind in a better state than you found
it"_ helps to create a good mindset for it. We'll think twice before just adding a new line of that huge method or
nesting another `if/else` statement. This rule helps us not to be afraid of taking small actions to improve the code.
Did we touch a function? How can we improve it? Does it have tests? Can we [use code to get rid of some
comments][comments]?

When we finally understand _that piece of spaghetti code_ (everyone has at least one in mind), we won't keep it to
ourselves! We have to materialize this knowledge in the code itself by renaming variables, functions, extracting small
methods to clarify intention, etc. It costs us a bit today but will save a ton of time for other developers (or
ourselves in 6 months).

Those simple actions can be powerful in the long run! One glass a day, that dirty pile gets smaller. You may even have
some partners joining this quest! Soon enough, that sink will be shining, and when it is clean, no one will want to be
the first to leave a dirty dish there.

[sandi]: https://sandimetz.com/blog/2016/1/20/the-wrong-abstraction
[strangler]: https://martinfowler.com/bliki/StranglerFigApplication.html
[d-patterns]: https://en.wikipedia.org/wiki/Software_design_pattern
[refactoring]: https://martinfowler.com/books/refactoring.html
[b-rule]: https://martinfowler.com/bliki/OpportunisticRefactoring.html
[comments]: {% post_url 2021-03-26-dont-use-comments-use-code %}
