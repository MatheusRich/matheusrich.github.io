---
layout: post
title: 'Mocking Made Simple'
date: 2021-04-01 11:16:28 -0300
categories: testing refactoring mocks quicktip
---

I was refactoring some React Native code the other day and ended up extracting the following
function:

```js
// src/screen.js

const logScreenOpened = async screenName => {
  await FirebaseLogger.logScreenView({screen: screenName});
};
```

When I got to testing, I wanted to change the logger behavior in each test case, but I was
struggling with [Jest mocks][jest-mocks]. It was taking more time than I wanted to, so I gave up and
came up with other solution. Not a fancy solution, neither adding another mocking library. It was,
in fact, a very old one (and very   known among Java devs): Dependency Injection (DI for short).

```js
// src/screen.js

const logScreenOpened = async (screenName, logger = Firebase) => {
  await logger.logScreenView({screen: screenName});
};
```

You don't have to always inject the dependency directly in your methods. You could go fancy and have a

```js
// test/something-test.js
import {FirebaseLogger} from 'firebase-logger';

const logScreenOpened = async screenName => {
  await logger.logScreenView({screen: screenName});
};
```

```js
// config/logging
import {FirebaseLogger} from 'firebase-logger';
const TestLogger = {
  /* ... */
};

export const logger = process.env.NODE_ENV === 'test' ? TestLogger : FirebaseLogger;
```

```js
// src/screen.js

import {logger} from 'config/logging';

const logScreenOpened = async screenName => {
  await logger.logScreenView({screen: screenName});
};
```

In fact, [Elixir][elixir]'s guides [encourages this very approach][elixir-mocks]!

[jest-mocks]: https://jestjs.io/docs/manual-mocks
[elixir]: https://elixir-lang.org/
[elixir-mocks]: https://elixirschool.com/en/lessons/basics/testing/#test-mocks
