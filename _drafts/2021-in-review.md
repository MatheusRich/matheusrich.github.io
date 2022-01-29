---
layout: post
title: '2021 In Review'

categories: year-in-review
description: From resurrecting this blog to contributing to Ruby itself, 2021 was a year of challenges and surprises.
---

{%
  include aside.html
    type="info"
    icon=false
    content="This is my first [year in review](/categories/#year-in-review) article. I plan to do one every year from now! Cya in 365 days!"
%}

Since 2018 I have been writing down things that happened in my life,
particularly the good stuff, as we tend too often to forget about them and
focus on the bad stuff.

2021 was such a surprising year for me that I figured I could use some of those
notes to reflect and review the year in a blog post.

## Where things started

Some context, before 2021, I...

- was working in my first full-time job at [Brazilian startup];
- had just created my [first](https://github.com/Fretadao/f_service)
  [three](https://rubygems.org/gems/benchable)
  [gems](https://rubygems.org/gems/ez_attributes) and I was pretty excited about
  it;
- had started to learn about interpreters with [Crafting Interpreters];
- had made my first _major_ open source contribution: getting a [PR merged into RSpec];
- had left this blog [picking up dust], and only wrote one article in the entire year of 2020;
- had just started [Ruby Cards].

[crafting interpreters]: https://craftinginterpreters.com/
[brazilian startup]: https://fretadao.com/
[picking up dust]: /all/#2020-ref
[pr merged into rspec]: https://github.com/rspec/rspec-core/pull/2778
[ruby cards]: https://twitter.com/RubyCards

## 2021

Since this blog was pretty much dead and I wanted to get better at writing, I
made a resolution to write a blog post per month in 2021. Turns out that writing
more was one of the decisions that opened many other opportunities for me. The
article "[Don't use comments! Use code.]", for instance, got featured in
RubyWeekly and got me to talk on a [podcast] for the first time!

I'm also glad that I finally graduated from college after all sorts of COVID
nonsense. Not that the degree itself changed anything in my career, but it's
nice to take that weight off my shoulders.

Kinda out of nowhere, I decided to [learn Rust](/on-learning-rust). I'm delighted with Ruby, to be honest. Still, learning a new language is cool, so I
picked one very different (statically typed and compiled). Not exactly the
easiest way to learn a new language, but as one of my first projects, I created
[Lana](https://github.com/MatheusRich/lana), a LISP implemented in Rust
influenced by Clojure. It was a fun project, but I left a [lot of ideas]
unimplemented.

[don't use comments! use code.]: /dont-use-comments-use-code/
[podcast]: /talks/#comments-are-the-devil-ruby-rogues-podcast
[lot of ideas]: https://github.com/MatheusRich/lana/issues

### Career

I was used to doing internal presentations at my previous job, but I gave talks
elsewhere for the first time this year. They were on the [3rd] and [5th]
editions of [ada.rb], alongside people like [Rafael França], who has always been
a role model for me (even more because he's Brazilian).

[3rd]: /talks/#taming-god-objects
[5th]: /talks/#start-tdding-in-5-minutes-lightning-talk
[ada.rb]: http://adarb.com.br/
[rafael frança]: https://github.com/rafaelfranca

Then in the second half of the year, almost by accident, I started working on
one of my dream companies: [thoughtbot] 🤖. I saw that a fellow Brazilian ([@SarahLima]) had
joined the company, then I thought, _"What if I tried?"_ and here I am.

{%
  include aside.html
    content="It's amazing how important it is to have someone you can relate to in the places you want to be."
%}

I never thought I would get here this early in my career! It still feels
otherworldly working with people I always admired, like [Josh Clayton], [Steph
Viccari], and [Joël Quenneville] (to not mention all the other **amazing** folks
I met after I joined). For sure, this was one of the best decisions I've made in my life.

From the technologies side, I still got to work with Ruby, which I absolutely
_love_, but I got the chance to work with other tools as well, like Next.js and
TypeScript.

<aside class="Note">
  <strong class="">Quick takes:</strong>

  <ul class="">
    <li>
      <a href="https://www.typescriptlang.org/">TypeScript</a>: cool and adds a lot of sanity to JavaScript development.
      The VSCode integration is really good.
    </li>
    <li>
      <a href="https://nextjs.org/">Next.js</a>: it's slick and has great docs, but I'm still skeptical about it.
      It felt like overengineering for most cases. I still think that
      something like <a href="https://hotwired.dev/">Hotwire</a> or
      <a href="https://github.com/phoenixframework/phoenix_live_view">LiveView</a> are saner approaches
      (especially for small teams).
    </li>
  </ul>
</aside>

I'm eager for all the new things I'll learn and apps I'll work on within the following years.

[thoughtbot]: https://thoughtbot.com/
[@sarahlima]: https://twitter.com/sarahraquelsh
[josh clayton]: https://joshuaclayton.me/
[steph viccari]: https://twitter.com/sviccari
[joël quenneville]: https://twitter.com/joelquen

### Open-source

Even though I didn't release any new library this year, I did some work on
open-source. I contributed to many projects I use daily like [ViewComponent] and
[Rails]. Beyond writing code, I did more OSS things like reviewing PRs and
issues in Rails. I even wrote a blog post about [how to start contributing to
open-source](/start-contributing-to-open-source-today/) to help other folks
start doing it.

I already regularly checked [Ruby's issue tracker]. This year, though, I got
more [actively] involved in discussions about new additions to Ruby there. This
is a habit that I want to keep for a couple of reasons. First, I want to
understand the shaping of new features in Ruby, and second, I want to
help/influence this process. Doing this led me to my first three commits in
Ruby [^a] <sup>∙</sup> [^b] <sup>∙</sup> [^c].

[^a]: <https://github.com/ruby/ruby/pull/5268>
[^b]: <https://github.com/ruby/ruby/pull/5270>
[^c]: <https://github.com/ruby/ruby/pull/5277>

[viewcomponent]: https://github.com/github/view_component/pull/917
[rails]: https://github.com/rails/rails/pulls?q=is%3Apr+author%3AMatheusRich+is%3Amerged+
[actively]: https://bugs.ruby-lang.org/issues/17938
[ruby's issue tracker]: https://bugs.ruby-lang.org/issues/
[ruby]: https://github.com/ruby/ruby/pulls?q=is%3Apr+author%3AMatheusRich+is%3Amerged+

### Hobbies & Life

One of the hobbies I started in 2021 was pixel art. I did a bit of it when I was
a kid but never invested much time in it. I hope to eventually use this
ability to create sprites for my games.

<div class="flex flex-wrap flex-center gap-4">
  {%
    include figure.html
      src="2021-in-review/superman.png"
      width="300px"
      caption="That famous superhero"
  %}

  <div>
    {%
      include figure.html
        src="2021-in-review/planet.png"
        width="300px"
        caption="Studying light and shadows"
    %}

    {%
      include figure.html
        src="2021-in-review/hollow-knight.png"
        width="300px"
        caption="My favorite knight bug"
    %}

  </div>
</div>

Something that graduating from college did change was playing games
without feeling guilty. I finally experienced some of my most anticipated games
like God of War 2018, Marvel's Spider-Man, and Hollow Knight.

{%
  include figure.html
    src="2021-in-review/gaming.png"
    width="800px"
    caption="Not too many hours, but a lot more than the previous years"
%}

I felt the need to read a bit more (non-technical content), so I looked for
alternatives this year. I always had an interest in comics, but I didn't have money
to buy them as a kid, so I signed up for Marvel Unlimited. I'm having a blast
reading Ultimate Marvel!

{%
  include figure.html
    src="2021-in-review/webdev-parker.jpeg"
    width="800px"
    caption="Did you know that Peter Parker is a web developer? He needs to freshen up his DevOps skills, tho."
%}

### Health

I have a standing desk, but most of my work is sitting. I know this is not
ideal, so I decided to start working out by year-end. It's very recent, but I
have already started seeing the results.

I also had a chance to take PTO and go on some much-needed vacations! After all
this time in the pandemic, it felt good to recharge my mental health.

{%
  include figure.html
    src="2021-in-review/maceio.jpeg"
    width="500px"
    caption="One of the beautiful beaches in Maceió (AL) - Brazil"
%}

### Things I'm proud of

I'm really proud of my **consistency**. I wrote one article _every month_. It
might not look like much now, but it was quite a change from a year where I
basically hadn't written anything.

Posting one Ruby Card _every week_ was a massive effort too! And the numbers
reflect my work. I grew the Twitter account from less than 100 to over 500
followers!

The consistency made me be featured on RubyWeekly 3 times [^1] <sup>∙</sup> [^2]
<sup>∙</sup> [^3] and in the [BikeShed podcast](https://www.bikeshed.fm/309)
too!

Contributing to Rails and especially Ruby were my personal highlights of 2021.
I've always wanted to do this! I'm really pleased with those achievements.

[^1]: Ruby Cards [in RubyWeekly](https://rubyweekly.com/issues/546#:~:text=around%20the%C2%A0corner.-,%40RubyCards,-is%20a%20Twitter)
[^2]: Thread about Matz's view on what's coming after Ruby 3.0 [in RubyWeekly](https://rubyweekly.com/issues/556#:~:text=you%20can%20enjoy-,Matheus%20Richard%27s,-Twitter%20notes%20of)
[^3]: "Don't Use Comments. Use Code." [in RubyWeekly](https://rubyweekly.com/issues/568#:~:text=the%20better%C2%A0path.-,MATHEUS%20RICHARD,-%F0%9F%9B%A0%C2%A0Code%20%26%20Tools)

### Things I wish I did better

Ironically, I wish I had been more consistent with Rust. I didn't play with it
as much as I would like. For instance, I haven't implemented language-defined
macros in Lana and [several other
features](https://github.com/MatheusRich/lana/issues).

I started the year creating a
[Roguelike](https://github.com/MatheusRich/roguelike) (here's a [Twitter thread]
about it, if you're curious) but left it unfinished. I tried learning the
[Bevy](https://bevyengine.org/) game engine, but I didn't go too far. I'm not
good at balancing my liking of game development and programing language design.

<figure>
  <video class="block mx-auto rounded h-auto" src="/assets/img/2021-in-review/roguelike.mp4" width="800px" controls></video>
  <figcaption>Pretty barebones, but it was a fun project.</figcaption>
</figure>

I wish I did more pixel art. I was very excited about it, but I lost momentum by
the end of the year. It's hard to be consistent on too many things at the same
time

Talking at RubyConf was another goal of mine, but I changed jobs close to the
CFP deadline, so I missed it. That was a bummer, but I think I made the right
decision.

[twitter thread]: https://twitter.com/matheusrich/status/1397347697074610179

## 2022

My main goal with 2022 is to keep doing what went well last year and improve what didn't work.

I wanna keep getting involved in Ruby's development and keep working on my
health. I'll leave game development on hold for a while and focus on programming
languages. I specifically want to understand how type checkers work and build a
simple one.

I hope I can visit new places this year. An international trip would be fantastic,
but the pandemic might not allow me to do that.

Speaking of which, I wish we could live a COVID-free life (at least a mask-free
one), but that probably won't happen this year (and maybe neither in the next
one). Well, one can dream, right?

_Phew_! That's it for 2021. It was a surprising, weird year! I hope to see you
in 2023. Take care!
