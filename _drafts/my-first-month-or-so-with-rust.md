---
layout: post
title: "My First Month (or so) With Rust"
series: On Learning Rust
date: 2021-06-01 11:52:53 -0300
categories: rust learn-in-public
---

I'm learning Rust and this is the first post about my experience learning it. I'm a Ruby programmer,
so you may wanna check out [my post about the decision of leaning Rust][learning] for more
background.

I delayed this post a lot because I didn't actually do a lot of Rust in my first month. I had
several things going on in my life, so I couldn't focus in Rust as much as I would like. Anyway, I
know that I have to put on paper some of my impressions before I forget them, so here I am.

## 🔧 Setting up

Setting up Rust was very easy: `rustup` makes everything pretty straightforward, so I had no problems
here. `Cargo` is also very good, and I had no problems installing libraries (crates) too! Well done,
Rust!

## 📚 Reading

As I didn't have much time to actually *code* Rust, I spent a lot of time _reading_ about it. And
regarding this, Rust is the language with **best learning tools I've seen** to this day! Not only it
has [a book][the-book] (_The_ Book, I must say 😅) that guides you in the first steps getting to
know the language and its unique features, but Rust also has a [Learn by Example][by-example] book!

I think that this is a very nice pairing and both are awesome in their own way:

- **Wanna start from scratch and learn about a concept in depth?** Check out the Rust Book.
- **Just want to know the syntax for creating a anonymous function?** Here's a book [full of
  examples][closures].

Chapter 04 (the one about Ownership) of The Book was especially great for me. My mind was blowned
after reading it. Not because it was hard to read, but because everything made SO MUCH sense! All
the pain points in C++ seemmed to be solved with this ✨_magical_✨ compiler. Well, that was theory,
let's see how I did in practice, tho.

## ✍️ Writing

I know that I should pick a simple topic to get me started when learning a new language, but I can't
control my desire to _create things_. I don't like to create _build-and-throw-away_ things, either.
They should be useful things (at least to me)! So, to learn Rust I [started building an
interpreter][interpreter] following [Lisperator.net's tutorial][tutorial-lang].

- 4 spaces tabs and semicolons
- at least I dont need explicit returns (and can avoid semicolon!)
- Very nice documentation
- Weird having to think about memory in every line of code

from OOP

- no null 🙌
- Some constructors are really well thought out: enums, if let, while let. They fit as glove.

- It's really nice to know that I got a typechecker having my back. I feel like I have to write less tests

### 🦀 Rusty Code

It's funny to learn a new language because I can't tell what is idiomatic or not yet. For example,
while coding my interpreter, I create the following function:

```rust
fn is_punctuation(c: &char) -> bool {
    ",;(){}[]".contains(c.clone())
}
```

I used `clone` to satisfy the compiler, but I had the feeling that it was unnecessary. Later I ended
up refactoring it to this version (which I _think_ is better):

```rust
fn is_punctuation(c: &char) -> bool {
    ",;(){}[]".contains(*c)
}
```

### 🤔 A lot of questions

- kinda confused about modules
- String vs &str vs str?
- String confusion is a bit better
  - Thanks to [this blog post](https://www.brandons.me/blog/why-rust-strings-seem-hard) and my
    rustacean friend [@PotHix](http://github.com/pothix)

I also don't know when to move and when to borrow values I'm defaulting to borrow all the things



I just found out 📎 [Clippy](https://github.com/rust-lang/rust-clippy), which I think is kinda like
[Rubocop][rubocop] for Rust, so I hope it will help me to write better Rust code.

## 🔮 Future

I plan to keep writing my interpreter in Rust to learn more of this language. I have a interest in
digging a bit in game development with the [Bevy game engine](https://bevyengine.org/).

I'll also make a post comparing Rust with [Crystal](https://crystal-lang.org/) showing my experience
with both languages.

If you're a rustacean, feel free to give me any advice or tips you think it's useful! Bye 🦀!

[the-book]: https://doc.rust-lang.org/book/
[by-example]: https://doc.rust-lang.org/rust-by-example/
[closures]: https://doc.rust-lang.org/rust-by-example/fn/closures.html
[interpreter]: https://github.com/MatheusRich/lambda-lang
[tutorial-lang]: http://lisperator.net/pltut/
[rubocop]: https://rubocop.org/
[learning]: {% post_url 2021-03-27-on-learning-rust %}