---
layout: post
title: 'Typo-proof Development'
categories: productivity terminal typos
---

I hate typos! Seriously! I've made a decision: **I want typo-proof development!**

## Typos slow me down!

{%
  include figure.html
    src="typo.webp"
    width=207
    height=103
    caption="The kind of typo that makes you debug for hours..."
%}

If the language you're using has static type checking, those errors are easily
avoided. Otherwise, a simple spellchecker might do it:

{%
  include figure.html
    src="typo-checked.webp"
    width=276
    caption="Even though it's not an error, the squiggly line might be enough to draw your attention to the typo"
%}

## The less I type, the less I typo

At least 50% of the time, I'll screw up while typing something like `bundle exec` or `git branch`.

Using autocomplete at your favor

### IDE

- Compilers (Rust example)
- Linters (Rubocop Example)
- LanguageServers (Ruby class Example)
- Copilot

{%
  include figure.html
    src="typo-proof-dev/copilot.webp"
    class="max-w-sm"
    caption="Github's Copilot can help you avoid some typos as well"
%}

### Terminal

[zsh-autocomplete]

{%
  include figure.html
  src="typo-proof-dev/zsh-autocomplete.webp"
  class="max-w-sm"
  caption="You can also get a similar benefit by using <kbd>Ctrl</kbd> + <kbd>R</kbd>"
%}

[zsh-syntax-highlight](https://github.com/zsh-users/zsh-syntax-highlighting)

{% include figure.html src="typo-proof-dev/zsh-highlight.webp" class="max-w-sm" %}

## Fixing common mistakes

Stop fighting them and accept this.

`gir` -> `git`

`sl` -> `ls`

[oh-my-bash]: https://github.com/ohmybash/oh-my-bash
