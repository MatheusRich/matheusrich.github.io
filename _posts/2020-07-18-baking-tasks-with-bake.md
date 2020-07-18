---
layout: post
title: "Baking Tasks With 'Bake'"
date: 2020-07-18 01:00:49 -0300
categories: ruby
---

How many times have you searched how to pass arguments to a rake task? [`Bake`][bake-gh] makes it as easy as creating a simple method (**literally**). 

For demonstration, we're gonna create a task that generates a new blog post file for you.

## Setup
1. First of all we need to install the gem. Make sure you have at least Ruby 2.5.0. Add **`Bake`** to your project's Gemfile and install it:
```bash
$ bundle add bake
```
1. Create a **`bake.rb`** file at the root of your project. This is where the top level tasks will live.

### Baking you first task
As I said earlier, just create a ruby method and it will do the job.

```ruby
# Creates a new post
#
def new_post(post_name)
  post_path = "posts/#{post_name.downcase.gsub(/ /, '-')}.md"
  post_content = "---\ntitle: #{post_name}\n---"

  File.write(post_path, post_content)
end
```

That's it! Lets run it.

```bash
$ bake new_post 'new post'
# Creates 2020-07-16-new-post.md
```

_To pass strings with whitespaces, wrap them in quotes._

Optional arguments are accepted as well. Maybe we want our posts to be in different extensions sometimes.
Let's add an optional argument to our task.

```ruby
# Creates a new post
#
def new_post(post_name, extension = 'md')
  post_path = "#{post_name.downcase.gsub(/ /, '-')}.#{extension}"
  post_content = "---\ntitle: #{post_name}\n---"

  File.write(post_path, post_content)
end
```

We can use keyword arguments too! Now we're going to add categories on our posts.
```ruby
# Creates a new post
#
def new_post(post_name, extension = 'md', categories: '')
  post_path = "#{post_name.downcase.gsub(/ /, '-')}.#{extension}"
  post_content = "---\ntitle: #{post_name}\ncategories: #{categories}\n---"

  File.write(post_path, post_content)
end
```

And you pass named arguments like this:
```bash
$ bake new_post 'bake is awesome' categories='ruby bake'
```

#### It's 2020, I need types!
Sometimes it's useful to coerce the task inputs in other types, since they are always strings. No prob, **`Bake`** got you!

Just add some documenting comments above your method and you're good to go:

```ruby
# Creates a new post
#
# @param post_name [String] name of the post to be created.
# @param extension [String] file extension of the post to be created.
# @param categories [Array(String)] categories of the post.
def new_post(post_name, extension = 'md', categories: [])
  post_path = "#{post_name.downcase.gsub(/ /, '-')}.#{extension}"
  post_content = "---\ntitle: #{post_name}\ncategories: #{categories.join(' ')}\n---"

  File.write(post_path, post_content)
end
```

Now, instead of wrapping our categories in quotes, we can pass them as comma separated values and they will be coerced into an array of strings.

```bash
$ bake new_post 'bake is awesome' categories=ruby,bake
```

#### Helper methods?
That code is kinda messy. We can extract some methods and **not** having them showing up as tasks. Make them `private` that's it.

```ruby
# Creates a new post
#
# @param post_name [String] name of the post to be created.
# @param extension [String] file extension of the post to be created.
# @param categories [Array(String)] categories of the post.
def new_post(post_name, extension = 'md', categories: [])
  path = post_path(post_name, extension)
  content = post_content(post_name, categories)

  File.write(path, content)
end

private

def post_path(post_name, extension)
  "#{slugify(post_name)}.#{extension}"
end

def post_content(post_name, categories)
  <<~CONTENT
    ---
    title: #{post_name.capitalize}
    categories: #{categories.join(' ')}
    ---
  CONTENT
end

def slugify(str)
  str.downcase.gsub(/ /, '-')
end
```

Yeah, that looks much better. And now we can use those methods in other tasks too 😉.

#### Nested commands
If we want to replace Rake, we need to have nested commands. They're called recipes in **`Bake`**. The tasks are namespaced by their file names. So, let's do it.

1. Create a dir `bake/` and a file `post.rb` there.
2. Copy all the content of `bake.rb` and move to `post.rb` (keep `bake.rb` empty on the root).
3. Rename the task `new_post` to `new`.

```ruby
# in bake/post.rb

# Creates a new post
#
# @param post_name [String] name of the post to be created.
# @param extension [String] file extension of the post to be created.
# @param categories [Array(String)] categories of the post.
def new(post_name, extension = 'md', categories: [])
  path = post_path(post_name, extension)
  content = post_content(post_name, categories)

  File.write(path, content)
end

private

# ...

```
Now you can call it like this:

```bash
$ bake post:new 'Nested task!'
```

#### Listing tasks
To list all available tasks run:
  
```bash
$ bake list
```

<!-- <img style="display: block; margin: 0 auto;" src="/assets/img/bake-list.png"> -->
<p style="text-align: center;">Bake has this nice output when listing tasks</p>

You can filter tasks by providing a pattern:

```bash
$ bake list post
```

## Wrapping up
Bake makes really easy to create tasks. No DSL, no new syntax to learn. Just plain old Ruby methods! If you like it, give it some love by starring the repository [on Github][bake-gh].

[bake-gh]: https://github.com/ioquatix/bake/
