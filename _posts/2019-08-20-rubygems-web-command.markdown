---
layout: post
title: "The Rubygems' web command"
date: 2019-08-20 22:00:00 -0300
categories: gsoc ruby rubygems cli
---

Wow! GSoC is almost on the final evaluation period! Time really flied! I think it's a good moment to talk a bit about my work.

As I mentioned in [this post][gsoc-post], I'm working with Rubygems for GSoC 2019. [My Pull Request][pr] is still open, but I think it's stable enough to write about it (and the process of opening it).

I've added a new command to Rubygems: the `web` command. Its goal is to help developers to quickly find documentation about a particular gem.

# How does it look?

It's really simple to use this command. Take a look:

* **Do you wanna know what is the homepage for some gem?** Just type `gem web gem_name` and it will output the URL.

* **Quickly access to the rubygems page?** `gem web -r gem_name` brings it.

* **Can't remember what _that_ method does?** `gem web -d gem_name` will get the documentation URL for you.

* **Want to dive into that good old messy code?** Type `gem web -c gem_name` to get its source code.

* **I know, we're too lazy to copy/paste the link:** Just set the environment variable `BROWSER` (e.g. `export BROWSER=google-chrome`) and it will automatically open the URL in the browser for you. (Pay [André Arko][indirect] a beer for this suggestion 😜)

# What's happening under the hood?
Adding a new method for Rubygems is not rocket science (I have a post on [how to do it][command]). I'll explain here a bit of how the `web` command works (I will be short on some sections to keep this clearer).

The first thing this commands does when it's called is to run the method `open_page(gem, options)` from `Gem::Web::Executor`.

The method will try to find locally a gemspec of the gem you've typed with:
{% highlight ruby %}
spec = Gem::Specification.find_by_name(gem)
{% endhighlight %}

The gemspec is important because it has all the info we need (homepage, documentation URI etc).

> This was one of the differences between the [original implementation][original] of `gem-web` and mine. It was also a suggestion from the community, for [security reasons][security].

If the gem is not installed, a `Gem::MissingSpecError` will be raised. In this case we have to search on the Rubygems API to find the gemspec.

The method `fetch_remote_spec(gem)` is responsible to fetch a remote gemspec (if the gem exists):

{% highlight ruby %}
def fetch_remote_spec(gem)
  dep = Gem::Dependency.new(gem)
  found, _ = Gem::SpecFetcher.fetcher.spec_for_dependency(dep) # Here's the request
  ...
end
{% endhighlight %}

If everything went well, we should have the gem specification now (otherwise it will output an error message). Now the command see what options the user selected (homepage, rubygems page, source code or documentation) and calls `open_browser(uri)`.

I think the implementation of this method is really simple, take a look:

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

If the `BROWSER` environment variable is set, the command uses it to open your browser with the link. Else, it juts prints the URI. Pretty easy, right?

<img style="display: block; margin: 0 auto;" src="/img/goddamn-right.gif">

# The End
Well, that's it! I told you that it wasn't hard at all. This was one of the last posts I'll do about my work on GSoC, since it's getting to the end. In the next update I'll talk about the [lessons I've learned][lessons] while contributing for Rubygems. 'Till next time, folks!

[gsoc-post]: {% post_url 2019-05-13-me-and-gsoc %}
[command]: {% post_url 2019-05-20-how-rubygems-commands-work %}
[lessons]: {% post_url 2019-08-21-lessons-learned-on-gsoc-2019 %}
[pr]: https://github.com/rubygems/rubygems/pull/2835
[indirect]: https://github.com/rubygems/rubygems/pull/2835#issuecomment-512542718
[original]: https://github.com/bitboxer/gem-web
[security]: https://github.com/rubygems/rubygems/pull/2835#issuecomment-512256175