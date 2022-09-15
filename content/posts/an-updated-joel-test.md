+++
author = "Steve Bennett"
date = 2016-07-22T11:22:43Z
description = ""
draft = false
image = "https://images.unsplash.com/photo-1554306274-f23873d9a26c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxMTc3M3wwfDF8c2VhcmNofDE2fHxjb2RlfGVufDB8fHw&ixlib=rb-1.2.1&q=80&w=2000"
slug = "an-updated-joel-test"
title = "An updated Joel Test"

+++


Wow.

Next month it'll be 16 years since the original publication of the [Joel Test](http://www.joelonsoftware.com/articles/fog0000000043.html). In case you're not aware of the Joel Test, it's a simple 12 question check for evaluating how good a software team is. It's not meant to be exhaustive, and scoring is simple - 1 point for each question you can answer yes to. If you're scoring 10 or lower, you've got serious problems.

In the last 16 years, software engineering has changed a lot, and I think it's time to update [Joel Spolsky](https://twitter.com/spolsky)&#8216;s "highly irresponsible, sloppy test" (Joel's words, not mine).

The original Joel Test:

1. Do you use source control?
1. Can you make a build in one step?
1. Do you make daily builds?
1. Do have a bug database?
1. Do you fix bugs before writing new code?
1. Do have an up-to-date schedule?
1. Do you have a spec?
1. Do programmers have quiet working conditions?
1. Do you use the best tools money can buy?
1. Do you have testers?
1. Do new candidates write code during their interview?
1. Do you do hallway usability testing?

One of the strengths of the original test was the ability to get a quick yes/no answer to each of the questions. This was possible because the questions are closed, easily understood and unambiguous. In my revised list, I've attempted to recreate this, as I think the simplicity and succinctness is valuable.

I'm also not going to push it past 12 points. It's pretty easy to create a long list of traits a modern software team should exhibit, but by keeping it short, I aim to focus on those things that will bring a team the most success.

Whilst I'm a fan of development with agility, and extreme programming, I've tried not to slant the list too much in this way. I think there's a tendency within our industry to believe that becoming agile will solve all of our problems, and will mean that we're building software the "right" way. However, it's just the fact that sometimes, for some projects, implementations of agile such as [Scrum](https://en.wikipedia.org/wiki/Scrum_(software_development)(software_development)) or [XP](https://en.wikipedia.org/wiki/Extreme_programming) aren't necessarily the right answer.

So here it is, my take on the Joel Test. Just as irresponsible and sloppy as the original, it's the Steve Test:

1. Do you use source control?
1. Can you build and deploy your software in one step?
1. Do you build on every commit?
1. Do you have a bug database?
1. Do you fix bugs before writing new code?
1. Do you measure your progress in terms of value delivered?
1. Do you have a runnable spec?
1. Does your environment foster collaboration?
1. Do you use the best tools money can buy?
1. Is testing everyone's responsibility?
1. Do new candidates write code during their interview?
1. Do you do hallway usability testing?

