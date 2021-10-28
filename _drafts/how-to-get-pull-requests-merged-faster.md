---
layout: post
title: 'How To Get Pull Requests Merged Faster'
categories: quick-tip productivity code
---

No one likes huge Pull Requests. Reviewers have a hard time reading them, bugs sneak in, they took
ages to get merged and conflicts pop everywhere... It's a nightmare. There's a better way to handle
this. Listen carefully. It's a secret:

🤫 _<small>make them small.</small>_

## 🎩 Wear one hat at a time

"How do I do that?" - You may ask. Well,

Changing behavior / changing structure

Split refactoring and new features.

> For each desired change, make the change easy (warning: this may be hard), then make the easy change -- Kent Beck

preparatory refactoring

I understand that your workflow may change lots of files, but the thing is that **you don't need to
add all of them to the same PR**.

## 💅 Nice presentation

Stepping out from the code side a bit, if you want to make a good PR, make sure to make it
appealing. Some file changes with no context at all won't make a reviewer happy. Here are some
things you can do to put a smile on their faces.

### Good description

What is this PR doing? Bugfix, new feature, refactoring.

any breaking change?

Benchmarks? Usage?

📸 Screenshots

## 🧪 Tests!

