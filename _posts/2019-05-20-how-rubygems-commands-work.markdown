---
layout: post
title: "How Rubygems commands works"
date: 2019-05-13 22:00:00 -0300
categories: gsoc ruby rubygems cli
---

I'm currently working on GSoC, and I have to [Integrate functionality from gem-web into RubyGems gem CLI][gsoc-post]. So, we're going to add a new CLI option to `rubygems`. As my first task on it, my mentor [Saroj Maharjan][zoras-gh] (@zoras) sent me some PRs ([#1938][pr-1938] and [#1944][pr-1944]) to study, as well as the [class][command-class] `Command` of [`rubygems` codebase][rubygems]. Here's a bit of what I've learned:


## Class Command
The first thing I noticed on the PRs was that every command inherits from the class `Command`. This class works like an `interface` to the children classes, that is, the children must override its methods to work properly. The comment at [`lib/rubygems/command.rb`][comment] sums this up:

> Base class for all Gem commands.  When creating a new gem command, define #initialize, #execute, #arguments, #defaults_str, #description and #usage (as appropriate). 

## Overriding

So we need to override these methods to create our new command. Let's take a look at them:

* **`initialize`:** Initializes a new command, adding its name, a short description (that will be displayed in `gem help commands`). The argument `defaults` is a list of default arguments (that should be mirrored in `defaults_str`). Here's the [generic implementation][initialize] of this method:

```ruby
# Gem::Command's initialize method

def initialize(command, summary=nil, defaults={})
  @command = command
  @summary = summary
  @program_name = "gem #{command}"
  @defaults = defaults
  @options = defaults.dup
  @option_groups = Hash.new { |h,k| h[k] = [] }
  @deprecated_options = { command => {} }
  @parser = nil
  @when_invoked = nil
end
```

It's possible to add new options to your command with `add_option`. The `initilize` method of our new command could look like this:

```ruby
def initialize
  super 'new_method', 'Does an awesome thing.'

  add_option('--awesome', 'Adds awesomeness') do |value, options|
    options[:awesome] = value
  end
end
```
<br>

* **`arguments`:** Describes the arguments that a command takes. It should return a left-justified string, one argument per line. Here's the code from the [command `install`][install], for example:

```ruby
def arguments
  "GEMNAME       name of gem to install"
end
```
<br>

* **`usage`:** Displays the usage for an individual gem command. The text "[options]" is automatically appended to the usage text. Take a look on the override of this method at [`Gem::Commands::UpdateCommand`][update]:

```ruby
  def usage
    "#{program_name} GEMNAME [GEMNAME ...]"
  end
```
<br>

<!-- #### defaults_str -->
* **`defaults_str`:** Defines the default arguments from the command. It's really simple, take a look at this example:

```ruby
# This method is similar to arguments, but displays the default values.
def defaults_str
  --document --no-force
end
```
<br>

* **description:** This is just a long description for what the command does.

```ruby
# You can add multiple lines as well
def description
  'The `signout` command is used to sign out from all current sessions,'\
  ' allowing you to sign in using a different set of credentials.'
end
```
<br>

* **execute:** The generic method that you need to override to handle your command. Parsed option will fill `options`, while unparsed option will be left in `options[:args]`. An override could look something like this:

```ruby
  # This will raise Gem::Exception if you don't override it
  def execute
    if options[:awesome]
      add_awesomeness
    end

    do_other_stuff
  end
```
<br>
# Wrapping up

As you may have noticed, adding a new command to `rubygems` is not rocket science. Adding tests to your new code is very important too!

BTW, the tests from [`rubygems`][rubygems] are written in [Minitest][minitest], whereas [`gem-web`][gem-web]'s are in [Rspec][rspec], so I'll need to convert them before integrating `gem-web` into `rubygems`. I'll probably talk about this in next week's post. Stay tuned! I'm out!

<img style="display: block; margin: 0 auto;" src="/assets/img/thats-all.gif">


[zoras-gh]: http://github.com/zoras
[gsoc-post]: {% post_url 2019-05-13-me-and-gsoc %}
[pr-1938]: https://github.com/rubygems/rubygems/pull/1938
[pr-1944]: https://github.com/rubygems/rubygems/pull/1944
[comment]: https://github.com/rubygems/rubygems/blob/master/lib/rubygems/command.rb#L13
[command-class]: https://github.com/rubygems/rubygems/blob/master/lib/rubygems/command.rb
[rubygems]: https://github.com/rubygems/rubygems
[minitest]: https://github.com/seattlerb/minitest
[rspec]: https://rspec.info/
[initialize]: https://github.com/rubygems/rubygems/blob/master/lib/rubygems/command.rb#L118
[install]: https://github.com/rubygems/rubygems/blob/master/lib/rubygems/commands/install_command.rb
[update]: https://github.com/rubygems/rubygems/blob/master/lib/rubygems/commands/update_command.rb
[gem-web]: https://github.com/bitboxer/gem-web/
