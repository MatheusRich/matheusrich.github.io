---
layout: post
title: 'Easy View Components In Jekyll'
categories: ruby ssg jekyll quick-tip
---

[Jekyll] is a famous static site generator. It has over 43k stars on GitHub,
but in our current [JAMstack] world, it's not the shiniest star anymore.

With web development becoming more complex --- some would say _too_
complicated---, Jekyll may feel bare bones when compared with competitor tools.
One of the key aspects it lacks is components, which becomes a must with the
introduction of [utility-first CSS] libraries like [Tailwind].

I was losing hope, but then I discovered the [`include`] tag.

## Creating components

Include tags are kinda similar to partials in Rails: they allow us to include
content from another file (stored in the `_includes` directory).

{% raw %}

```liquid
  <!-- This includes the contents of _includes/footer.html into this file -->
  {% include footer.html %}
```

{% endraw %}

The cool thing is that you can pass parameters to include tags! This is where
things start to get interesting. We can create components similar to what we
would do with React, for example. But instead of using JS, we use [Liquid].

<figure>
{% highlight html %}
{% raw %}
<aside class="max-w-md p-5 rounded bg-gray-50 border-l-4 border-l-blue-500">
  <strong class="block mb-4">{{include.title}}</strong>
  <p>{{include.content}}</p>
</aside>
{% endraw %}
{% endhighlight %}
<figcaption style="margin-top: -1rem;">Poorman's JSX</figcaption>
</figure>


And we use it in the template like this:

{% highlight liquid %}
{% raw %}

{% include aside.html title="Include tags are cool" content="Keep reading for caviats, tho" %}

{% endraw %}
{% endhighlight %}

It's even possible to have parameters with default values using Liquid's [`default`] filter:

{% highlight html highlight_lines="2" %}
{% raw %}
<aside class="max-w-md p-5 rounded bg-gray-50 border-l-4 border-l-blue-500">
  <strong class="block mb-4">{{include.title | default: 'Note' }}</strong> <!-- default value here -->
  <p>{{include.content}}</p>
</aside>
{% endraw %}
{% endhighlight %}

## Don't be greedy!

Include tags are powerful, but they add an overhead on the build time for your
site, so don't use them for _every single thing_. The docs recommend not using
them for every image on your blog, for example.

A different approach would be using [custom Liquid tags] to create components,
but note that they are [not supported] by GitHub Pages --- so automatic
build/deploy won't work.

{%
  include aside.html
    type="info"
    content="If you wanna something more... _modern (?)_ for doing JAMstack with
    Ruby, check out [Bridgetown](https://bridgetownrb.com/)."
%}
<!-- <small>TIP: </small> -->

[Jekyll]: https://jekyllrb.com/
[JAMstack]: https://jamstack.org/what-is-jamstack/
[Tailwind]: https://tailwindcss.com/
[Liquid]: https://shopify.github.io/liquid/
[`include`]: https://jekyllrb.com/docs/includes/
[`default`]: https://shopify.github.io/liquid/filters/default/
[utility-first CSS]: https://adamwathan.me/css-utility-classes-and-separation-of-concerns/
[custom Liquid tags]: https://jekyllrb.com/docs/plugins/tags/
[not supported]: https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/troubleshooting-jekyll-build-errors-for-github-pages-sites#unknown-tag-error
