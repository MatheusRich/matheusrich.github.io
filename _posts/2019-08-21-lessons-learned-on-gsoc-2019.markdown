---
layout: post
title: "Lessons Learned on GSoC 2019"
date: 2019-08-21 23:00:00 -0300
categories: gsoc ruby rubygems
---

Opening a Pull Request for Rubygems, a part of the Ruby language seemed like a terrifying thing to me. Like, all my code could be running on everyone else's machines someday. What if I introduced a security bug? Although I've been contributing to open source projects since 2016, these thoughts kept on my mind.

It turns out that it was an **extremely great experience**. My code wasn't "perfect" (if such thing exists), and I made a lot of mistakes, but I've learned so many things in the process that **really worth it**!

<img style="display: block; margin: 0 auto;" src="/assets/img/no-pain-no-gain.gif">
<p style="text-align: center;">Well, I guess it's just the "No pain, No gain" rule. =)</p>

## Lessons Learned
Here's some advice, so we (yes, I'm included) can avoid these mistakes in the future:

### 1. Keep It Simple Stupid
> In case you didn't know, [KISS][kiss] is a "real thing", not just a cool expression that I used

Well, well, well... It's here where things get embarrassing (to me). As developers, we tend to **overestimate** the problems we have, and this leads to **overcomplicated** solutions. This problem showed up on the initial code of my PR for Rubygems.

I wasn't fully aware of what every piece of [gem-web][gem-web] did, so I tried to modify it as little as possible. Gem-web uses Rspec for testing, while Rubygems goes with Minitest. I knew I would have to update all the tests, but one thing I kept was (almost) all development dependencies.

So, when I opened the PR the gemspec of rubygems looked like this:

{% highlight ruby %}
+ s.add_dependency(%q<launchy>, ["~> 2.4.3"])
+ s.add_development_dependency(%q<mocha>, ["~> 1.7.0"])
+ s.add_development_dependency(%q<webmock>, ["~> 3.5.1"])
+ s.add_development_dependency(%q<vcr>, ["~> 4.0.0"])
{% endhighlight %}

So, I've not only added three new development dependencies (mocha, webmock, and vcr), but also a RUNTIME one (launchy). This is especially bad because the PR target is part of a programming language!

As my mentor pointed out, the good old (and already added) **Minitest** could replace all of those test-related dependencies.

> I know that those gems exist for a reason, and you (like I do) could like mocha's style rather than minitest's, but if you want to increase the chances of you PR being merged, it's a good practice not to add a bunch of dependencies.

Now I had to get rid of Launchy (which was used to open the URLs on users' browser automatically). My first take on this was to create a hash with ALL THE POSSIBLE platforms that ruby could be running on and a method to open the default browser of it (I'm a genius).

{% highlight ruby %}
OPEN_BROWSER_CMDS = {
  aix: "defaultbrowser",
  cygwin: "cygstart",
  darwin: "open",
  macruby: "open",
  freebsd: "xdg-open",
  # FIXME: What to do?
  # hpux: "",
  # java: "",
  # dalvik: "",
  # dotnet: "",
  linux: "xdg-open",
  mingw32: "start",
  netbsdelf: "xdg-open",
  openbsd: "xdg-open",
  bitrig: "xdg-open", # check this
  # solaris: "sdtwebclient", # version < 11
  # solaris: "xdg-open", # version > 11
  unknown: ""
}.freeze
{% endhighlight %}

As you can see, I had NO clue about to do with some platforms (like java and dotnet), and some platforms had different commands to open the default browser based on its version (like Solaris). That solution was not good enough, so I changed this hash to a **big ugly switch case**:

> You can see the complete awfulness [here][awful]

{% highlight ruby %}
def open_default_browser_cmd(local_os, version)
  case local_os
  when 'aix'
    'defaultbrowser'
  when 'cygwin'
    'cygstart'
  when 'darwin'
    'open'
  # ... many other cases
  when 'linux'
    'xdg-open'
  when 'mingw32'
    'start'
  when 'solaris'
    if version < 11
      'sdtwebclient'
    else
      'xdg-open'
    end
  else
    ''
  end
