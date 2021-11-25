---
layout: post
title: 'How To Get Pull Requests Merged Faster'
categories: quick-tip productivity
---

No one likes huge Pull Requests. Reviewers have a hard time reading them, bugs sneak in, they took
ages to get merged, conflicts pop everywhere... It's a nightmare. There's a better way to handle
this.

Listen carefully. It's a secret: 🤫 _<small>make them small.</small>_

_"How do I do that?"_ - You may ask. To answer that, we have to learn about developer hats.

## 🎩 Wearing one hat at a time

Martin Fowler, in the [Refactoring book], says that there are two types of
software changes: behavioral and structural. Behavioral changes are when you add
or remove features from the existing codebase, while structural changes are
changes to the _code structure_ without changing any of its functionality. Those
kinds of changes are fundamentally different, and we should avoid mixing them.
Structural modifications are easily reversible, whereas behavioral often aren't,
for example.

[Refactoring book]: https://martinfowler.com/books/refactoring.html

And **that is the secret sauce for smaller PRs**: splitting those two kinds of changes whenever
possible. In other words, separate refactoring from adding new features. It may seem small at first,
but once we know the difference between those changes, we can start thinking a few steps ahead and
plan how to work more efficiently.

{%
  include aside.html
    title="Preparing the field"
    content="Have you ever thought _“This change would be so simple if the code looked like X”_?
  I have, and it's often easier to add a new feature by refactoring the surroundings first.
  This technique is known as **preparatory refactoring**.

  Remember this classic quote:

  > “For each desired change, make the change easy (warning: this may be hard),
  > then make the easy change” --- Kent Beck

  Before start coding a new task, ask yourself: _“Would this be easier with some preparatory
  refactoring?”_. The answer can make your work far easier.
  "
%}

Another side effect you'll see it's that the code reviews themselves will improve. This happens
because smaller code samples are easier to understand, so reviewers can focus deeper on what you did.

## ➗ Dividing work

Sometimes our workflow may lead to lots of files changed, and that's okay. The
thing is that **we don't need to add all of them to the same PR**. Once we got
the work done, we can split commits into several [deliverable] PRs. Being
[comfortable with Git] will make this task far more manageable.

[deliverable]: https://thoughtbot.com/blog/break-apart-your-features-into-full-stack-slices
[comfortable with Git]: https://thoughtbot.com/blog/git-interactive-rebase-squash-amend-rewriting-history

## 💅 Nice presentation

Stepping out from the code side a bit, if you want to make a good PR, make sure
to make it appealing. Some file changes with no context at all won't make a
reviewer happy. Here are some things you can do to put a smile on their faces:

- **Good description**: What is this PR doing? Is it a bugfix, a new feature, or
refactoring? Does it include any breaking change?
- **Context**: Please don't just link a GitHub issue or a Jira ticket on your
  PRs. Try to answer some of these questions: _Why_ are you doing this? Why did
  you choose a particular approach? If possible, provide information (links,
  docs) to back it up. Benchmarks and screenshots are welcome as well.

A good PR description makes the reviewer do less back-and-forth by proactively
answering a lot of their questions in the first place.

## 🧪 Tests!

Don't forget to add tests to your code changes as well --- unless it's a refactoring, where the
behavior stays the same. If you're doing a bugfix, you [already have the test scenarios]; if you're
doing TDD, well, you already have the tests 😅. No matter how you prefer to work, tests add more
confidence that the code works and prevents regressions in the future.

[already have the test scenarios]: {% post_url 2021-01-18-a-simple-way-to-get-started-with-tdd %}
