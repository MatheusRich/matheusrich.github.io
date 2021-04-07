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
  it('logs in firebase a screen view', () => {
    // TODO: mock logger's `logScreenView`

    logScreenOpened('HomeScreen');

    // TODO: expect logger to have received `logScreenView` with `{ screen: 'HomeScreen' }`
  })

  it('logs to console if logger raises an error', () => {
    // TODO: mock logger's `logScreenView` to raise a error

    logScreenOpened(null);

    // TODO: expect console to have received .error
  })
})

const logScreenOpened = async screenName => {
  await FirebaseLogger.logScreenView({screen: screenName});
};
```

It was taking more time than I wanted to, so I gave up and
came up with other solution. Not a fancy solution, neither changing the mocking library. It was, in
fact, a very old one (and very known among Java devs): **Dependency Injection** (DI for short).

```js
// src/screen.js

const logScreenOpened = async (screenName, logger = Firebase) => {
  await logger.logScreenView({screen: screenName});
};
```

You don't have to always inject the dependency directly in your methods. You could go fancy and have
a logging module that gives you different loggers depending on which environment you're working on.
Something like this:

```js
// config/log.js
import {FirebaseLogger} from 'firebase-logger';
const TestLogger = {
  /* simplified code to run in tests */
};

export const logger = process.env.NODE_ENV === 'test' ? TestLogger : FirebaseLogger;
```

And in your app code you just import it:

```js
// src/screen.js

import {logger} from 'config/log';

const logScreenOpened = async screenName => {
  await logger.logScreenView({screen: screenName});
};
```

In fact, [Elixir][elixir]'s guides [encourages this very approach][elixir-mocks]!

[jest-mocks]: https://jestjs.io/docs/manual-mocks
[elixir]: https://elixir-lang.org/
[elixir-mocks]: https://elixirschool.com/en/lessons/basics/testing/#test-mocks
