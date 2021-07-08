---
layout: post
title: "Kitchen Sink"
date: 2021-04-30 17:32:41 -0300
categories: refactoring
---

Imagine you drink a glass of water and go to the kitchen sink to wash it. When you get there there's a HUGE pile of
dirty dishes in the sink. To wash your glass, you would have to clean all the mess before. You look around... no one's
watching. You carefully put the glass in the sink's corner and sneak out. You walk away thinking "How things got this
way?". The ironic answer comes to your mind: _one glass a day_.

In the same way, software accumulates technical debt over time. Most of the time tech debt appears from simple actions:
just add another method to that class, just add another parameter to that function, let me duplicate that code for the
10th time, what? Don't look at me, it's how everyone does this.

I'm not saying you should abstract early. I'm all aboard with [ma'am Sandi Metz][sandi] on _"duplication is far cheaper
than the wrong abstraction"_. I'm just saying that abstraction will have to exist at some point.

Giant classes/functions/modules are like magnets: they attract all responsibilities to themselves and tend to get even
bigger! They have so many things stuffed inside that everything seems to fit in there.

"I can't refactor this without breaking all the things". You're not the only one. Every developer will eventually deal
with software that has technical debt.

> "A refactor a day keeps the rewrite away!" - _Developer Granny_

## 🎸 Gravity is working against me

Bad code attracts bad code. Good code attracts good code.

Developers (especially when they're new in a codebase) tend to repeat patterns.

Don't just add a new line of that huge method.

Don't nest another `if/else` statement.

Don't be afraid to create a small class. There's no problem with that.

Did you touch a function? Refactor it! Add tests for it.

Rename that variable.

Those simple actions can be powerful in the long run! Soon enough, that sink will be shining. And when it's clean, no
one will want to be the first to leave a dirty dish there.

[sandi]: https://sandimetz.com/blog/2016/1/20/the-wrong-abstraction