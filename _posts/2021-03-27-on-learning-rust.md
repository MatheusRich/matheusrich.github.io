---
layout: post
title: 'On learning Rust'
date: 2021-03-27 17:46:58 -0300
categories: rust
---

As of March 26th of 2021, I decided to learn Rust. I've heard of it a couple of years ago but never
had time (i.e. priority) to dig into it. Now it's time to really understand what is it all about.

## Where I am starting

I already know --- or _think_ I know --- some things about Rust. It is a systems language, but with a
modern feel. That means:

- **It's fast:** it wants to replace C/C++ for a reason;
- **It's safe:** no `null`s here;
- **It has a nice package manager:** no more vendoring dependencies;
- **It has something about memory management:** it seems almost like type-checking, but for memory.

Those things really speak to me because I've spent the past 5 years or so doing Ruby. Don't get me
wrong, I **love** Ruby. It's my main language, I work with it every day (and in my side projects). It
really fits my way of thinking and it's my go-to tool. But, _because_ I know it so well, I know its
flaws too.

With that in mind, I wanted to have a "complementary" tool at my disposal. Instead of a
dynamically-typed, scripting language, this time I need a statically-typed, fast, compiled language.

I did some C/C++ in the past, but I feel like they're stuck in the past. I know [Crystal][crystal]
and even started to [build an interpreter][lit] with it. It was pretty easy to get started with it,
due to its _huge_ similarity to Ruby. Unfortunately, the language is still in its infancy (but I have
hope in its future). Thus, Rust became my choice.

I worked a bit with functional languages like Haskell and Elm, so concepts like monads are no scary
to me. I hope that this will make things easier for me in Rustland.

## What I am aiming for

I have no intentions to work professionally with Rust (who knows, tho? 🤷), but I think it's nice to
have different (and complementary) tools. Now I don't have performance-demanding requirements, but
when I have --- and that day _will_ eventually come --- I want to be prepared. I may even use Rust in
my current job.

My main goal is to have a fast and safe systems language to build games and interpreters. Those are
the only performance-heavy tasks that are fun to me (sorry machine learning). It's important to
stress this word: **fun**. Learning a new language is a kind of investment, and I wanted it to be
fun, so I don't feel like I'm wasting my time.

## How I'll do it

Since I have no professional goals with Rust, my study will be guided by my curiosity. That's the
way I like to study things. I'll read the docs, tutorials, make small programs and games just for
fun.

I won't establish goals, or study ours. I have a full-time job, an undergraduate thesis to finish,
and a family. This should be as fun as playing God of War on my PS4.

I'll document the process if I find something interesting to share (like differences between Rust
and Ruby in my experience), or how one language influenced how I code on the other.

## Evaluating my results

One year from now I'll write another blog post about my journey. Maybe I'll end up liking Rust very
much, maybe not. Or maybe I'll be lazy and not studying so much, after all. Anyway, if you're reading
this blog post after 2021, my impressions of one year doing Rust will be linked >>here<<.

Cya, rustaceans.

[crystal]: https://crystal-lang.org/
[lit]: https://github.com/lit-lang/lit
