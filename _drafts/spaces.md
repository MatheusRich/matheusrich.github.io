---
layout: post
title: 'Use Spaces to Improve Your Code'
date: 2021-08-13 11:58:53 -0300
categories: code quick-tip
---

Writing code is similar to writing an essay: it consists of many small parts related to each other.
One big giant blob of words is hard --- and tedious --- to read. To address this, we use paragraphs. Those
same structures can benefit our code. Here's how:

Separate each test phase.

```rust
fn sum(a, b) -> i64 {
  a + b
}
```

```rust
#[test]
fn it_sums_two_numbers() {
  let a = 1;
  let b = 2;
  let result = sum(a, b);
  assert_eq!(3, result);
}
```

```rust
#[test]
fn it_sums_two_numbers() {
  let a = 1;
  let b = 2;

  let result = sum(a, b);

  assert_eq!(3, result);
}
```

Split mixins, associations, validations, etc.

```ruby
class User
  include Clearance::User

  has_many :books
  belongs_to :organization

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
```

## Separate calculations from the return value

This technique is especially useful when the language allows omitting the `return` keyword.

```rust
pub fn log_msg(label: &str, msg: &str) {
  let msg = msg.trim().capitalize();
  let log_label = format!("[{}]", label.green());

  log_label + msg
}
```

It helps you to extract functionality too

```rust
pub fn log_msg(label: &str, msg: &str) {
  let msg = sanitize_msg(msg);
  let log_label = format_log_label(label);

  log_label + msg
}

fn sanitize_msg(msg: &str) {
  msg.trim().capitalize()
}

fn format_log_label(label: &str) {
  format!("[{}]", label.green())
}
```
