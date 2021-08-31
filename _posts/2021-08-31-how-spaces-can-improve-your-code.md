---
layout: post
title: 'How Spaces Can Improve Your Code'
date: 2021-08-31 12:53:10 -0300
categories: code quick-tip refactoring
---

Writing code is similar to writing an essay: it consists of many small parts that interact.
One big giant blob of words is hard --- and tedious --- to read. To address this, we use
paragraphs. The same technique can benefit our code. Here's how.

## Logical blocks

> A paragraph is a self-contained unit of discourse in writing dealing with a particular point or
> idea.
> _--- Wikipedia_

The critical thing in this definition is "dealing with a particular point or idea". Structuring our
code with paragraphs (i.e., logical blocks) means we group related things and **visually separate**
them from the others. A simple new line makes a huge difference in readability. Let's look at some
examples to clarify this idea.

### Separate test phases

Consider this function: it takes two numbers and returns their sum. Pretty simple.

```rust
fn sum(a: i64, b: i64) -> i64 {
  a + b
}
```

A possible unit test for this function could look like this:

```rust
#[test]
fn it_sums_two_numbers() {
  let a = 1;
  let b = 2;
  let result = sum(a, b);
  assert_eq!(3, result);
}
```

While this test follows the [four-phase pattern][test-phases], separating each test phase makes
them more clear:

```rust
#[test]
fn it_sums_two_numbers() {
  let a = 1;
  let b = 2;

  let result = sum(a, b);

  assert_eq!(3, result);
}
```

### Grouping related concerns

Programmers often use structures like modules and classes to tie code together. It is a great
technique, but can lead to clutter if we're not careful.

Check out this Rails model. Even though it's only a few lines long, it's a bit hard to parse this
class.

```ruby
class User < ApplicationRecord
  include Clearance::User
  has_many :books
  belongs_to :organization
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
```

See how different it looks when we separate its logical blocks:

```ruby
class User < ApplicationRecord
  include Clearance::User

  has_many :books
  belongs_to :organization

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
```

Here, we grouped each section by its "theme" (mixins, associations, validations, query methods,
etc.). The spacing helps us see the logical separation between each section, which speeds us up when
searching where to add and change code.

### Separate calculations from the return value

Another great opportunity to use code blocks is in function bodies. We often do some preparation
work before return the result, so it's good to split those two parts up. This technique is especially
beneficial when the language allows omitting the `return` keyword.

_OBS: I'm omitting some details in this Rust implementation to keep it simpler._

```rust
enum FileFormat {
  HTML,
  Latex,
  Markdown,
  // ...
}

fn render_markdown_to(markdown_content: &str, format_to_convert_to: FileFormat) -> String {
  let renderer = match format_to_convert_to {
    FileFormat::HTML => HTMLRenderer::new(),
    FileFormat::Latex => LatexRenderer::new(),
    other => panic!("Cannot convert markdown to {}", other),
  };
  renderer.render(markdown_content)
}
```

For those unfamiliar with Rust, omitting the semicolon in the last line indicates the function's
return value. It's a subtle detail that is easy to miss. Adding a new line here makes it more
evident where the calculations end and what is the actual return value.

```rust
fn render_markdown_to(markdown_content: &str, format_to_convert_to: FileFormat) -> String {
  let renderer: Renderer = match format_to_convert_to {
    FileFormat::HTML => HTMLRenderer::new(),
    FileFormat::Latex => LatexRenderer::new(),
    other => panic!("Cannot convert markdown to {}", other),
  };

  renderer.render(markdown_content)
}
```
## Extracting behavior

Using logical blocks also helps us to refactor. It's particularly useful to extract functionality:
grouped lines probably will move together. Looking at the last example, we could extract the `match`
expression to its own function:

```rust
fn render_markdown_to(markdown_content: &str, format_to_convert_to: FileFormat) -> String {
  let renderer = renderer_for_format(format_to_convert_to);

  renderer.render(markdown_content)
}

fn renderer_for_format(format: FileFormat) -> Box<Renderer> {
  match format {
    FileFormat::HTML => Box::new(HTMLRenderer::new()),
    FileFormat::Latex => Box::new(LatexRenderer::new()),
    other => panic!("Cannot convert markdown to {}", other),
  }
}
```
## Simple but effective

Separating logical blocks is a technique that is really simple but highly effective in making code
more maintainable. Remember, we read code more than we write, so optimize your code for reading. A
little effort today can save your team hours in the future.

[test-phases]: https://thoughtbot.com/blog/four-phase-test
