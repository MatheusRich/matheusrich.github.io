---
layout: post
title: 'Rust After One Year'
series: On Learning Rust
date: 2022-03-14 23:36:11 -0300
categories: rust
description: One year ago, I decided to learn Rust. This is how I feel about it 12 months later.
---

It doesn't feel like I've been doing Rust for [a whole year][]. It's a shame, but I wrote a lot less
Rust than I would've liked. I had no plans, but I [changed jobs][], moved to a new house and took a
well-deserved vacation in 2021. It was my first experience working mainly in a second language,
which [had its challenges][], so Rust ended up not being my first priority.

Nevertheless, time's up, so here's how I feel about Rust after one year.

[had its challenges]: https://thoughtbot.com/blog/working-in-my-native-language-requires-empathy

## From Ruby to Rust

I tried to transfer a lot of my Rubyisms to Rust without success. Using hashmaps is a lot less
ergonomic in Rust. Combine that with having no keyword or default arguments too. Creating one-off
structs/enums for a bunch of stuff felt a bit tedious, but maybe it's for the better.

I learned how to work with these limitations and what's the Rust way to do them (I'll write about
it), and I understand why things are this way, but that required some time to adapt. Rust kept
reminding me why it is a systems programming language.

## How I approached it

I started reading a few chapters of [The Book][], then I moved on to something practical. I'm into
creating interpreted programming languages, so I decided to give this a go with Rust. I picked the
[Lisperator's net](https://lisperator.net/pltut/) tutorial, which is originally in JavaScript, so it
wouldn't be a problem translating from one language to another --- I _thought_.

Things were going well until I had to implement Environments, where interpreters store variables.
They're similar to linked lists, and that [seems to be a common problem][] for beginners.

[The Book]: https://doc.rust-lang.org/book/
[seems to be a common problem]: https://rust-unofficial.github.io/too-many-lists/

- I did most of the [Lisperator's net](https://lisperator.net/pltut/) tutorial but failed to implement environments correctly.
  - Could not implement a linked list
  - Tried something with references but got lifetimes everywhere and suddenly I didn't know what I
    was doing.
  - After a couple of days of failures, I declared bankruptcy and stopped this project. Note to self: start with some tutorials in the lang before trying to translate other language tutorials without know the current language lol
- Started RISP and it was _FAAAR_ easier to follow. Now I'm even extending the language because it's
  fun (and I really dug a LISP lang so I started copying Clojure's features);

{%
  include figure.html
    src="rust-one-year/rust-1-matheus-0.png"
    width=600
    caption="My goodbye commit to that repo"
%}

Now I'm working through [Crafting Interpreters][] in Rust. It's challenging to follow a tutorial in
a different language, but I am more confident now than I was in the Lisperator's tutorial.

I really like enums and pattern matching. To me, those are some of the best features of Rust.

I enjoy how safe the code feels. The compiler errors are generally very good, but sometimes you can
get into the weeds of blinding following it, adding lifetimes everywhere just to get a different
error in the end.

Given my Ruby background, I still feel like Rust is _a bit_ too low level for me. I kinda wish there
was a version of it with a <abbr title="Garbage Collector">GC</abbr>. That language would be so much
better than Go, for example. I know the borrow checker and friends are the main point of Rust, but
I've been spoiled by Ruby and Crystal

## What the `Future`.`await`s

I'm enjoying Rust and I wanna keep learning it.

Although I ain't a fan of [function colors][], I need to get started with async Rust.

[function colors]: https://journal.stuffwithstuff.com/2015/02/01/what-color-is-your-function/

I went too deep into the practice and maybe not enough into theory. It might be time to swing the
pendulum in the other direction.

<blockquote>
  <p>
    If you find that you're spending almost all your time on theory, start turning some attention to practical things;
    it will improve your theories. If you find that you're spending almost all your time on practice, start turning some
    attention to theoretical things; it will improve your practice.
  </p>

  <p><cite>Donald Knuth</cite></p>
</blockquote>

[a whole year]: {% post_url 2021-03-27-on-learning-rust %}
[changed jobs]: {% post_url 2022-01-29-2021-in-review %}
