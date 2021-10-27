---
layout: post
title: 'Easy View Components In Jekyll'
date: 2021-10-27 00:24:10 -0300
categories: ruby ssg jekyll quick-tip
---

[Jekyll] is a famous static site generator. It has over 43k starts on GitHub,
but in our current [JAMstack] world, it's not the shiniest star anymore.

With web development becoming ()- some would say _too_ complicated-,

One of the key aspects it lack is components. especially
with the introduction of [utility-first CSS] libraries like [Tailwind].

That's what I thought until I discovered Jekyll's [`includes`].

It's similar to partials.
You can pass parameters.
Default values with Liquid's [`default`] filter.

## Don't be too greedy!

Includes add an overhead on the build time for your site. The docs recommend not
to use an insert for every image on your blog, for example.

You could also create [custom Liquid tags] to create components, but note that
they are [not supported] by GitHub Pages --- so automatic build/deploy won't work.

<small>TIP: If you wanna something more... _modern (?)_ for doing JAMstack with
Ruby, check out [Bridgetown].</small>

[Jekyll]: https://jekyllrb.com/
[JAMstack]: https://jamstack.org/what-is-jamstack/
[Tailwind]: https://tailwindcss.com/
[`includes`]: https://jekyllrb.com/docs/includes/
[`default`]: https://shopify.github.io/liquid/filters/default/
[Bridgetown]: https://bridgetownrb.com/
[utility-first CSS]: https://adamwathan.me/css-utility-classes-and-separation-of-concerns/
[custom Liquid tags]: https://jekyllrb.com/docs/plugins/tags/
[not supported]: https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/troubleshooting-jekyll-build-errors-for-github-pages-sites#unknown-tag-error
