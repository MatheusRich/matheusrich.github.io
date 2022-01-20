---
layout: post
title: "TIL: JavaScript's void Operator"
date: 2022-01-20 11:54:45 -0300
categories: TIL javascript
---

Today I discovered the [`void`
operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/void#immediately_invoked_function_expressions)
in JavaScript. It evaluates an expression but always returns `undefined`.

```js
console.log(void "hello world") // prints `undefined`
```

It can be used on a
<a href="https://developer.mozilla.org/en-US/docs/Glossary/IIFE">
  <abbr title="Immediately Invoked Function Expressions">IIFE</abbr>
</a>,
which usually uses parenthesis to make the function definition be interpreted
as an expression and not a declaration:

```js
void function() {
  console.log("hello world")
}();
// prints "hello world"


(function() {
  console.log("hello world")
})();
// prints "hello world"

function() {
  console.log("hello world")
}();
// SyntaxError
```

This operator is also useful to ensure that an arrow function always return `undefined`:

```js
// changes to the return value of `doSomething` won't affect this code
button.onclick = () => void doSomething();
```

## Caveat

It's important to note that this operator has a [high precedence]
with right-to-left associativity, so you may want to use parenthesis to
correctly construct some expressions:

```js
void "hello" + " world" // parsed as: (void "hello") + " world"
// => 'undefined world'

void ("hello" + " world") // parsed as: void ("hello" + " world")
// => undefined
```

[high precedence]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Operator_Precedence#table
