---
layout: post
title: "2023 In Review"
categories: year-in-review``
description: "Going to the gym got me writing more Rust, I went to México, bought a guitar, saw a Beatle live, worked on open-source, and lots of food pictures."
toc: true
---

Another year, [another review](/categories/#year-in-review/).
There's a lot to cover, so let's get to it.

## Career

I'm still working at [thoughtbot](https://thoughtbot.com/), and I'm still very
happy about it! It's a great place to work with great people. I do not take for
granted how lucky I am to work with Ruby full-time. Every JavaScript project I
work on makes that clearer 😅.

<aside class="Note">
  <h4 id="quick-takes">Quick takes:</h4>
  <ul>
    <li>
      <p>
      <a href="https://react.dev/">React</a> + <a href="https://graphql.org/">Graphql</a> x <a href="https://hotwired.dev/">Hotwire + REST</a>: I had the
      experience of working with both this year, and I have it's not even a
      competition. With Hotwire
      <a href="https://dev.37signals.com/a-happier-happy-path-in-turbo-with-morphing/">getting better and better</a>,
      the cases for React have become very narrow. I had the pleasure of working on
      a migration of React + GraphQL to vanilla Rails + Hotwire and saw PRs with
      10x less code. It's just so much simpler! I'm not saying that React/GraphQL
      aren't useful, but I think many folks are using them when they don't need to.
      </p>
    </li>
    <li>
      <p>
       Ruby's <a href="https://react.dev/">Data class</a>: I love it! It makes creating value objects very easy, and helps with immutability too. I've used a lot on my open-source projects.
      </p>
    </li>
    <li>
      <p>
        <a href="">LLMs</a>: They became much more popular this year.
        (You can notice the difference with me referring to ChatGPT as "OpenAI" in last year's review 🙈).
        We went
        basically from having a single player in the market, to having multiple
        options (open-source and proprietary). You can even run them on your own
        <em>phone</em> now!
      </p>
      <p>The ones I used the most were:</p>
      <ul>
        <li>
          <p><a href="https://chat.openai.com/">ChatGPT</a>: very good in being a
          <a href="https://simonwillison.net/2023/Apr/2/calculator-for-words/">calculator for words.</a>
          It's very good when you can't quite turn your question into a Google search.
          I've used a lot to create Google Spreadsheet formulas out of natural language.
          From time to time I'd use it as pair buddy to help me name things. Also asking "how to do X in Rust" was very helpful, as I'm not as skilled with it as I am with Ruby.
          </p>
        </li>
        <li>
          <a href="https://github.com/features/copilot">GitHub Copilot</a>: A.k.a, a super-smart autocomplete. That's my main use for it. I didn't expect/want it to write a whole codebase for me, but it was very good at suggesting the next line (or few lines). It was very good to remind/teach me of a specific API (like methods on a given class). Unfortunately its knowledge isn't updated as often as I'd like.
        </li>
      </ul>
    </li>
  </ul>
</aside>

### Summits

This year the thoughtbot team met in person twice! It was great to see everyone
again. We had a company-wide summit at Brighton, UK, and a smaller one (for the
Americas team only) in Mérida, Mexico.

Unfortunately my favorite food place in Brighton, closed down 😭. I spent a
couple of days in London to buy a new guitar (I'll talk about that shortly).
Weirdly, it was where I had my first burrito ever.

{%
  include figure.html
    src="2023-in-review/burrito.jpg"
    width="500px"
    caption="Burrito - London"
%}

I also went to a museum, and hearing someone speak Mayan fluently was very
interesting. México felt surprisingly similar to Brazil. The people, the
streets, the houses. In Mérida, I loved my breakfasts at Merci Paseo 60. Here
are some pictures:

<div class="flex flex-wrap flex-center gap-4">
  {%
    include figure.html
      src="2023-in-review/french-toast.png"
      width="400px"
      caption="French toast - Mérida"
  %}

  {%
    include figure.html
      src="2023-in-review/eggs-benedict.jpg"
      width="400px"
      caption="Eggs Benedict - Mérida"
  %}

  {%
    include figure.html
      src="2023-in-review/og-soccer.png"
      width="400px"
      caption="Mayan World Museum of Mérida"
  %}
</div>

These summits are always great, given that we're a remote company. It helps to
build camaraderie and makes our relationships feel more real.

## Software Development

#### Setup

I didn't buy any new hardware this year, but I committed one of the biggest sins
in the software development world: **I switched to light mode**.

I was a very big fan of dark mode, and have been using One Dark Pro since I can
remember, but I read many things about how light mode is better for your eyes
(during the day) and the arguments were compelling. To be fair, I made the theme
change with my system, so at night I still use dark mode. That seems to be the
ideal set.

Here's how they look:

<div class="flex flex-wrap flex-center gap-4">
  {%
    include figure.html
      src="2023-in-review/night-owl-light.png"
      width="400px"
      caption="Night Owl Light"
  %}

  {%
    include figure.html
      src="2023-in-review/one-dark-pro.png"
      width="400px"
      caption="One Dark Pro"
  %}
</div>

#### RubyCards

Last year I wrote:

> it's exhausting to add a card every week. [...] I'll have to automate the
> creation of cards (at least partially!) in some way.

So... I didn't automate it. And I didn't had the energy to keep up with it, so I
just stopped. I'm not proud of that, but it's what happened. I feel guilty for
that, so I'll try to keep the projecting going in 2024, even if that means a new
owner.

#### RubyDF

I started a local meetup group for Rubyists in the Brazilian Federal District
(where I currently live). About 20 people showed up for the first meeting, which
I think is a good number. I'm planning nother editions in 2024. I gave my talk
on [Taming God Objects](/speaking/#taming-god-objects).

{%
  include figure.html
    src="2023-in-review/rubydf.jpeg"
    width="800px"
    caption="The first RubyDF meetup group"
%}

### Blogging

- Featured on [RubyWeekly](https://rubyweekly.com/issues/638#:~:text=My%20Adventure%20With%20Async%20Ruby)

### Open-Source

I did a fair amount of open-source work this year.

{%
  include figure.html
    src="2023-in-review/rubygems.jpg"
    width="600px"
%}

My gems got downloaded 26k times in total, which is 5k more than last year. I
released a new gem, [Code Picture], which I'll discuss further down. I opened a
few PRs on gems

I got two documentation-related PRs [^3] [^4] merged on Ruby itself. I still
have one PR open on RDoc, which _finally_ [makes the default generated template
work on mobile devices]. I hope it can get merged soon.

I did a PR [correcting some docs in Rails], and [another one][] adding a
`ModelValidator` to `ActiveModel`, and [one got rejected]. I'm confident this
will be merged in 2024. There were also a few [minor PRs] making a gem more
"hygienic" (like not polluting the global namespace)

One fun thing that happened was [a 4-year-old PR] I opened on a gem got merged.
It was probably one of my first OSS contributions, so it was emotional to see it
get merged.

[^3]: [Improve docs for how to generate documentation](https://github.com/ruby/ruby/pull/8715)
[^4]: [Add documentation for IO#cursor](https://github.com/ruby/io-console/pull/50)
[makes the default generated template work on mobile devices]: https://github.com/ruby/rdoc/pull/1025
[minor PRs]: https://github.com/vkononov/fillable-pdf/pulls?q=is%3Apr+author%3AMatheusRich+is%3Aclosed
[correcting some docs in Rails]: https://github.com/rails/rails/pull/49712
[a 4-year-old PR]: https://github.com/adammck/minitest-stub-const/pull/14
[another one]: https://github.com/rails/rails/pull/49534
[one got rejected]: https://github.com/rails/rails/pull/49703

#### Gold Miner

This year I open-sourced [Gold Miner][]. It is a tool that turns interesting
messages on thoughtbot's Slack into blog posts. It was something I started last
year, but I made it public in 2023. I also added a bunch [^1] [^2] of
optimizations using [async Ruby][async] (basically making HTTP requests in
parallel). I did [similar][] optimizations to [end_of_life][], and got 10x
faster ([from 25s to 2.5s][similar])!

I did a series of refactoring too in the code to make it more maintainable.
After a while, the code was getting very entangled: the Slack Client class had
to know about people's names and links to their profiles, so this was an obvious
sign that things weren't right.

I broke down the whole flow in a series of objects that colaborated in a
pipeline, while also [trying to be consisted with the metaphor][] of mining
gold. I ended extracting [gold nuggets][], [gold containers][], [explorers][],
[smiths][], and [distributors][]. Not only that creates a stronger metaphor, but
also helped the code to be more maintainable. And, of course, I wrote a total of
13 articles using this tool.

#### Code Picture

I has this silly idea in mind for a while, but when I saw that the new Ruby
parser, [Prism][], it was the perfect time to do it. I started it in a Friday
night I had free (like most of my open-source LOL).

There isn't much to say here, it turns your code into pixel art. I [wrote about
it][] (in 2024) in the thoughtbot blog. Here's an example:

{%
  include figure.html
    src="2023-in-review/code-picture.jpg"
    width="400px"
%}

See that there's a repeating pattern in the upper portion of the image? That's a
Rails model with a bunch of `has_many :association, dependent: :destroy`
declarations. I wonder if there are "analyzes" I could do with this kind of
visualization.

## Life & Hobbies

### Italian

I still kept learning Italian in 2023. In the first few days of the year I did``
my first Italki class in Italian. I was very excited, and I didn't think I'd be
able to talk for 30mins in another language. Of course, here and there I asked
how to say a word, and I was very happy with my progress.

I tried using Omegle/Ome.tv to talk to people in Italian, but it was... kind of
terrible. Just random people skipping or showing their genitals. I don't know
what else I expected from talking to strangers on the internet...

I did find some Italians, but it's hard to find someone willing to talk
(especially with a beginner). Many were helpful, recommending movies, music, and
stuff. They were always surprised to see that I was learning Italian (even though
I have no family ties to Italy).

By the middle/end of the year I slowed down a bit, mostly relying on Duolingo.
I'm still learning, but not as much as I'd like to. I can understand a lot, but
speaking complex sentences is still hard (past and future tenses are
challenging).

{%
  include figure.html
    src="2023-in-review/duolingo.jpeg"
    width="600px"
    caption="My Duolingo progress"
%}

I study for about 20% less minutes than last year, got about 50% less XP, but
still managed to learn 2.2x more words. All that happened in a total of 306
unique days (84% of the year). I hope I can get to travel to Italy, so that will
be a good motivation to study more.

### Music

2023 was probably the most "musical" year of my life. I didn't stream as much,
but I compensated by going to a lot of concerts and playing a lot more.

#### Concerts

The year I went to the most concerts in my life! I went to 5 concerts in total:

1. **Coldplay (2023/03/13):** My wife loves Coldplay, so I went with her. Very
   good concert, they play several of their hits, with a good mix of old and new
   stuff. The smaller stage in the middle of the crowd was a nice touch.
1. **Selvagens à Procura de Lei (2023/10/01):** My favorite Brazilian indie
   band. I always go to their concerts when they're in town and they never let
   me down.
1. **Red Hot Chili Peppers (2023/11/07):** A dream come true. This was the first
   concert from a big international I really like band I went to. Seeing John,
   Flea, Chad, and Anthony doing their thing live was amazing! It's a very weird
   feeling after having watched so many videos of them before. They even played
   gems like Wet Sand, so definitely bucket list material.
1. **Taylor Swift (2023/11/25):** This was my wife's long-time dream. I'm not
   the biggest Swift fan, but I've been listening to her stuff for over a decade
   now, so I do know several songs. I don't even need to mention the whole
   spectacle her concert is. The crowd was screaming every song so loud! I wish
   there was more Speak Now songs, but she played Safe And Sound, which was a
   nice surprise. It was also very touching seeing my wife having this moment.
1. **Paul McCartney (2023/11/30):** This one wasn't planned at all! Paul's
   production invited a few random students from my music school for the
   soundcheck, and I was one of them! It was basically a 1h concert for a few
   dozen people. What else can one ask for?

{%
  include figure.html
    src="2023-in-review/paul-mccartney.jpg"
    width="400px"
    caption="Me and a Beatle"
%}

#### Streaming

My streaming numbers went down a bit, again. Not that I care about that number
being high, I just noted I didn't listen to music as much while deep-working.
2023 was the first year I got Jazz in my top 5 genres.

<div class="flex flex-wrap flex-center gap-4">
  {%
    include figure.html
      src="2023-in-review/music-genres.jpeg"
      width="300px"
  %}

  {%
    include figure.html
      src="2023-in-review/music-summary.jpeg"
      width="300px"
  %}
</div>

I was kinda obsessed with Daft Punk for a while. Give Life Back to Music is so
damn fun to play on guitar, so that was my most streamed song. Linkin Park
dropped the 20th anniversary edition of Meteora, and I particularly enjoyed the
"new" songs. I also listened to a lot of Autumn Leaves, the beginner-classic
Jazz standard. And, of course RHCP was my #1 artist.

<div class="flex flex-wrap flex-center gap-4">
  {%
    include figure.html
      src="2023-in-review/music-top-artist.jpeg"
      width="300px"
  %}

  {%
    include figure.html
      src="2023-in-review/music-top-song.jpeg"
      width="300px"
  %}
</div>

Interesting that Spotify noted that I tend to listen to albums back-to-back.
Call me old, I guess.

{% include aside.html type="info" content=" I requested my all-time listening data from
  Spotify and it'll take about 30 days for them to get back to me. I'll update
    with a few more stats once I get that." %}

#### Music School

At Music School, this year we really start to get into jazzy stuff. I learned a
few of the classic standards like Blue Bossa, Autumn Leaves, and Just Friends. I
finally broke out of minor/major pentatonic & major scales, and learn new
tricks: the minor harmonic and Maj7 arpeggios (and how to use them over different
chords).

I started my first class in which I play with a full band. I was looking forward
to that for a long time, and it's been great! I had a presentation at the end of
the year where we played a Bossa Nova version of Isn't She Lovely and a
Brazilian tune called Mistério do Planeta. That was my first concert in about 4
or 5 years. All of that gear I bought during my whole life was finally used live!

{%
  include figure.html
    src="2023-in-review/music-school.jpg"
    caption="My first concert in a long time"
%}

#### Gear

I bought a new guitar! It's been almost 8 years since my last one. I already had
a Strat, so I went with the perfect pair: a Les Paul. It also helped on music
school since humbuckers are more fitting for Jazz/Bossa than single-coil pickups.
I fell in love with an Ebony Epiphone Custom Pro, so I took it home.

It's nice to have a similar looking guitar to some of my guitar heroes:

<div class="flex flex-wrap flex-center gap-4">
  {%
    include figure.html
      src="2023-in-review/les-paul-daniel-johns.jpg"
      width="400px"
      caption="Daniel Johns"
  %}

  {%
    include figure.html
      src="2023-in-review/les-paul-john-frusciante.jpg"
      width="400px"
      caption="John Frusciante"
  %}
</div>

Aside from that, I sold my cheap Klon clone and a fuzz pedal I wasn't feeling. I
bought a JHS Angry Chalie clone, which is a very nice distortion. I'm happy I
spent time using these things outside of my bedroom. Here's the 2023 timeline of
my music gear:

{% include figure.html
  src="2023-in-review/music-gear-timeline.png"
  caption="I just realized it's almost 10 years since I bought my first guitar"
%}

And here's the whole crew:

{% include figure.html
  src="2023-in-review/music-gear.jpg"
  caption="A bigger apartment helped managing all this gear" %}

### Exercising

started, then got my hand cut (2023/06/03) and stopped. Got back 4 months later (2023/10/03)

### Gaming

I had a lot going on this year, so gaming wasn't a priority for me. The numbers
below show that. I even started playing/studying chess again, but I had too much
on my plate, so I stopped after a few months.

<div class="flex flex-wrap flex-center gap-4">
{%
  include figure.html
    src="2023-in-review/playstation-hours.jpeg"
    width="260px"
    caption="Total hours played"
%}

{%
  include figure.html
    src="2023-in-review/playstation-total-games.jpeg"
    width="260px"
    caption="Total games played"
%}

{%
  include figure.html
    src="2023-in-review/playstation-top-game.jpeg"
    width="260px"
    caption="The game I played the most"
%}
</div>

I played 10 games in total, for about 108h. This is about 53% less than last year.

{%
  include figure.html
    src="2023-in-review/gaming-hours-played.png"
    width="600px"
    caption="The game I played the most"
%}

Most of that was me Playing God of
War 2018 while waiting for Ragnarok to come out. Then I played Ragnarok, and I
think those were the only games I finished this year. I started Ghost of
Tsushima, but didn't finish it yet.

## Expectations x Reality

> 2022 felt like the year of music to me. [...] I believe that a big part of
> this year will be similar.

Yup! I was on right on the money here. Although this year was less fiddling with
toys by myself and more using them to make music. Isn't that the whole point?

> Exercise! Sports, gym, whatever it is, I need to move this lazy body.

Sort of. I did start going to the gym, but wasn't as consistent as I'd like to.

> I do want to keep on working on core Ruby. TBH, contributing to CRuby feels
> too far off from my skill set. Maybe I can work on supporting things like
> documentation.

...

> Keep my work/life balance.

I'm glad there's nothing to worry about here.

> Work on something fun! Language development, games, something else?

Yes! I did silly things like [Code Picture][] and my training parser in Rust. As
long as I'm having fun, I'm happy.

## Writing This Article

- how much time did it take?
- I took the time to automate things
  - Generate charts automatically with Rust
  - Generate charts from blog posts data
  - A todo script

this should help me writer faster next year

While writing, I often got frustrated with the limitations of Liquid. Multiple
times I had to resist the urge to rewrite this blog with something else. I like
Jekyll, but I really miss ERB. I'll look into how to use ERB with Jekyll as soon
as I publish this article. The hand-written CSS is also giving me a headache.
I'll look into Tailwind CSS as well.

## 2024 Goals

- Go to the gym at least 3 times a week (median)
- Get more involved with Ruby
  - Keep the Meetup going
  - Keep showing up to the issue tracker and other kinds of discussions
  - More PRs to Ruby. At least docs.
- Keep working with Rust
  - Maybe exploring Gleam.
- Keep doing fun things with software
  - Get back to PL design/development
  - Talk on conferences
- More music gigs!

[Gold Miner]: https://github.com/thoughtbot/gold_miner/
[mining gold]: https://thoughtbot.com/blog/mining-gold-in-digital-conversations
[async]: https://github.com/socketry/async
[Code Picture]: https://github.com/MatheusRich/code_picture
[similar]: https://github.com/MatheusRich/end_of_life/pull/19
[end_of_life]: https://github.com/MatheusRich/end_of_life
[^1]: [Create blog posts parts asynchronously](https://github.com/thoughtbot/gold_miner/pull/15)
[^2]: [Fetch slack messages asynchronously](https://github.com/thoughtbot/gold_miner/pull/31)
[trying to be consisted with the metaphor]: https://journal.stuffwithstuff.com/2009/06/05/naming-things-in-code/#:~:text=If%20you%20use%20a%20metaphor%2C%20use%20it%20consistently.
[gold nuggets]: https://github.com/thoughtbot/gold_miner/pull/34
[gold containers]: https://github.com/thoughtbot/gold_miner/pull/39
[explorers]: https://github.com/thoughtbot/gold_miner/pull/33
[smiths]: https://github.com/thoughtbot/gold_miner/pull/40
[distributors]: https://github.com/thoughtbot/gold_miner/pull/42
[wrote about it]: https://thoughtbot.com/blog/turn-your-code-into-pixel-art
[Prism]: https://github.com/ruby/prism
