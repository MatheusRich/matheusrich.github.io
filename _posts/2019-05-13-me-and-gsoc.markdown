---
layout: post
title: "How I got accepted into GSoC 2019"
date: 2019-05-13 22:00:00 -0300
categories: gsoc
---
# My background
[Ruby][ruby] is my favorite programming language. I've been working with it almost every day since 2016, whether on college projects or at work. I love how it is simple, clear, elegant and beautiful. Take a look at the code snippet bellow:

{% highlight ruby %}
my_list = []

if my_list.empty?
  puts "It's empty"
end
# No unnecessary braces, semicolons, etc
{% endhighlight %}

# Choosing a project

I started web development and quickly discovered [Ruby on Rails][rails] and eventually ruby became one of my main tools. This was why I chose the [Ruby Org][ruby-org] when I was looking for projects to contribute before GSoC.

I ran through its [ideas list][ideas] and I found some nice projects. One that catched my eye was to [Integrate functionality from gem-web into RubyGems gem CLI][project]. This seemed to be a project for me: kinda on my area, but challenging tho. I wanted to learn more about this project, so I could write a better proposal.

# First contributions
I took a look at [gem-web][gem-web]'s to see what it looks like and make some contribution. Since there were no issues, I look at its files.

Improving travis is an easy way to get started so this was my [first contribution][first-pr] to gem-web. This is very important: **don't be afraid of open source projects**. This contribution was so simple! Take a look, just one line:

<img style="display: block; margin: 0 auto;" src="/img/first-pr.png">


To get used to the codebase I thought that would be nice to add some tests, so I [added Simplecov][second-pr] first, and after I would write tests where gem-web was lacking.

I had to study a bit of the test structure of gem-web (which were written in [Rspec][rspec]), and the code of rubygems (especially [the Command class][rubygems]) and gem-web itself. This was my path to my [third contribution][third-pr].

# My proposal
With the knowlegde adquired from my contribuitons I was able to write a proposal. Ruby provided an [application template for students][template], so I answered the questions, and wrote a Roadmap of my development process. I followed an advice from an ex-GSoCer to **add time to get feedback from the community** (particularly from non-linux users), so I add these "Feedback Moments". I added a **contingency time** too, because as software developers we know: _"Sh!t Happens"_. Here's [my proposal draft][draft].

With the proposal finished I sent it to the mentors, and waited for feedback (actually they said that my proposal was good, so there are no changes between the draft and the final PDF).

# Project #5260793296191488

Well, as you know (the title has spoiled you), I [got accepted into GSoC][approved] ;) Here's the nice email that I've received:

<img style="display: block; margin: 0 auto;" src="/img/gsoc.png">

# Final thoughts
Yes, I am very happy to be part of this program. I feel great about myself, because sometimes we feel like we can't do certain things, and I prove myself wrong. Well, I got accepted on my first try, so I'm not the most experieced about GSoC, but here some tips that may help you: 

**My tips:**
* **Pick an org/project/language you like**.
  * You won’t want to work on something you don’t have any bonds with.
* **Start Early!**
  * You can read [Google's Student Guide][guide], read articles of past students(like this one), etc.
* **Know your project!**
  * You'll write a proposal, so knowing your project will help you to convince the organization that you are the right person for it. Contributions are welcome here!
* **Interact with the mentors and the community**
  * Get in touch with them on IRC channels, Slack, Rocket.chat, Telegram groups or even email! No one is better than them to help you on your first steps.
* **Use Grammarly!**
  * As english is not my first language, I've been using [Grammarly][grammarly] to help me write better texts. Give it a try!
* **Got turned down?**
  * There are soooo many people that got turned down on GSoC multiple times before getting accepted! Don't let this knock you down! It's time to think about what you could have done better (ask the mentors) and start improving now! [Read this guide from Google about being turned down.][turned-down]
* **DO NOT GIVE UP!**
  * Just don't! I know it's tough, but you're gonna make it!

<br>
Well, that's it for now. This text is longer than I expected it to be. Next post will be about my first steps on GSoC. Stay tunned and LET'S GO!

<img style="display: block; margin: 0 auto;" src="/img/letsgo.gif">

[ruby]: https://www.ruby-lang.org/
[rails]: https://rubyonrails.org/
[ruby-org]: httpst//summerofcode.withgoogle.com/organizations/5542255322988544/
[ideas]: https://github.com/rubygsoc/rubygsoc/wiki/Ideas-List
[project]: https://github.com/rubygsoc/rubygsoc/wiki/Ideas-for-RubyGems#integrate-functionality-from-gem-web-into-rubygems-gem-cli
[gem-web]: https://github.com/bitboxer/gem-web/
[first-pr]: https://github.com/bitboxer/gem-web/pull/3
[second-pr]: https://github.com/bitboxer/gem-web/pull/5
[third-pr]: https://github.com/bitboxer/gem-web/pull/6
[rspec]: https://rspec.info/
[rubygems]: https://github.com/rubygems/rubygems/blob/master/lib/rubygems/command.rb
[template]: https://github.com/rubygsoc/rubygsoc/wiki/Student-Application
[draft]: https://docs.google.com/document/d/1YB1-rBfI9fI9i7cy9_RWV-xD45DMMW3XLnuRWlp_kvg/edit?usp=sharing
[approved]: https://summerofcode.withgoogle.com/projects/#5260793296191488
[guide]: https://google.github.io/gsocguides/student/index
[grammarly]: https://www.grammarly.com/
[turned-down]: https://google.github.io/gsocguides/student/being-turned-down

