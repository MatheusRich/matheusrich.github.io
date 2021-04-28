---
layout: post
title: 'Rust-stuff'
date: 2021-04-01 22:34:29 -0300
categories: rust
---

### 2021/04/01

I always look for things that may not exist in a language

- No ternary operator. That's okay, with if-expressions is pretty nice (and natural, coming from Ruby).

  - It seems to be highly necessary for some people:
    <img loading="lazy" style="display: block; margin: 0 auto;" src="/assets/img/rust.png" alt="">

- return last line by default (similar to Ruby)

### 2021/04/09

Unlike Ruby, rust allow trailing (and multiple) underscores in numbers:

```rust
// Both examples work like a charm
let a = 1_;
let b = 1_____;
```

```ruby
a = 1_
# SyntaxError: trailing `_' in number

b = 1__2
# Syntax error too
```

### 2021/04/12

I'm studying through the Rust Book. The Chapter 04 is about Ownershipt. My mind after reading the
ownership rules: 🤯. They make SO MUCH sense (I'm just reading, tho). All the pain points in C++
seems to be solved with this magical compiler. Let's see how easy will be coding in it tho.

**Differences with Ruby:** Ranges end value is not included. To me this is weird because

```rust
println!("{}", (1..10).count() // => 9
```

### 2021/04/12

I decided to start learning Rust by (I know, I should've picked somthing simple, but I don't like
putting effort in something "not usable") building a LISP (Make a Lisp)

#### 2021/04/24

- 4 spaces tab is hurting me
- Weird having to think about memory in every line of code
- kinda confused about modules
- when I should borrow and when I should move? My default is borrow everything
- String vs &str vs str?
- It's really nice to know that I got a typechecker having my back.
- Some constructors are really well thought out: enums, if let, while let. They fit as glove.

#### 2021/04/27

- String confusion is a bit better
  - Thanks to https://www.brandons.me/blog/why-rust-strings-seem-hard and [@PotHix](http://github.com/pothix)