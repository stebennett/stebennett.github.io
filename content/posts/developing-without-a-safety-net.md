+++
author = "Steve Bennett"
date = 2015-12-16T13:38:21Z
description = ""
draft = false
slug = "developing-without-a-safety-net"
title = "Developing without a Safety Net"
+++

Recently, an article about the [changes to the development process at Yahoo](http://spectrum.ieee.org/view-from-the-valley/computing/software/yahoos-engineers-move-to-coding-without-a-net) caught my eye. In a move to improve quality, speed and efficiency, Yahoo removed the "QA Team" from their development process. According to the article, the change resulted in an increased focus on automation. Checks previously completed by "error-prone" humans were now done by code. If the checks passed, the code went live.

The article goes on to report that this "paradigm shift" caused the number of errors to go down.

The thing is, I wonder whether removing QA really had this affect?

I'm not doubting that the number of reported errors went down. After all, if an engineer can think of the error case, they can probably create an automated check for it. And if no-one else is looking for other problems, then it's unlikely that you'll find them.

The problem is, the number of errors is a [vanity metric](http://fourhourworkweek.com/2009/05/19/vanity-metrics-vs-actionable-metrics/). As with all vanity metrics, they can be easily manipulated, and take your focus away from what really matters. In the case of errors, we can reduce the number by not examining our software as hard. Maybe this is what was in play at Yahoo?

There's an often overlooked group of testers that Yahoo didn't fire as part of it's "Warp Drive" initiative. All successful has this group of testers - the users. By changing their process, users were exposed to new features and changes in software immediately. As an outsider, it's hard to assess whether the users experienced more issues following Yahoo's move to automated checking.

In my experience automated checks can only go so far. You can only check for the cases you know and for everything else, you need to test. [Testing is more than ensuring that an automated check passes](http://www.satisfice.com/blog/archives/856).

To test, you need to evaluate the product by learning about the way it works. How does it respond to changes in input? What happens if we ask different questions of the product to those outlined in the requirements? How does it fail? Is the new feature consistent with the overall product experience?

Whilst some of this class of questionning will be considered by good engineers at implementation, I've found that it's unlikely that it will be done with any significant depth. The amount of exploration, modelling and experimentation carried out typically won't produce significant learning about the application.

This leaves the application entering into production with more "[unknown unknowns](https://en.wikipedia.org/wiki/There_are_known_knowns)", probably the worst scenario for any application. We don't know the things that are going to cause us issues until it's too late. There's greater risk that real users will find a significant issue.

That's why I like to ensure that the teams I work with also include testers. I don't just want Software Engineers in Test who focus on automating checks either - this is something which could and should be done by developers. I want testers who are inquisitive, questioning, and relentless in their persuit of learning about our application. Testers with these qualities invariably contribute more to the team, and perhaps more importantly, to the success of the product than any automated checks do.

I'm not advocating the use of gated processes and QA sign-offs. I don't like throwing software over the wall, and I don't like QA as gatekeepers to production. I think Yahoo has moved in the right direction and it's great if it's working for them.

Personally, I wouldn't advocate removing all testers from your process, as it risks throwing the [baby out with the bath water](https://en.wikipedia.org/wiki/Don%27t_throw_the_baby_out_with_the_bathwater).
