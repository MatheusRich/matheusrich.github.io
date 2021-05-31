---
layout: post
title: 'Different Ways to Contribute to Open Source'
date: 2021-04-25 22:17:04 -0300
categories: oss beginner
---

OSS is a wonderful thing! I was so grateful for the things I used that I started contributing to OSS
as a retribution! If you want to get started with OSS contributions, here's several ways to do it.

In each section I'm going to present a topic, explain it, and link some Pull Request that I did in
that "category" so you can take a look to get inspired/learn something.

## 🐛 Bugfixes

If you fix a bug, maintainers will **love** you. It can be a bug you found, or a issue tagged with a
[`bug`][bug-issues] label. It is a good opportunity to fix that 1px misaligned item that is
bothering you since forever.

Or maybe you tried something and it didn't work quite well on your machine. If you figure out what
went wrong, **don't keep it to yourself**! Open a PR!

Some bug fixes I did:

- [Ameba GH Action - Prevent linter to run on external libraries code](https://github.com/crystal-ameba/github-action/pull/9)
- [Ameba - Handle duplicated files when running linter](https://github.com/crystal-ameba/ameba/pull/151)

## ✨ New features

Do you wish that a library did X for you? Don't expect maintainers will do it for you. Code it and
submit a PR! Maybe you already have something in your codebase that could be pushed upstream. That
is what happened with the following contributions:

- [RSpec - Allow ordering specs by modification time](https://github.com/rspec/rspec-core/pull/2778)
- [Long Haul - Add support for disqus comments](https://github.com/brianmaierjr/long-haul/pull/78)
- [tiptap - Add support to history custom settings](https://github.com/ueberdosis/tiptap/pull/213)
- [mintest-stub_any_instance - Allow stubbing without a value](https://github.com/codeodor/minitest-stub_any_instance/pull/13/files)

That is one of the nicest things about open source: you can contribute back to projects that helped
you! You may open an issue first, asking maintainers if they like your feature idea.

## ⚡ Improve performance / Refactor code

If you're experienced in a language you probably know some patterns or methods that are more performant than others,
i.e, they run faster and/or with less memory. For instance, in Ruby using `each + push` [is slower][each-map] than using
`map`. This is an opportunity to find those patterns and replace them with the more performant alternatives. When you do
this kind of contribution, don't forget to add benchmarks to your PR to make it more compeling.

You can do some refactoring too: deleting unused code, fixing deprecation notes/methods, untangling some nested
`if/else` with [guard clauses][guards], etc. Making the code easier to read is important to add new features and finding
bugs in the future.

Here's some PRs I did for [Ruby on Rails](https://rubyonrails.org/) in this category:

- [Replace `gsub` with `tr`](https://github.com/rails/rails/pull/42054)
- [Replace `map + compact` with `filter_map`](https://github.com/rails/rails/pull/42053)
- [Reduce memory allocations](https://github.com/rails/rails/pull/41335)

## 🧪 Add tests

Tests make us feel more confident about the code we write and the changes we make. Well tested OSS benefits everyone
using it! So, you can help yourself and the whole community by adding tests to a project! Adding a test coverage tool is
another way to contribute in this topic. Setting up a coverage tool helps to understand which areas of the core aren't
tested.

This was exactly what I did for `gem-web`. I added [simplecov](https://github.com/simplecov-ruby/simplecov) and with the
coverage tool properly configured, I added tests for the missing parts:

- [gem-web - Add test coverage tool](https://github.com/bitboxer/gem-web/pull/5)
- [gem-web - Add tests](https://github.com/bitboxer/gem-web/pull/6)

## 🐋 DevOps

Adding a Docker/Docker Compose setup is a nice way to help newcomers onboard a project, especially when the project is
an app with several moving parts (core, database, cache services etc). Setting up all that may be hard, but running
`docker-compose up` is _far_ easier.

There's other things you can contribute: almost every project nowadays has a Continuous Integration (CI) pipeline
(Gitlab CI, GitHub Actions, Travis CI, Circle CI, Jenkins etc). Setting up a pipeline is an contribution in itself, but
you can go further and set up linters, security checks and even a staging build in some cases!

Here's an example of a PR where I introduced a Dockerfile as an alternative setup build script:

- [zynaddsubfx - Add Dockerfile](https://github.com/zynaddsubfx/zyn-fusion-build/pull/29)

## 👩‍💻 OSS is more than code!

As developers we love to code, but OSS is far beyond just coding! Maintainers have to deal with a variety of different
problems: documentation, helping beginners, handling poor written issues, spams, reviewing Pull Requests, etc. We can do
OSS by helping them with these tasks!

### 👍 Reviewing PRs

You don't need to be a maintainer to do that! I took much time to understand this. Reviewing PRs also helps the
contributor to not feel bad about their work not being reviewed for many days, and you help address issues faster
(typos, changing naming, refactorings, adding docs, etc). Just **be kind** and helpful. Here's [more tips on good code
reviews](https://stackoverflow.blog/2019/09/30/how-to-make-good-code-reviews-better/).

### 🕵️‍♂️ Reproducing issues

If you've been part of a reasonably used OSS project, then you know how hard is to handle issues. Many of them don't
even have enough information to reproduce and diagnose its causes. Help maintainers by trying to reproduce issues. You
may have to ask users for more information (OS, language, library versions, for example), or steps to reproduce it.
Sometimes the behavior is not a problem, but a deliberate choice.

### 📝 Improving documentation

(Readme, fix typos, rewrite confusing sections, add docs where it's missing) Improve as you read

- [Lucky - Fix long links in small screens](https://github.com/luckyframework/website/pull/305)
- [Crystal Book - Use simpler algorithm in docs](https://github.com/crystal-lang/crystal-book/pull/394)
- [Amber - Fix broken links in README](https://github.com/amberframework/amber/pull/1153)

### 🎨 Use your imagination!

As I said earlier, OSS is not only about code! Any skill you have may be useful to someone! If you're a musician or
artist, for example, there's plenty of things you can contribute to. Here's an example of a PR where I created a logo
for a project of a friend of mine:

- [Commit Helper - Add logo](https://github.com/andre-filho/commit-helper/pull/27)

## 🎯 General advices

- **Read contributing guide and code of conduct** This should be your first step before actually doing some
  contribution. Reading those guidelines will help you understand what contribution are accepted, how to make them, and
  what is necessary for approving them. Those are generally the files CONTRIBUTING.md and CODE_OF_CONDUCT.md;
- **Be patient and kind:** Maintainers have lives too! Most of them make **no money** from OSS, so please be patient if your PR takes a while until being reviewed/approved;
- **It's not about you:** Do not take things personally! If someone adds a comment about your code, it's just about your
  code, don't be sad about it, but use it as an opportunity to learn something;
- **Not everything you do will/needs to be approved:** Sometimes our contributions don't match the projects needs/vision
  and end up not accepted, and **that's okay**. This is part of open source and we have to understand it. The code you
  wrote can always live as a plugin/extension too. Here's three unapproved PRs I did:
  - [Rust Book - Improve example][unapproved-rustbook]
  - [Parslet - Convert README to markdown][unapproved-parslet]
  - [Rubygems - Add `web` command][unapproved-rubygems]

## 💪 Yes, you can

First of all, contributing to open source is not a _experienced-developer-only_ thing. Many of the contributions I did
were _because_ I was a beginner on the language/tool. **Use this as your advantage**: beginners have sharp eyes for
missing or confusing docs, for example. Your trajectory can help future beginners have a smoother onboarding!

Look for issues with the tags [first-timers-only-issue], [easy][easy-issue], [beginner][beginner-issue] and [good first
issue][good-issue]. And here's a [list of beginner-friendly projects](https://github.com/MunGell/awesome-for-beginners).

Now grab your cup of coffee, streach your hands and go do something awesome 😉!

[bug-issues]: https://github.com/search?q=label%3Abug&type=Issues
[easy-issue]: https://github.com/search?q=label%3Aeasy&type=Issues
[beginner-issue]: https://github.com/search?q=label%3Abeginner&type=Issues
[good-issue]: https://github.com/search?q=label%3A%22good+first+issue%22&type=Issues
[first-timers-only-issue]: https://github.com/search?q=label%3Afirst-timers-only&type=Issues
[unapproved-rustbook]: https://github.com/rust-lang/book/pull/2673
[unapproved-parslet]: https://github.com/kschiess/parslet/pull/200
[unapproved-rubygems]: https://github.com/rubygems/rubygems/pull/2835
[guards]: https://refactoring.com/catalog/replaceNestedConditionalWithGuardClauses.html
[each-map]: https://github.com/JuanitoFatas/fast-ruby#enumerableeach--push-vs-enumerablemap-code
