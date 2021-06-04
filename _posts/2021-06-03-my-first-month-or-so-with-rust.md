---
layout: post
title: "My First Month (or so) With Rust"
series: On Learning Rust
date: 2021-06-03 22:21:25 -0300
categories: rust learn-in-public
---

I'm learning Rust and this is the first post about my experience with it. I'm a Ruby programmer,
so you may wanna check out [my post about the decision of learning Rust][learning] for more
background.

I delayed this post a lot because I didn't do a lot of Rust in my first month. I had
several things going on in my life, so I couldn't focus on Rust as much as I would like. Anyway, I
know that I have to put on paper some of my impressions before I forget them, so here I am.

## 🔧 Setting up

Setting up Rust was very easy: `rustup` makes everything pretty straightforward, so I had no problems
here. `Cargo` is also very good, and I had no problems installing libraries (crates) too! Well done,
Rust!

## 📚 Reading

As I didn't have much time to actually *code* Rust, I spent a lot of time _reading_ about it.
Regarding this, Rust is the language with **best learning tools I've seen** to this day! Not only it
has [a book][the-book] (_The_ Book, I must say 😅) that guides you in the first steps to know the
language and its unique features, but Rust also has a [Learn by Example][by-example] book!

I think that this is a very nice pairing and both books are awesome in their way:

- **Wanna start from scratch and learn about a concept?** Check out [The Book][the-book].
- **Just want to know the syntax for creating an anonymous function?** Here's a book [full of
  examples][closures].

Chapter 04 (the one about Ownership) of The Book was especially great for me. My mind was blown
after reading it. Not because it was hard to read, but because everything made SO MUCH sense! All
the pain points in C++ seemed to be solved with this ✨_magical_✨ compiler. Well, that was in theory,
let's see how I did in practice, tho.

## ✍️ Writing

I know that I should pick a simple topic to get me started when learning a new language, but I can't
control my desire to _create things_. I don't like to create _build-and-throw-away_ things, either.
They should be useful things (at least to me)! So, to learn Rust I [started building an
interpreter][interpreter] following [Lisperator.net's tutorial][tutorial-lang].

To be honest, my first 100 lines of Rust were the basic algorithms in Chapters 01 and 02 of The
Book, just to test out my setup and get to know a bit of the syntax. Four-space tabs and semicolons
everywhere were kinda weird for me, but at least Rust doesn't require explicit returns (and can
avoid semicolons in the last expression too). `rustfmt` was a neat addition, since I don't have to
care about how my code should be indented. 👍 for Rust here too!

I was looking for things that were different in Rust and Ruby. Here are some examples of what I
found:

### 🔢 Underscores and numbers

Rust, like Ruby, allows underscores to separate numbers. The difference is that Rust allows multiple
underscores (you can even have trailing ones):

```rust
// Both examples work like a charm in Rust
let a = 1_;
let b = 1_____2;

// SyntaxError in Ruby: trailing `_' in number
a = 1_

// SyntaxError too
b = 1_____2
```

### ❓ Rust has no ternary operator

We can use `if/else` expressions --- which I'm very familiar with, coming from Ruby ---, so I didn't care
not having it in Rust.

<figure>
  <img loading="lazy" style="display: block; margin: 0 auto;" src="/assets/img/first-month-rust/gimme-ternary-or-die.png" alt="Gimme ternary or die!">
  <figcaption>Although this feature may be <span class="italic">very valuable</span> for some users...</figcaption>
</figure>

### 📏 Ranges are not inclusive

To _me_ this was weird because it's not the same I'm used to in Ruby:

```rust
println!("{}", (1..10).count()) // => 9
```
<p style="text-align:center;color:#5e5e5e;font-size: 0.9em;margin-top:-25px;">Ranges in Rust</p>

```ruby
puts (1..10).count # => 10
```
<p style="text-align:center;color:#5e5e5e;font-size: 0.9em;margin-top:-25px;">Ranges in Ruby</p>


I guess I'll do some off-by-one errors until getting used to this. I found out later that there's an
inclusive version of ranges too:

```rust
println!("{}", (1..=10).count()) // => 10
```

All in all, it was not _that_ different from Ruby. Yeah, Rust is a "curly braces language", but with
things like `enums` and `impl`, I could translate my OOP code fairly well. The [Gentle Introduction
To Rust][gentle] chapter on OOP was particularly helpful for that.

The main difference from Ruby for me was that in Rust I feel like I have to think about memory usage
in **each** line of code I write.

### ❌ Learning by error

Generally, Rust gave me really good compiler error messages. The fact I can run `rustc --explain
SOME_ERROR` and see details for this error makes learning Rust (without leaving the terminal) much
easier.

The [stdlib documentation][stdlib] seems thorough and very modern: it has links for return types,
traits, enums, tips, and examples.

### 🤝 The compiler is my friend

After a long time writing in an interpreted dynamic typed language like Ruby, Rust's compiler was a
breath of fresh air. It's **so good** to know that I got a type checker having my back when I screw
things up. I feel like I have to write fewer tests but still have the feeling that everything is
working.

Another difference is the lack of `null` values 🙌. This is one of my favorite choices in Rust
comparing to C++. Option types are much better IMO and having pattern matching makes dealing with
them quite easy. About that, some constructors were **really well** thought out, like: `enums`, `if let`,
`while let`. They are cohesive and fit the language like a glove.

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

I don't know if having the string inside the function is a good idea or if I should extract it into
a constant or something. And that kind of question happened a lot:

### 🤔 A lot of questions

As a beginner, I don't know what are the best practices and idioms in Rust, so I had a lot of
questions to ask. I had some classic beginner stuff like how to work with `modules` and the `String`
vs `str` vs `&str` dilemma (which [this blog post][rust-str] and my rustacean friend
[@PotHix](http://github.com/pothix) helped me to understand), and I'm expecting to have even more
questions about memory management and that kind of stuff.

I also don't know when to move and when to borrow values, so I'm defaulting to borrow all the
things and cloning defensively.

I just found out [📎 Clippy](https://github.com/rust-lang/rust-clippy), which I think is kinda like
[👮‍♂️ Rubocop][rubocop] for Rust, so I hope it will help me to write better Rust code.

## 🔮 Future

I plan to keep writing my interpreter in Rust to learn more about this language. One thing I didn't
explore yet is testing. Since I'm a [big fan of TDD][tdd] I hope Rust has a good test support. I
have an interest in digging a bit in game development with the [Bevy game engine][bevy].

I'll also make a post comparing Rust with [Crystal](https://crystal-lang.org/) showing my experience
with both languages.

Oh, and if you're a rustacean, feel free to give me any advice or tip you think is useful! Bye 🦀!

[the-book]: https://doc.rust-lang.org/book/
[by-example]: https://doc.rust-lang.org/rust-by-example/
[closures]: https://doc.rust-lang.org/rust-by-example/fn/closures.html
[interpreter]: https://github.com/MatheusRich/lambda-lang
[tutorial-lang]: http://lisperator.net/pltut/
[rubocop]: https://rubocop.org/
[gentle]: https://stevedonovan.github.io/rust-gentle-intro/object-orientation.html
[stdlib]: https://doc.rust-lang.org/std/index.html
[rust-str]: https://www.brandons.me/blog/why-rust-strings-seem-hard
[bevy]: https://bevyengine.org/
[tdd]: {% post_url 2021-01-18-a-simple-way-to-get-started-with-tdd %}
[learning]: {% post_url 2021-03-27-on-learning-rust %}