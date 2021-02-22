---
layout: default
title: About Me
---

<div class="post">
  <h1 class="pageTitle">About Me</h1>
  <div class="profilePic">
    <img loading="lazy" width=200 height=200 src="{{ '/assets/img/me.jpg' | prepend: site.baseurl }}" alt="Profile picture of Matheus Richard">
  </div>
  <p class="intro">Hello, my name is Matheus! I'm a Software Engineer from Brazil. I'm an open source contributor, I love music and my newfound passion is game development.</p>
  <p>You can find me online using the links in the footer. Cya!</p>

  <h2>Open source projects</h2>

  <h4>Lit lang <a href="https://github.com/lit-lang/lit">(Github)</a></h4>

  <p>My first attempt on programming language design. Lit is a simple functional programming language.</p>

  <p>Here's a sample of its (current) syntax:</p>

  {% highlight rust %}
  let fib = fn { |n|
    if (n < 2) { return n; }

    return fib(n - 1) + fib(n - 2);
  }

  let n = gets();

  puts("The # {n} fibonacci number is {fib(n)}")
  {% endhighlight %}

</div>
