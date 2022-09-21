+++
author = "Steve Bennett"
date = 2015-01-18T17:36:11Z
description = ""
draft = false
slug = "you-can-keep-your-bug-tracker-just-use-it-less"
title = "You can keep your bug-tracker, just use it less!"

+++
I recently published an article on my blog titled ["You don't need a bug tracker"](http://www.stevebennett.co/blog/2015/1/15/you-dont-need-a-bug-tracker). This article was also syndicated on [DZone](http://css.dzone.com/articles/you-dont-need-bug-tracker). Following the publication I received some feedback on it's contents. I'd like to take this opportunity to clear up a few things.

## The title
I'm aware that the title is inflammatory. It's also a little disingenuous. Of course, our development teams use issue trackers. Like source control, any good development team will use an issue tracker. Ours in Jira (although some teams are experimenting with Trello).

So if I'm now saying that good development teams use issue trackers, why did I suggest that everyone else should drop them?

I didn't, well not really. That wasn't the point of the article. If you read it through, you'll see that I'm asking you to fix or close issues as they're reported. What I don't think teams should do is allow the defects to build up.

We don't record all the defects we fix, if we fix them as part of the build then there's no real need to track them. If the bug reappears, then it's a new defect.

I chose the title to grab attention. There's so much written about software development that it can be hard to grab someones attention. "You don't need a bug-tracker" is a way of starting a conversation.

## Immediately?
One of the other points raised was my suggestion that you fix defects immediately. I was asked what "immediately" meant in this context. In reality, what I'm suggesting is that at the next opportunity, you fix the defect.

And the next opportunity should be sooner rather than later. If you're half-way through working on a feature, the next opportunity might be once you're done with this feature. The cost of context switching might harm you more than the existence of the defect.

I'm not advocating that you should always drop everything to fix the defect. I do think you should do is ensure that you address the defect before starting any new features (This is one of steps in ["The Joel Test"](http://www.joelonsoftware.com/articles/fog0000000043.html)).

Another question was about defects that you know will appear in the future - for example a leap year bug. Should you address them now? In my opinion, yes. Other things with compete for your attention between now and the time the defect surface. Which will mean it's likely you'll forget about it. If you know about it, just deal with it.

## Trusting you to do the right thing
Another question asked was how as an individual contributor do you know what is the most important thing for the users or company. I believe that it's your job as a software developer to understand why you're building the product. Not knowing the next most important thing suggests you don't know the product as well as you could. If this is the case, dedicate a little more time to understanding your customers and product.

I think that this question relates to another - "How does my manager know what I'm working on, and ensure it's the best use of my time?". Measuring performance of developers and testers through bug-count metrics is harmful to an organisation. It creates the wrong environment where delivering customer value comes second to internal metrics. Instead, focus on showing your manager the value you've delivered to your users and stakeholders. If something excites your customers it should excite your manager.

## We'll do it later
Finally, I was asked what was so bad about letting defects pile up if you resolve to fixing them a later time.

If you can guarantee that you'll get this time then this might be an option. In the teams I've worked in, I've found that I can't ever guarantee anything like this happening. Defects also have a habit of evolving or calcifying over time. You might find it easier just to address it as soon as you find it.

If you find yourself with "spare" time on a project, there's nothing wrong with fixing some of your "won't fix" issues. Just don't commit to doing it, because it's likely you won't get chance.

## The road to zero defects
Recently, I've taken the lead for a new team and we're aiming to develop projects using a "Zero Defects" methodology.

This is not a new concept to the team, they already ensure that there are no known defects for a story before pushing to production. What we need to address is how we deal with issues found after we've deployed a feature to production.

Over the coming months, I'll be blogging about the experiments we run to try and achieve this. I'll write about the things that work for us, and also the things that don't.

So, you don't need to drop you bug tracker. You might find yourself using it less though.
