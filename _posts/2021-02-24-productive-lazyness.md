---
layout: post
title: 'Productive Laziness'
date: 2021-02-24 10:57:55 -0300
categories: productivity
---

<div class="intro">
  <p>
    You're tired. Exhausted. Your mind simply isn't responding. You stare at the code; it stares back
    at you. You type something. It doesn't work. You delete it.
    The clock says: <code class="language-plaintext highlighter-rouge">04:00 PM</code>.
    <br>
    You know what you need: <strong>a break</strong>.
  </p>
</div>

Working when we're tired is **really dangerous** (to us and our applications). We write buggy code,
make silly mistakes, they frustrate us, and, finally, _we burn out_. Everyone has been there. So,
what to do rather than keep hammering your head on the keyboard?

In fact, you got a lot of options:

- Lie down (or get up if you've been sitting for a long time);
- Change the room you're working on;
- Take a (short) nap;
- Go on a walk (_to your backyard_ 😢) and look at the sky;
- Play a song on your guitar;
- Play with your pet;
- Tell your loved ones you love them;
- At least go drink some water! You get hydrated and [it may boost your productivity!][water]

The important part is to get some distance from the problem you're facing. **Context switch is
really important**. You may think that breaks will kill your flow, and it's easy to convince yourself
that you don't have time for them, but hear me out: **they work!** Well, you don't have to trust me,
[science has shown this over and over again][science].

## I can't take a nap! I'm working!

I realize not everyone has the freedom/opportunity to do those things. Or you may not be comfortable
doing them during work time, and I get it. So, I'll list some alternative tasks you can do instead.
I call them _productive laziness_ because even though they're not your primary task, they're still
useful (for you and your app)!

### Productive laziness tasks

#### Review Pull Requests from libraries you like

You don't need to be a maintainer to do this! OSS folks have _lots of work_ to do, so go ahead and
give them some help (and maybe you _do_ end up as a maintainer). You don't need to be an expert in
the project. Just knowing the programming language behind it can help you! You can suggest better
variable/method names or methods with better performance, for instance. But please, **be kind**.

#### Open Pull Requests for libraries you like

If you're feeling brave, you can help OSS ever further! Fix some bug reported into their issue
tracker. Maybe a refactor or performance improvement? Search for issues with tags like
`good-first-issue`, `easy`, `beginner` or `first-time-contributor`. That's how I got my [first
contribution merged into Rails][rails]!

#### Read docs from languages/libraries you use

This is quite obvious, but learning that one method can save your life later! You may found a new
helper method that makes your code simpler or faster.

#### Read a blog post

This is basically the same as the previous one, but it doesn't have to be technical. You can learn
some productivity technique, read something inspiring or just laugh out loud. I'm pretty sure you
have some marked as "read later" somewhere.

#### Write a blog post

I'm pretty sure you have something to tell. Don't worry, you don't have to finish it right away.
Just put some basic ideas in the paper. You'll perfect it later.

#### Learn some keybindings on your text editor

Consider this an investment: a couple of minutes today saves you a life of keystrokes! You can learn
some terminal tricks too! It is the same idea.

#### Reply that one email you've been postponing

It'll only take you 5 minutes. Get rid of it accumulating dust in your mailbox and in your brain.

#### Pay off some technical debt

This is _by far_ my favorite alternative task. Here you can do what you like the most:

- Fix [N+1 queries][n_plus_one];
- Add tests to improve your test coverage;
- Improve the loading time for some page in your web app (using lighthouse and other dev tools);
- Fix that one exception that your monitoring tool reported. This might be a good opportunity to
  start TDDing. [Here's how][tdd].
- Solve some simple CSS problem: alignments or spacing issues, for example;
- Refactor some nasty code you find. You can do simple things like renaming variables/methods or
  extracting functions/classes.

Remember:

> "A refactor a day keeps the rewrite away!" - _Developer Granny_

You may not fix that nasty bug by the end of the day, but a least _your app will be
faster/cleaner/have more tests_! I think that's a nice trade-off.

### It’s all about incentives!

These short tasks give us small wins, and they motivates us to keep working on annoying chores.

Here’s something to keep an eye on: be sure to **make the laziness time-boxed**! You don’t want to spend the whole day in a alternative task 😜.

Finally, no matter how your day goes, be kind to yourself. Some days are amazing, some days are terrible, but most days are just doing the work of life. Do your best to enjoy them!

[science]: https://thewellbeingthesis.org.uk/foundations-for-success/importance-of-taking-breaks-and-having-other-interests/#:~:text=Taking%20breaks%20has%20been%20shown,and%20cardiovascular%20disease%20%5B2%5D.
[water]: https://arthur.ludus.club/en/hacking/productivity/2020/02/02/habit-drink-water.html
[n_plus_one]: https://stackoverflow.com/questions/97197/what-is-the-n1-selects-problem-in-orm-object-relational-mapping
[rails]: https://github.com/rails/rails/pull/41335
[tdd]: {% post_url 2021-01-18-a-simple-way-to-get-started-with-tdd %}
