+++
author = "Steve Bennett"
date = 2020-01-30T15:42:23Z
description = ""
draft = false
slug = "comparing-the-performance-of-agile-teams"
title = "Comparing the performance of agile teams"
+++

Recently I got into a conversation about measuring the performance of Engineering teams. The teams in question are following the Scrum framework and have decided to use story points for estimating the complexity of the work.

In the conversation, we were talking about the validity of measuring individual team performance and whether one should use this data to compare the performance across teams.

Now, for anyone that's even taken more than a passing glance of any of the literature surrounding agile development, Scrum or estimation, the idea of measuring team performance and comparing performance between teams is a clear anti-pattern. Specifically, we're told, "don't compare velocity between teams".

And I broadly agree. In most cases when this topic is raised, the drivers for comparing team performance are dangerous - to discover which teams are delivering as expected and which aren't, which teams are good and which aren't, and inevitably, to performance manage those teams and individuals in bad teams.

However, as with all arguments, there's nuance, and I think there are some excellent reasons why understanding the performance of teams and comparing between them can be useful.

My approach to managing teams of teams has evolved over the past couple of years to consider more greatly the way the system as a whole is operating. I've been inspired to change by reading and development in the areas of system thinking. The rest of this post will pull on some ideas from system thinking. 

If you've not come across the concept, then what follows might not resonate with you. Good background reading on the topic is [Think in Systems](https://www.amazon.co.uk/Thinking-Systems-Donella-H-Meadows-ebook/dp/B005VSRFEA/), or for a quicker read, there's the [Introduction to Systems Thinking](https://thesystemsthinker.com/introduction-to-systems-thinking/). 

No matter how hard we work to eliminate cross-team dependencies, a group of engineering teams working towards a common goal operate in the same system of delivery. Therefore, it can be said that the performance of this broader system (the Engineering team) will be directly related to the performance of its constituent parts (a Scrum team, for example).

Furthermore, systems theory tells us that the performance of a system will be directly correlated with the performance of that system's bottleneck. To improve overall system performance, we need to focus our attention on the bottleneck. Improvements elsewhere in the system are likely only to have negligible effects on the overall performance of the system and in the worst cases, some local enhancements will make the system performance worse.

With these thoughts in mind, our attention needs to be drawn to discovering the bottlenecks in our system and applying maximum leverage to these areas.

Although the system is more than the composite of the individual teams, the teams should be one place we look for our bottleneck. Measuring and comparing the performance of teams helps us understand if one of them is a bottleneck in the system of delivery.

Additionally, we can also learn whether there's a local (team) issue that needs addressing, or whether there's a systemic issue affecting more than one team needing our attention.

Let's look at some examples to demonstrate these points. In these examples, I'm going to use throughput as a measure of performance. Throughput is the count of the number of tickets a Scrum team completes in a week. Increasing throughput is one of the goals of improving this system.

Below is an example chart plotting throughput for a team over 10 weeks. In this chart, we can see that this team has a steadily increasing throughput over this time.

![throughput](__GHOST_URL__/content/images/2021/02/throughput.png)

Now we add a second team to this chart.

![throughput-2](__GHOST_URL__/content/images/2021/02/throughput-2.png)

What conclusions can we draw from this? We could say that the blue team is better than the orange team because their throughput is higher. Yet, is this really true? Perhaps the orange team isn't splitting their tickets down as aggressively as the blue team?

We also see that both teams are improving - so using these two teams as a sample set for the overall system, we may be able to say that the performance of the system as a whole is improving.

So far, comparing teams hasn't really shown us anything more useful than not doing so.

Let's add a third team. In this example, the green team has a higher throughput than both the blue and orange teams. We can also see that unlike blue and orange, the green team throughput is decreasing. As two of the three teams are continuing to improve, we might conclude that we have a local issue with the green team that we should look into.

![throughput-3](__GHOST_URL__/content/images/2021/02/throughput-3.png)

To be more responsible with our charting, we can remove the axis and normalise the throughput counts. Doing this helps us to draw attention to critical differences and focus on the right conversations (it's also why I used dotted lines for the actual throughput lines). If we look at the revised chart, it's clear that we need to spend time with one team seeking improvements.

![throughput-4](__GHOST_URL__/content/images/2021/02/throughput-4.png)

Looking at one more example, we see that every team in this system has decreasing throughput. Seeing this, rather than starting to work with individual teams to improve their throughput, we should focus our energies on developing a better understanding of the system they are operating in.

![throughput-5](__GHOST_URL__/content/images/2021/02/throughput-5.png)

In this example, efforts to improve a single team's performance is likely to have limited impact on overall performance. Had we not compared teams, we would not have seen this, and each one would likely have focused on locally optimising their own throughput.

In conclusion, making comparisons between teams isn't inherently wrong. It can be done in a way which develops insight about the broader system and better understanding within teams about the issues that can and can't be solved locally.

I have to pass a tremendous amount of credit onto [Troy Magennis](https://twitter.com/t_magennis) of [Focused Objective](https://www.focusedobjective.com/w/) for inspiring my thinking on this article. In 2019 he visited the company I worked at to teach us about statistics, estimation, forecasting and reporting. His work inspired my further discovery into this area and my thoughts on team comparisons are built upon the insights and ideas he shared with us.
