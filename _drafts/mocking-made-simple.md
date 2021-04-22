---
layout: post
title: 'Mocking Made Simple'
date: 2021-04-01 11:16:28 -0300
categories: testing refactoring mocks quicktip
---

> **TD;DR:** Inject dependencies instead of mocking functions.

I was refactoring some React Native code the other day and ended up extracting the following
function:

```js
// src/screen.js

const logScreenOpened = async screenName => {
  try {
    await FirebaseLogger.logScreenView({screen: screenName});
  } catch (e) {
    console.error(`Could not log screen view. Error: ${e}`);
  }
};
```

When I got to testing, I wanted to change the logger behavior in each test case, but I was
struggling with [Jest mocks][jest-mocks]. I wanted to do something like this:

```js
// tests/screen-test.js

describe('logScreenOpened', () => {
  it('logs a screen view', () => {
    // TODO: mock logger's `logScreenView`

    logScreenOpened('HomeScreen');

    // TODO: expect logger to have received `logScreenView` with `{ screen: 'HomeScreen' }`
  });

  it('logs to console if logger raises an error', () => {
    // TODO: mock logger's `logScreenView` to raise a error

    logScreenOpened(null);

    // TODO: expect console to have received .error
  });
});

const logScreenOpened = async screenName => {
  await FirebaseLogger.logScreenView({screen: screenName});
};
```

It was taking more time than I wanted to, so I gave up and
came up with other solution. Not a fancy solution, neither changing the mocking library. It was, in
fact, a very old one (and very known among Java devs): **Dependency Injection** (DI for short).

## Injecting dependencies

So, instead of accessing `FirebaseLogger` directly, we'll provide it as an _argument_ of our function:

```js
// src/screen.js

const logScreenOpened = async (screenName, logger = FirebaseLogger) => {
  await logger.logScreenView({screen: screenName});
};
```

This function is almost the same of the previous implementation, but receiving `logger` as an
argument gives us some flexibility.

Here's the thing: the `logScreenOpened` function don't need to know what `logger` is. As long as it
is an object that responds to `logScreenView`, we're good. That's the only thing we care about. This
is known as duck-typing (or interfaces).

Back to testing: now we can change the logger implementation as we wish:

```js
describe('logScreenOpened', () => {
  it('logs a screen view', () => {
    const logScreenViewMock = jest.fn();
    const fakeLogger = {logScreenView: logScreenViewMock};

    logScreenOpened('HomeScreen', fakeLogger);

    expect(logScreenViewMock).toHaveBeenCalledWith({screen: 'HomeScreen'});
  });

  it('logs to console if logger raises an error', () => {
    const logScreenViewMock = () => {
      throw 'Some error!';
    };
    console.error = jest.fn();

    logScreenOpened('HomeScreen', fakeLogger);

    expect(console.error).toHaveBeenCalledWith(`Could not log screen view. Error: Some error!`);
  });
});
```

<small>OBS: We could've injected the `console.error` bit too, but for this post I decided to keep things simple.</small>

## Going ✨ fancy ✨

We don't have to always inject the dependency directly in our methods. We could go fancy and have a
logging module that gives us different loggers depending on which environment we're working on.
Something like this:

```js
// config/log.js
import {FirebaseLogger} from 'firebase-logger';
const TestLogger = {
  // simplified code to run in tests
};

export const logger = process.env.NODE_ENV === 'test' ? TestLogger : FirebaseLogger;
```

And in the app code we just import it:

```js
// src/screen.js

import {logger} from 'config/log';

const logScreenOpened = async screenName => {
  await logger.logScreenView({screen: screenName});
};
```

## Speeding up

Refactors like this are nice when you want to to improve test performance too. Our fake logger is
very lightweight, so those test are blazing fast! Use this to your advantage!

Let's say we have an function that does some heavy computation:

```js
function doStuff() {
  Lib.veryHeavyComputation('some', 'params');

  doMoreStuff();
}
```

We don't want our tests to be slow, so let's do the same thing here: inject dependencies.

```js
function doStuff(lib = Lib) {
  lib.veryHeavyComputation('some', 'params');

  doMoreStuff();
}
```

So, in our tests we swap the implementation:

```js
describe('doStuff', () => {
  const fastLib = {veryHeavyComputation: jest.fn()};

  doStuff(fastLib);

  expect(fastLib).toHaveBeenCalledWith('some', 'params');

  // other expectations
});
```

Now we have fast tests but guaranteeing the same API!

## Wrap up

Don't be afraid of this kind of code! As I said, there's nothing _new_ here. Is an old techniche
used everywhere. In fact, [Elixir][elixir]'s guides [encourages this very approach][elixir-mocks]!
They call it "mocks-as-a-noun" (in opposition of mock-as-a-verb).

One think to keep in mind: **we must keep the API of our fake logger in sync with the original
one**. This is important because we don't want our tests passing but our production code failing. So
is it good to have a integration test covering the usage of that mock too!

That's it, happy mocking! <small>(wait, that's a verb!)</small>

[jest-mocks]: https://jestjs.io/docs/manual-mocks
[elixir]: https://elixir-lang.org/
[elixir-mocks]: https://elixirschool.com/en/lessons/basics/testing/#test-mocks
