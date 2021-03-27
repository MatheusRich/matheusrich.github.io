---
layout: post
title: "On learning rust"
date: 2021-03-26 19:49:41 -0300
categories: rust beginner
---

As of March 26th of 2021, I decided to start learning Rust. I've heard of it a couple of years ago,
but never had time (i.e. priority) to dig into it. Now it's time to really understand what is it
about.

I already know - or I _think_ I know - some things about it. Rust is that it's a system language,
but with a modern feel, so:

- **It's fast:** it wants to replace C/C++ for a reason;
- **It's safe:** no `null`s here;
- **It has a nice package manager:** no more vendoring dependencies;
- **It has something about memory management:** It seems almost like type-checking, but for memory.

Those things really speak to me because I've spent tha past 5 years or so doing Ruby. Don't get me
wrong, I **love** Ruby. It's my main language, I work with it everyday (and in my sideprojects). It
really fits my way of thinking and it' my go-to tool. But, _because_ I know it so well, I know it's
flaws too. So, I wanted to have a "complementary" tool at my disposal. Instead of a dynamic-typed,
scripting language, this time I wanted to learn a statically-typed, fast, compiled language.

I did some C/C++ in the past, but I feel like they're stuck in the past. I know [Crystal][crystal]
and even started to [build a interpreter][lit] with it. I was pretty easy to get started, since it's
_very_ similar to Ruby, but it is still in its infancy. Thus, Rust was my choice.

[crystal]: https://crystal-lang.org/
[lit]: https://github.com/lit-lang/lit