end
{% endhighlight %}

Obviously, this was a terrible solution (and I knew it), but I couldn't think on another way to accomplish it (without external dependencies). So, I opened the Pull Request anyway so the community could help out on this.

One of the things they said to me was that the `open_default_browser_cmd` was very hard to maintain, and "What if the user just want to see the URL, not opening it at all?". Then [André Arko][indirect] came with a simple, yet powerful, solution that I haven't thought of: "just read the browser from an environment variable". This was perfect simple! Now users could choose if they want to open the browser automatically or not (and what command should do it). That awful code turned into this:

{% highlight ruby %}
def open_browser(uri)
  browser = ENV["BROWSER"]
  if browser.nil? || browser.empty?
    puts uri
  else
    system(browser, uri)
  end
end
{% endhighlight %}


Again: **Keep it simple, stupid!**

### 2. Communication
One of the things I love about open source (and especially  about Ruby) is the community! Interacting with people, teaching, learning from them, this is so cool!

Do use this in your favor! Like what I did in the last section: I wasn't sure about a feature, and the community guided me. They even showed me use cases that I didn't think of. **Don't be shy to ask questions!**

And that fear about adding a _security bug_? Well, here the community can (and will) help you! That's [what @simi did][simi] on my PR for Rubygems.

Oh, and **do not take things personally!** If someone adds a comment about your code, it's just about your **code**, don't be sad about it, but use this an opportunity for learning something (or prove your point if you're confident about your solution).

### 3. Test test test
Never forget to add tests when you add new features to a project! It *heavily* increases the odds of your changes being accepted. And, of course, it should help you to keep track when your code is working or not, and warn you if you insert any bug. Use a coverage tool to make sure **every piece** of your code is being covered!

## Final Thoughts
Yeah, this article was big! But it needed to. Being part of GSoC and contributing to such a big project like Rubygems was just a fantastic experience! I'll carry the lessons I've learned for the rest of my career, and they will lead me to be a better programmer.

I have to thank Google so much for making this possible. I can't describe how cool was this summer! I also have to thank Ruby and Rubygems for guiding me all the way through this. Thanks for the contributors that reviewed my PR (particularly [Luis][bronzdoc], [Ellen][duckinator] and [Josef][simi]), and the support on Slack ([Aditya][aditya] and [Indirect][indirect-gh]).

[Saroj (@zoras)][zoras], my mentor was just amazing! He always answered me as fast as he could, and made me find my way rather than giving me the answer right away! This was really cool! Thank you! 

At last, I like to thanks all the people next to me that always encouraged me: my _fiancee_, my friends, all my pals at LAPPIS. Love y'all! 

If you're wondering being part of GSoC 2020, **start contributing now!** Have no fear! You can do it! Here are [some tips for you][tips] to get a headstart.

That's it, guys! If you made it until here, you're the MVP. I hope something here helps you! And if it does, let me know! 'Till next time! Bye!

<img style="display: block; margin: 0 auto;" src="/assets/img/thanks.gif">


[tips]: {% post_url 2019-05-13-me-and-gsoc %}
[kiss]: https://en.wikipedia.org/wiki/KISS_principle
[gem-web]: https://github.com/bitboxer/gem-web/
[awful]: https://github.com/rubygems/rubygems/pull/2835/commits/7a2507ce7ccc7d9f10c13d9ab98557426aa86fc2
[indirect]: https://github.com/rubygems/rubygems/pull/2835#issuecomment-512542718
[indirect-gh]: https://github.com/indirect
[simi]: https://github.com/rubygems/rubygems/pull/2835#issuecomment-512256175
[zoras]: http://github.com/zoras
[aditya]: https://github.com/sonalkr132
[bronzdoc]: https://github.com/bronzdoc
[simi]: https://github.com/simi
[duckinator]: https://github.com/duckinator 
[LAPPIS]: http://lappis.rocks