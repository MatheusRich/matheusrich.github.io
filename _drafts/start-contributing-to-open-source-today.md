---
layout: post
title: 'Different Ways to Contribute to Open Source'
date: 2021-04-25 22:17:04 -0300
categories: oss
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

Did you need that library to do X for you? Don't expect maintainers will do it for you. Code it and
submit a PR! Maybe you already have something in your codebase that could be pushed upstream. That
is what happened with the following contributions:

- [RSpec - Allow ordering specs by modification time](https://github.com/rspec/rspec-core/pull/2778)
- [Long Haul - Add support for disqus comments](https://github.com/brianmaierjr/long-haul/pull/78)
- [tiptap - Add support to history custom settings](https://github.com/ueberdosis/tiptap/pull/213)
- [mintest-stub_any_instance - Allow stubbing without a value](https://github.com/codeodor/minitest-stub_any_instance/pull/13/files)

You may open an issue first, asking maintainers if they like your feature idea.

## ⚡ Improve performance / Refactor code

If you're experienced in a language you probably know some patterns, . You can do some refactoring too: deleting unused code, fixing deprecation notes/methods, untangling some nested `if/else` with [guard clauses][guards], etc.

Here's some PRs I did for [Ruby on Rails](https://rubyonrails.org/) in this category:

- [Replace `gsub` with `tr`](https://github.com/rails/rails/pull/42054)
- [Replace `map + compact` with `filter_map`](https://github.com/rails/rails/pull/42053)
- [Reduce memory allocations](https://github.com/rails/rails/pull/41335)

## 🧪 Add tests

Adding a test coverage tool is another

https://github.com/bitboxer/gem-web/pull/5

https://github.com/bitboxer/gem-web/pull/6

## 🐋 DevOps

- CI, docker/docker-compose, linters

- [zynaddsubfx - Add Dockerfile](https://github.com/zynaddsubfx/zyn-fusion-build/pull/29/files)

## OSS is more than code!

As developers we love to code, but OSS is far beyond just coding. Maintainer have to deal with a variety of different
problems: documentation, helping beginners, handling poor written issues, spams, reviewing Pull Requests, etc.

- **Review PRs:** You don't need to be a maintainer to do that! I took much time to understand this. Just be kind .
  Here's [more tips on good code reviews](https://stackoverflow.blog/2019/09/30/how-to-make-good-code-reviews-better/).
- **Try reproducing issues**
- **Improve documentation:** (Readme, fix typos, rewrite confusing sections, add docs where it's missing) Improve as you read

[pr Lucky](https://github.com/luckyframework/website/pull/305)

[pr Crystal](https://github.com/crystal-lang/crystal-book/pull/394)

[Fixing broken links in README](https://github.com/amberframework/amber/pull/1153)

[Adding a logo for Commit Helper](https://github.com/andre-filho/commit-helper/pull/27)

## General advices

- **Be patient:** Maintainers have life too! Many of them make **no money** from OSS, so please be patient if your PR
  takes a while until being reviewed/approved this is another reason to help review Pull Requests and Issues);
- **Be kind:**
- **Not everything you do will/needs to be approved:** . Maybe the code you wrote can live as a plugin/extension.
- **It's not about you:** Do not take things personally! If someone adds a comment about your code, it’s just about your
  code, don’t be sad about it, but use it as an opportunity for learning something (or prove your point if you’re
  confident about your solution).
- **Read contributing guide and code of conduct**

## Yes, you can

First of all, contributing to open source is not a _experienced-developer-only_ thing. Many of the contributions I did
were _because_ I was a beginner on the language/tool. **Use this as your advantage**: beginners have sharp eyes for
missing or confusing docs, for example. Your trajectory can help future beginners have a smoother onboarding.

tags: first-timers-only, easy, beginner, good first issue

https://github.com/MunGell/awesome-for-beginners

[bug-issues]: https://github.com/search?q=label%3Abug&type=Issues&ref=advsearch&l=&l=
[unapproved-rustbook]: https://github.com/rust-lang/book/pull/2673
[unapproved-parslet]: https://github.com/kschiess/parslet/pull/200
[unapproved-rubygems]: https://github.com/rubygems/rubygems/pull/2835
[guards]: https://refactoring.com/catalog/replaceNestedConditionalWithGuardClauses.html