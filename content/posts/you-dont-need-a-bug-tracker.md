+++
author = "Steve Bennett"
date = 2015-01-15T11:20:27Z
description = ""
draft = false
image = "https://images.unsplash.com/photo-1536427824649-fbf2e4a33d40?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxMTc3M3wwfDF8c2VhcmNofDJ8fGJ1Z3xlbnwwfHx8&ixlib=rb-1.2.1&q=80&w=2000"
slug = "you-dont-need-a-bug-tracker"
title = "You don't need a bug-tracker"

+++


If you're writing software, chances are you use some sort of issue tracking tool. Or to be more precise, you most likely have a bug tracker. Jira, Bugzilla, heck, even an Excel spreadsheet. If you're diligent every time you find a bug you'll create a ticket in the tool. Most bug-tracking tools will guide you to add a severity and assign a priority. The aim of classifying a defect in this way is to help you know what to work on next. In most systems, the two aren't related. This means you can create defects with "Critical" severity, assigned a "Low priority".

In every organisation I've worked the process has been the same. And in every case, the number of issues in the bug tracker has grown and grown.

This is wrong. I believe that you don't need your bug-tracker.

## What is a defect
Throughout this piece I use the terms "bug" and "defect" interchangeably. In my mind, a "defect" is:

> "Any situation where the functionality doesn't meet the expectations of an actor interacting with the system."

## Reducing waste
Lean engineering is the process of improving efficiency in a system by eliminating waste. In a system, waste is anything which has a negative effect on productivity. Defects are often classified as one of the 7 wastes of lean software engineering.

Why? Well, maintaining a list of defects takes time. First there's the time required to capture every issue that's found. Then you need to classify it, prioritise it and finally plan when to fix it. Teams usually address this by holding regular bug triage sessions. In these sessions, the team will make decisions on severities and priorities. These are then used to influence the planning for the fixes.

During the triage session, them team may find issues which they disagree on. One common disagreement can be whether the defect is actually new functionality. In this situation, the right thing to do is convert this bug to a story and prioritise it.

The time spent on this triaging is time wasted by the team. A weekly bug triage meeting is not unheard of for some teams. It seems strange to spend time arguing about a low priority bug when you could just spend the time fixing it instead.

## Measuring quality
If you're stock-piling your defects rather than fixing them then someone will use them as a measure of quality. The more defects you have, the lower the quality. What's more, I've seen these measures used as quality gates. Statements such as "A release to production can contain no P1 issues" are common. I can work with that rule - I'll just make my issues P2 instead. Sorted.

The metrics can also show whether the software is gaining or losing "quality". If the number of defects is raising, is it because the software is of a lower quality? Or is it because we're putting a bigger focus on testing? Just looking at the metric is dangerous.

## False hope
The defects you're tracking might be causing you're customers more harm than you realise. This is especially true if you're working in a transparent environment.

If you add an open defect to your tracker then you give people who look at it false hope that you'll address the issue.

When looking at what to do next, low priority bugs usually lose out to new feature. You can see why this is the case. If the issue isn't that severe then the resolution can wait. If you have misjudged that severity then your customers will tell you. At this stage, you can revise the severity and address the issue then. If your customers remain quiet then you might have got away with it.

Except this isn't the case. By leaving the ticket open you give your customers false hope that you will fix it. Whilst the ticket is open, customers will think that you will addressing it soon. So they'll remain quiet waiting for the fix.

If you're not going to fix something, close the ticket and let the customer know. At least that way, you're not setting expectations that you can't live up to. Closing the ticket may trigger a conversation with the customer. Any chance to further understand your customers is a good one.

## Address defects immediately
Bug-tracking tools are necessary when you find defects quicker than you resolve them. If the rates are roughly equal then you don't need a tracker. You will need something to show what you don't plan to fix, but this could be as simple as a list of issues.

Priorities no longer matter. Severities are only used to influence how you communicate to your stakeholders.

So how do you reach this situation? The answer, it turns out, is pretty simple. When someone finds a bug - address it immediately. Do the triage there and then to work out what your response needs to be. In most cases you have a simple choice to make:

- Drop everything a fix the bug
- Decide you're never going to address it and close the issue.

## Apply the fix
This is the response that I prefer to choose. Knowing that something is wrong in the systems I work on is uncomfortable for me.

It's easiest to fix an defect as soon as it's found. The code you'll be working with will be closest to one where you found the issue. The functionality will also be close. Both of these things should make the issue easier to reproduce and fix.

Once you've reproduced the defect, figure out the best way to test for it. Write the test case. The best way might be a unit test, or it could be a manual check. Either way, you need to know that you can reproduce the issue and how to check that you've fixed it.

Fix it. Test it. Release it. Unreleased fixed defects, like any unreleased code, is also waste in your system.

## Close the issue
Closing the issue at this point may sound a little drastic. After all, there's a chance that when work slackens off you can address the issue. But let's face reality, it's rare that you get the chance. If you don't address the defect now, you never will. That bug will sit on your backlog forever. As soon as this happens, you'll have to deal with the bug-tracking accounting.

The value of storing bugs in the hope of fixing them in the future diminishes as time passes. Software evolves and the bug reported will evolve. In the best case, changes in the application will mean that the bug is no longer relevant. New functionality means that the bug is no longer present. Refactoring might remove the defect as a side-effect. Either way, the tracked bug no longer exists.

In the worst case the bug evolves and spawns other bugs as the application evolves. What started out as a low priority defect could have now mutated into a bigger problem.

There is a third case. Neither of these things could happen and the bug will just continue to exist. Remember I talked about "false hope"?

So, close the issue and add it to the pile of stuff you know about but "Won't Fix".

## The unspoken third option
There is a third option and it troubles me more than the others. In some cases, the defect raised might actually describe a new feature. In this situation, you should move the issue to the product backlog.

Now this sounds like the defect tracking accounting I spoke about earlier. How is this different?

It's not, which is what troubles me. In essence, you're doing the accounting again, converting defects into stories to deliver later. Be careful with your use of this option. You must communicate well with the person who raised the issue. It is your responsibility to ensure that they know understand what you've done.

That said, the same rule applies to stories as defects. If you don't plan to ever build the new functionality then close the issue. Closing the issue signals that you don't see the functionality as necessary. Remember - you don't want to create false hope.

## When this works, and when it doesn't
A Zero-Bug policy won't work for every team . It relies on some development practices to be effective. It's also key to understand that it's not always as black and white as I've laid out here.

You will still have conversations of "defect" v "feature". The key thing is to spot when they're happening and bring them to a decision. Time spent debating this is time wasted. Time that you could spend fixing the issue.

There is a need for the team to be using a continuous delivery system to rollout changes. As I've mentioned, fixed defects that aren't available to customers are waste. Using continuous deployment, each fix will result in a deployment to production. This means that you don't need to track what's fixed where.

A zero-bug policy doesn't work well when you think of testing as role rather than an activity. Here, there is a channel of communication needed between the testers and developers. As time passes between the fixes, there is a need for tracking the defects. Where this is the case, it is only a matter of time before the number of tracked defects become a measure for quality.

Where testing is an activity the feedback loops are often tighter. The need for a tracking tool to assist communication is no longer valuable.

My current team has a engineer with a test specialism (software engineer in test). Our engineers test in pairs, meaning that we're often able to apply a fix as soon as we find a problem.

## Drop the bug-tracker
So, drop your bug-tracking tool.

Or at least stop stock-piling defects that you don't plan to fix. If you find a defect, make the decision - Fix it or Close it.



