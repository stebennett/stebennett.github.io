+++
author = "Steve Bennett"
date = 2016-01-26T10:42:22Z
description = ""
draft = false
image = "https://images.unsplash.com/photo-1494599948593-3dafe8338d71?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxMTc3M3wwfDF8c2VhcmNofDJ8fGNoZWNrbGlzdHxlbnwwfHx8&ixlib=rb-1.2.1&q=80&w=2000"
slug = "what-is-acceptance-criteria"
title = "What are Acceptance Criteria?"

+++


How do you know when something is "Done"?

What do you use to measure "completeness" of the thing you are doing?

In agile development, [User Stories](https://en.wikipedia.org/wiki/User_story) are often used to define the thing to be done. The user story outlines the goal that a user wants to achieve, and the reason why a user wants to achieve this goal. It provides the who, what and why for the thing to be done. User stories vary from team to team, however one of the more popular formats is "As a&#8230; I want to&#8230; So that&#8230;".

> "As an admin user,
> I want to be able to reset a user's password,
> So that locked out users can access the system"

We’ll use this password reset feature as our starting point for the rest of this article.

The user story lays out the functionality the product owner wants to see, but doesn’t give the constraints on how we should achieve this.

Whilst the story succinctly defines the feature, it doesn’t give the implementers enough detail to know when they are done, or when the implementation is “good enough”. Nor does it capture any assumptions that the product owner might have about how the feature will work.

* Should the password be reset to a predefined one?
* Or should it be randomly generated, or one chosen by the administrator?
* Also what happens to this new password - does it get emailed to the user?

The answers to these questions, are what is needed to be implemented in order for the feature to be done, or the acceptance criteria. More precisely, the acceptance criteria are the conditions that the feature must satisfy in order to be accepted by the customer or on behalf of the customer. Or to put it another way, they help to define when you’re done by defining the boundaries of the scope of the implementation.

Well written acceptance criteria can be evaluated to a pass or fail. This means that acceptance criteria can also help you with your testing, providing a number of test cases defining what should happen in different scenarios. Using our password reset story as an example, we might define that a new random password is created when the password is reset. We’re still not defining exactly how this is implemented, but we are setting an expectation of how the system should react. We’ve also set up our first test case - Is the password generated random? (let’s leave aside the conversation about randomness)

The act of defining acceptance criteria also helps you to explore the story, giving you the opportunity to ask all the “what if” questions. What if the user resets their password twice? What if the new password cannot be generated? What should happen to the new password?

In answering these questions to define acceptance criteria, you may find that the scope of the story increases. This might lead to you splitting the original story into several smaller stories, each of which incrementally provides additional value. For example, we may answer the “What should happen to the new password?” question by saying “it should be emailed to the registered user”. Our original story is now doing two things - resetting the password and emailing it to the user. When there’s two valuable parts to a story, it’s an indicator suggesting that the story can be split into two. For our example, I’m going to split the story, and focus on just resetting the password.

Splitting stories this way allows the team to think about the value that they are providing by adding a feature, and question whether the full implementation is really necessary. We might be able to get 80% of the value, by just applying 20% of the effort. Knowing when to split a story can be difficult, however exploring acceptance criteria can help you to identify new stories.

So how do you build an effective set of acceptance criteria? I’ve found that the best way to do this is through conversation with the product owner around 4 key areas of the feature:

- **Behavioural** - What should the feature do?
- **Performance** - What are the performance characteristics of this feature? How will it scale?
- **Usability** - How easy is the feature to use?
- **Error Handling** - What happens when things go wrong?

The behavioural acceptance criteria should describe what the feature should do functionally. It shouldn’t prescribe exactly how the feature should work, but should instead describe the state of the system following a user's interaction with it. For example:

- following the reset operation the password is changed to a random 12 character alphanumeric string.
- following the reset operation, the new password can be used for subsequent user logins
- following the reset operation, the old password cannot be used for user logins
- the password reset option is only available to admin users

Performance acceptance criteria define the constraints under which the feature must operate. Typically these acceptance criteria are defined in response times for a web application. You should also consider how the feature will scale.

- the password should be reset in under 250ms
- it should be possible to reset 1000 passwords a minute

In my experience, acceptance criteria around the usability are some of the hardest to define. The temptation may be to say “It must be user friendly” or similar, however this doesn’t provide you with something that you can definitively pass or fail.

- it should be possible to reset the password from a user page with one click

If you’re running [dual track scrum](http://www.svpg.com/dual-track-scrum/) to manage your UX process, I find that the usability acceptance criteria become implementation specific. This means that the acceptance criteria contain references to wireframes or visual design, and personally I’m OK with this. So, taking this approach, we can add to acceptance criteria:

- the password reset option should match the company style guidelines
- the password reset option should match the visual designs

Up until this point, all of the acceptance criteria we’ve seen make up the <em>[happy path](https://en.wikipedia.org/wiki/Happy_path)</em> for our feature. Acceptance criteria should also look at what happens when things go wrong. The <em>what-if's</em> asked here should provide insights into how the feature should react under invalid inputs, outages and other end of world scenarios.

- if a new password cannot be generated, then an error message should be displayed and the old password should not be changed
- if a new password cannot be stored, then an error message should be displayed and the old password should not be changed

If we put this all together, we end up with a fairly comprehensive set of acceptance criteria that defines how the the feature hangs together, and what happens when a user interacts with it.

As I mentioned earlier in the article, it should be possible to assign a pass or fail status to each of the acceptance criteria. At eBay, I was introduced to a way of thinking about acceptance criteria which made this explicit. This forced us to remove ambiguity and improve the quality of our acceptance criteria. Rather than using statements similar to the examples we’ve used so far, we would rephrase the acceptance criteria as a set of yes/no questions.

Taking this approach, our password reset acceptance criteria would be:


- Does the password reset operation the change the password to a random 12 character alphanumeric string?
- Following the reset operation, is it possible to login with the new password?
- Following the reset operation, is it not possible to login with the old password?
- Is the password reset option only available to admin users?
- Is the password reset and stored in under 250ms?
- Is it possible to reset 1000 passwords a minute?
- Is it possible to reset the password from a user page with one click?
- Does the password reset option match the company style guidelines?
- Does the password reset option match the visual designs?
- Is an error message displayed if a new password cannot be generated?
- Is an error message displayed if a new password cannot be stored?
- Is the old password unchanged if a new password cannot be generated?
- Is the old password unchanged if a new password cannot be stored?

I don’t believe that this list exhaustive, but for the purposes of the article I think it shows the value. I would expect that you could come up with more, or debate the validity of some of them.

A popular alternative method for writing acceptance criteria is the *Given, When, Then*. This format is derived from the [Behaviour-Driven Development](https://en.wikipedia.org/wiki/Behavior-driven_development) (BDD) approach devised by [Dan North](http://dannorth.net/). This format defines the context, the action and the result for a scenario. As an example, we can take our first acceptance criteria and redefine it as:

> *Given* I am logged in as an admin user,
> *When* I reset a user’s password
> *Then* a new 12 character alphanumeric random password is generated.

I can see the advantage of using this format, especially if you’re writing your code using BDD. For me, I prefer the question format as I find it clearer, more concise and easier to work with.

Finally, I’d like to look at the relationship between acceptance criteria and the [Definition of Done](http://manifesto.co.uk/definition-done/) (DoD). Whereas acceptance criteria is defined at a story level, the DoD is defined at a team level, and applies to all stories that the team works on. There’s an implicit relationship between the two, and when you see multiple stories with the same acceptance criteria, it’s often a hint that this can be promoted to your definition of done.

For example, looking back at the password reset acceptance criteria we see the following:

- Does the password reset option match the company style guidelines?

This acceptance criteria stands out because it doesn’t really add anything specific to the implementation of this story. In fact, it’s probably fair to say that this criteria could be applied to any story that the team implements. Rather than specify this for each story, we’ll promote this to our Definition of Done.

You shouldn’t be afraid of extracting acceptance criteria to your DoD when you see repetition. Just as you’d apply [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) to your code, you should apply it to your stories. Promoting acceptance criteria to your DoD enables you to focus your conversations around the specifics of a feature, which will lead to more valuable insights.

In this article we’ve seen how just defining a user story isn’t enough to describe what it is you need to implement. You need to go deeper, asking the key “what-if” questions about the user journey, context and behaviours of the feature. As soon as you start to discuss the feature, you’ll start to tease out requirements from the assumptions, which you can document as your acceptance criteria. Having a clear set of acceptance improves the chance that the whole team is clear on the scope of the implementation. Finally, for those acceptance criteria that you see again and again, then promote them to your Defintion of Done.



