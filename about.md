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

  <h2 id="open-source">Open source projects</h2>

  <h3>Lit lang <a href="https://github.com/lit-lang/lit">(Github)</a></h3>

  <p>My first attempt at programming language design. Lit is a simple functional programming language.</p>

  <p>Here's a sample of its (current) syntax:</p>

{% highlight rust %}
let fib = fn { |n|
  if (n < 2) { return n; }

  return fib(n - 1) + fib(n - 2);
}

let n = gets();

puts("The # {n} fibonacci number is {fib(n)}")
{% endhighlight %}

  <h3>Benchable <a href="https://github.com/MatheusRich/benchable">(Github)</a></h3>

  <p>Benchable aims to make creating Ruby benchmarks easier.</p>

{% highlight ruby %}
Benchable.bench do
  setup do
    @array = (1..1000000).map { rand }
  end

  bench 'sort' do
    @array.dup.sort
  end

  bench 'sort!' do
    @array.dup.sort!
  end
end
# Output:
#                            user     system      total        real
# Sort                   0.400133   0.011995   0.412128 (  0.412339)
# Sort!                  0.388636   0.003980   0.392616 (  0.393054)
{% endhighlight %}

  <p>There are 4 benchmark types available: <code class="language-plaintext highlighter-rouge">bm</code>, <code class="language-plaintext highlighter-rouge">bmbm</code>, <code class="language-plaintext highlighter-rouge">ips</code> and <code class="language-plaintext highlighter-rouge">memory</code>.</p>


  <h3>EzAttributes <a href="https://github.com/MatheusRich/EzAttributes">(Github)</a></h3>

  <p>Easily define initializers with keyword args (in Ruby).</p>

{% highlight ruby %}
class User
  extend EzAttributes

  # Here name and age are required, and email has a default value, so it is optional.
  attributes :name, :age, email: 'guest@user.com'
end

user = User.new(name: 'Matz', age: 22)
# => #<User:0x000055bac152f130 @name="Matz", @age=22, @email="guest@user.com">

# EzAttributes will add getters for all fields too.
user.name
# => "Matz"
{% endhighlight %}
</div>