## 1. Do you use source control?
Hopefully it should be painfully obvious how necessary this is to building software. Even for personal projects, and experiments I use source control. The clear favourite at the moment is [Git](https://git-scm.com/) (and [Github](https://github.com/)) however, I'm not going to go as far as pushing that teams should all be using DVCS in order to get a point.

## 2. Can you build and deploy your software in one step?
We need to move beyond single step build being the target, and more towards single step build and deployment. The ability to do this is at the heart of [continuous delivery](https://continuousdelivery.com/), and for more progressive teams, [continuous deployment](https://puppet.com/blog/continuous-delivery-vs-continuous-deployment-what-s-diff). The ability to create a software package in an automated single step, and then deploy that package in a similar manner, creates massive opportunities for the team and business.

A team getting a check mark here will typically have a set of scripts which create a build and package that build ready for distribution. They'll also have a set of scripts that deploy the application to wherever it needs to go - be this a set of servers, a PaaS, or the app store.

In all cases, there's no manual intervention required from a developer, apart from running the script. Removal of the humans from the process, removes the potential for mistakes, and ensures that a predictable, repeatable and resilient process is run each time the software needs to be updated.

## 3. Do you build and verify on every commit?
It's widely known that the smaller the feedback loop, the better. Since Joel's original list we've got much better at managing the building and testing of applications, creating many libraries and tools to help us in our work. Computing power has also improved dramatically, so that builds can be executed in a manner of minutes, rather than hours.

So, rather than building once a day, the aim should now be to build as frequently as possible, in order to tighten the feedback loop. In order to achieve this goal, the team will need to have some sort of build server in place. Whilst it's not necessary to practice [continuous integration](https://continuousdelivery.com/foundations/continuous-integration/) to achieve this goal, doing so will increase effectiveness.

It's also my belief that it's no longer good enough to just build every commit. We should be aiming to provide some level of verification as part of this build. Typically, this is done through unit testing, however I'm appreciative that for some teams, this might not be the right answer, and other automated verification checks might be more appropriate. For that reason, I've not included the specific verification required on each build.

## 4. Do you have a bug database?
I'm not a fan of stock-piling defects with the view of fixing them later. In my experience, later never comes. I do concede though that knowing the issues with your products is important, as is communicating to your stakeholders your intentions on fixing them. A bug-tracker is an effective way of achieving these things, so I think that for these reasons it's still relevant.

That said, I firmly believe that all teams can benefit from having a 0-defect policy - fix it or close it as "won't fix".

## 5. Do you fix bugs before writing new code?
Known defects should be fixed before writing new code, with those minor defects that we "won't fix" recorded and justified. Not doing so builds up debt in the project, and as with all debt, the longer it remains more interest it accrues increasing the cost to repay.

I was considering changing this question to "Do you work on the thing that delivers the highest value first?", however the measurement of "highest value" is open to interpretation. As this would lead to a question which is ambiguous, the original remains.

## 6. Do you measure your progress in terms of value delivered?
Scheduling software delivery with milestones and deadlines is no longer an effective way to ensure that delivery of a product is achieved. Apart from anything else, it becomes necessary to estimate the amount of time needed to complete the work, and unless the nature of the work is precisely the same as something else which has already been completed, this estimate is likely to be unreliable.

Because of this, your schedule is likely to be unreliable, and as such, the only thing that you'll end up measuring is that 3 months worth of time passes in 3 months.

It's therefore better to aim for a team that measures it's progress in terms of value delivered. In order to be able to achieve this, it's necessary to be able to measure the real customer value delivered. Creating the ability to measure real customer value will unlock other potential within the team such as the ability prioritise requests and requirements on those things that bring the highest return.

Focussing on delivering the first 20% of the project that delivers 80% of the value can sometimes be enough.

## 7. Do you have a runnable spec?
A subtle, yet important modification to this question. Having a specification for your software sounds like a reasonable thing to aim for, yet with no way to verify that the specification and software is in sync, there's no way of knowing that the specification is valid. Systems also change as they are developed, as new requirements are uncovered. The specification therefore needs to be a living artefact, able to change and iterate as the software does.

Having a specification which describes your system, and that can be used to evaluate the implementation is much more valuable. The specification will evolve as the software does, and you'll be confident that the specification still accurately describes the state of the system.

Your runnable specification also helps to support questions 2 and 3, as you might want to use as part of your build verification stage.

For some teams, this will mean adopting tools such as [Cucumber](https://cucumber.io/) and writing your specifications using [Gherkin](https://cucumber.io/docs/reference). I don’t think it's a necessity to use these tools, yet they do facilitate writing runnable specifications.

## 8. Does your environment foster collaboration?
In the original list, question 8 promoted quiet working areas for programmers, to help them get into the "zone". Whilst I still think that there is value to this for some tasks, I believe that an environment that fosters and promotes collaboration will form a better basis for an effective software organisation.

Lots of companies have tried to short-cut their way to collaborative environments through movement to open plan office spaces. The intention is a good one, yet the execution is poor, and there is a slow growing [backlash](https://www.theguardian.com/money/work-blog/2014/sep/29/open-plan-office-health-productivity) [against](http://www.slate.com/articles/business/the_ladder/2016/05/open_plan_offices_add_distractions_and_hurt_productivity.html) [the open plan office](https://www.washingtonpost.com/posteverything/wp/2014/12/30/google-got-it-wrong-the-open-office-trend-is-destroying-the-workplace/). What's more, I've personally found that open plan offices encourage engineers resort to noise cancelling headphones when they need to get individual work done. When the whole room has headphones on, you have to question whether the switch to open plan offices was worth it.

Instead, we need to make spaces where individual teams can collaborate effectively. Teams should have well defined areas, with the tools they need (question 9) such as whiteboards and information radiator screens. The team themselves should be in control of their environment and be able to modify it to something which works for them. This includes repositioning furniture - much to the dismay of many facilities managers.

It also stretches to the way teams are incentivised and rewarded. Whilst many software companies have dropped stack ranking, it's still widely used in the corporate world. Stack ranking pits individuals against each other, with each person attempting to demonstrate their worth above others - not really what you'd expect of an environment which promotes collaboration is it?

Collaboration is also promoted where individuals are encourage to contribute outside of their specialism. As an example, teams that segregate testers from engineers aren't supporting collaboration. An organisation with defined silos such as these will be more likely to run into problems delivering software.

## 9. Do you use the best tools money can buy?
Anytime you ask an engineer to use a sub-standard tool in order to do their job, you're adding to their frustrations at getting the work done. Joel lists some good examples of micro-frustrations that an engineer might encounter from not having the right tools. A couple more examples might be not having the right IDE for the work you're doing, or not being able to use the best monitoring or logging systems.

It's not just about money though, it's also about freedom of choice. Giving engineers the same standard laptop build as everyone else in the company, complete with restrictions on what can and can't be installed is a sure way to frustrate people.

Freedom of choice should also extend to the software stack used to build a product. Java and Oracle RDBS is not the right answer to every problem. Forcing square pegs into round holes won't lead to productive teams and good quality software.

## 10. Is testing everyone's responsibility?
Testing is no longer only the responsibility of testers. Modern software development, and many of the checks in my new list rely on testing being part of everyone's role. I expect that engineers write tests, and that figuring out that something works is not left to another team (see above).

The argument that Joel makes around engineers being more expensive than testers, and the follow on that you should have a testing team in order to achieve developer cost efficiencies is no longer relevant. Testing is a craft, in the same way that development is a craft and as such, a tester will add skills to a team in the same way that a front-end or back-end engineer will. I hope that we're moving past the idea that testers are somewhat lesser individuals in an software organisation.

Making testing everyone's responsibility ensures that we're building quality into our products, rather than attempting to tack it on at the end. It has the consequence of tightening the feedback loop between writing code and testing it, meaning that the time between issues being found and fixed, becomes shorter. In the case where engineers are building automation checks, the time taken to execute this loop could be seconds. Isn't this much better than throwing builds over the wall for others to verify?

## 11. Do candidates write code during their interview (process)?
At some stage in the interview process, any engineering candidate should be writing code. You're hiring this person to write code, so you need to see how they go about it, and what their code looks like. Personally, I prefer to pair with candidates, as the feedback loop is tighter, and I can evaluate their coding skills in a fair way.

In my opinion, writing code on a whiteboard doesn't enable you to get a check-mark here. It needs to be done in a natural environment, under standard working conditions.

## 12. Do you do hallway usability testing?
I think this is still really relevant. There are lots of teams that do much, much more than this in terms of usability testing, and that's fantastic. However, I think that this should remain as an attainable minimal goal for all teams.



