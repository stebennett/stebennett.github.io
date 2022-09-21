+++
author = "Steve Bennett"
date = 2015-02-27T15:44:40Z
description = ""
draft = false
slug = "stop-mocking-me"
title = "Stop mocking me"

+++

Unit testing can be hard. And it gets harder when you have to test code with with external dependencies. The way you deal with this will depend on whether you are a [classical or mockist programmer](http://martinfowler.com/articles/mocksArentStubs.html#ClassicalAndMockistTesting). Most people don't exist at the extremes, but instead are somewhere along the line. This isn't a bad thing. Being pragmatic in your decisions shows that you're a [mature engineer](http://www.sbio.me/blog/2015/1/26/thinking-about-senior-engineers).

Dealing with legacy code is also a thorny problem that most of us will encounter. I don't believe that anyone can avoid this in their career. In a recent [blog post](http://tomassetti.me/mocking-in-java-why-mocking-why-not-mocking-mocking-also-those-awful-private-static-methods/), Federico Tomassetti describes his approach to this problem. He talks about a minor change that he made, and the testing he wrote to support it. The problem is, the change he needed to make is in a private static method - `dealsToDisplay`. And as he found, writing unit tests for that wasn't straightforward.

What Federico goes on to describe is his process of writing unit tests around dealsToDisplay. He exposes his method using PowerMock and reflection to manipulate the code at runtime. What he comes up with is pretty cool, and it does the job. In fact, it's a pretty neat solution to the problem that faced him. It means he touches the minimal amount of code, producing his fix with tests.

My only reservation is should Federico have had to go to these lengths to test his changes? Also, in doing so, was he ignoring the underlying problem?

What follows is a my approach to fixing the issue and refactoring the code. I'm not saying that what Federico did was right or wrong. In fact I'm pretty certain he did the right thing as he had full visibility of the context. It's a nice exercise to look at the problem and discuss the alternatives.

I've been in situations where all you want to do is get in, fix the code and get back out again. The last thing you want to do is get stuck in the weeds. But as you apply this approach over and over again, the weeds will get higher and thicker. Sometimes you need to start attacking the root.

Back to Federico's problem. Let's think about what that private static method means. The method is only visible to its host class. This means that anything calling this method also lives in the same class. Knowing this, my immediate thought here wouldn't be of how to invoke the method in a test.

First up, I would have looked at the callers of `dealsToDisplay`. My thoughts would be to wrap those in tests covering my change. Depending on how spiky the code is, this might be just as difficult. I also might struggle to isolate and test my changes.

This might not be possible, or there may be too many different callers to cover. If this were the case, I would need to take a different approach.

From what I can infer from the tests and name of method, `dealsToDisplay` is acting as a filter. In my mind, this is enough for me to promote this to a new abstraction. In this case, my choice might be to create a new class called `DealFilter`. This class would have the single method, `dealsToDisplay` containing the existing code.

````java 
  class DealFilter {
      Map<UUID, Set<String>> dealsToDisplay(/*Params..*/) {
        // ...
      }
    }
````

Next up, I'd change the original class to include a private static instance of this class.

````java
  private static final DealFilter DEAL_FILTER = new DealFilter();
````

All original callers of `dealsToDisplay` would now call the method from the deal filter.

````java
  DEAL_FILTER.dealsToDisplay();
````

I understand that it looks like we're introducing abstractions here to test our code. I also know that this can be a dangerous path to tread. [David Heinemeier Hansson](https://twitter.com/dhh) has spoken at length about [Test Induced Design Damage](http://david.heinemeierhansson.com/2014/test-induced-design-damage.html). One could argue that we've just damaged our code. Federico recognises this risk too. He speaks of the problems that can come from introducing abstractions, complete with interfaces.

Programming to interfaces is generally a good guideline to follow. But, it's not a hard and fast rule. Sometimes, the extra layer of indirection that comes from interfaces isn't required. You aren't going to replace it, and [YAGNI](http://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it). It's also no longer necessary for mocking in tests. [Mockito](https://code.google.com/p/mockito/) (along with other good mocking frameworks) can mock classes.

In the example, Federico also mocks out some dependencies that `dealsToDisplay` calls. He is liberal with his mocking, and mocks out `URLEncoder` (although I'm not sure if JDK version). This is something Writing a unit test does not have to mean complete isolation. It's about being pragmatic. I'm happy for `URLEncoder` to do it's thing when my tests are running. I'm happy for Logger to log. Mocking these entities doesn't provide any more value for me. They don't slow down the tests, and I don't need to control their responses.

The concept of a "unit" is on a sliding scale. Some people may tell you different, but you can still write unit tests depending on collaborators. If you're always taking a by-the-book approach to this then you might be making life more difficult for yourself.

And one final thought, I've added the use of [PowerMock](https://code.google.com/p/powermock/) to the list of "[code smells](http://en.wikipedia.org/wiki/Code_smell)". If I ever find myself reaching for it, I take a step back and look for the underlying problems.

Of course, I'm making all these statements without knowing the code in question. I'm showing no respect to the context. So, with this in mind, you should just ignore everything you've just read.
