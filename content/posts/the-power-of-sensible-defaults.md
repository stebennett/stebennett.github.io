+++
author = "Steve Bennett"
date = 2017-07-24T19:41:44Z
description = ""
draft = false
slug = "the-power-of-sensible-defaults"
title = "The Power of Sensible Defaults"
+++

Choosing the “best tool for the job” is a mantra that many software engineers repeat when asked to explain their choice of tool, language or framework. In some cases, this choice is right, however far too many times in my career I’ve seen “best tool for the job” loosely translate to whatever was top of Hacker News this week.

The unintended consequence of always choosing the “best tool for the job” is a software inventory which spans multiple languages, frameworks, build systems and deployment tooling. The fractured ecosystem of development occurs as each developer or team makes their decision in isolation, only considering their immediate consequence. The silos and diverse technology stack reduces the opportunity for reuse, leading to teams reinventing boiler plate code for testing, monitoring, instrumentation, and perhaps even business logic.

In this environment products become harder to evolve, developers struggle to move between teams and the bus factor quickly tends towards one. Running systems become harder to maintain as the idiosyncrasies of each language run-time needs to be understood, leading to more specialists needing to be on-call. Containerisation and [12-factor apps](https://12factor.net/) (itself a kind of Sensible Default) have helped, but as anyone who has been on-call will tell you having a good understanding of the apps running is invaluable when the worst happens.

A recent medium post by Ozan Onay, [”You are not Google](https://blog.bradfieldcs.com/you-are-not-google-84912cf44afb)”, shows another side to the “best tool” argument, rightly pointing out that you probably don’t need that cool new tech you’re proposing. Often a technology which is “good enough” really is good enough for your domain. There’s no need to go further.

I believe that teams can overcome these issues by employing Sensible Defaults. A Sensible Default is a practice, language, framework or tool adopted as the default choice for an engineering team. It’s the commonly agreed approach to building products, and the first thing to consider when starting a new project, or when there’s a new problem to solve.

As an example, you may decide to use React for your Sensible Default for front-end development, Flask and Python for building web services, and PostgreSQL as your database technology.

Notice, I’m not saying it’s the only choice, it’s just your default. Engineers are still empowered to choose other technology where necessary, but alternatives need to be justified in relation to their advantages over the Sensible Default.

I’m not the only one that sees the advantage in having defaults. In 2014, Ben Vinegar wrote a medium post about how “[The best tool for the job, isn’t always](https://medium.com/@bentlegen/the-best-tool-for-the-job-isnt-always-6ed364f3f775)” where he describes the reasons for standardization whilst he was at Disqus.

So, whilst it may feel restrictive, and at odds with everything you’ve read about [motivation and autonomy](http://amzn.eu/9TjWCZG), I believe that more teams should embrace the power of Sensible Defaults.

## Documenting your Sensible Defaults
The choice for the Sensible Default is one that should be carefully considered, both in relation to the technical problems it will need to solve and the skills in the organisation. A Sensible Default choice has wider ranging impacts that just the local team, so the candidates for the default need to be assessed against different scenarios aside and with the wider team. I’m not going to go into the process of making technology choices, as this topic probably deserves it’s own blog post, but I do want to comment on how decisions should be documented.

In agile environments, decisions around architecture and technology have a habit of being lost especially as teams move to more [evolutionary ideas of architecture development](https://www.thoughtworks.com/radar/techniques/evolutionary-architecture). The motivations and context behind decisions become difficult to track, and it becomes difficult for team members, both new and existing, to keep track of them as projects develop.

Therefore, once debated, discussed and dissected, technology choices that become the Sensible Default should be documented for future reference, using something like [Architecture Decision Records](http://thinkrelevance.com/blog/2011/11/15/documenting-architecture-decisions) (ADRs).

By keeping a versioned record of Sensible Defaults the team not only have a repository when new developers can learn about the development environment, they also have a set of records which provide details of the decisions for later review as the context changes.

It’s likely that you already have a number of Sensible Defaults in your organisation. For example, you may have settled on Java for building web services, and you may find that most of your web services have been developed using [Spring Boot](https://projects.spring.io/spring-boot/). If this is a case, run a fit-for-purpose assessment on the technology in use and document your new Sensible Defaults.

## Deviations from the default
Whilst the Sensible Default should be the first choice, it’s not intended to be the only choice. Engineers can deviate from the default, providing it’s a considered decision.

When describing this concept to people, I often use the analogy of a fairground ride height restrictions. Good architecture decisions are based on clear system requirements, both functional and non-functional. A Sensible Default decision builds on these requirements by adding a set of people based requirements such as cross-skilling and training. This list of requirements is the bar a new technology must get over in order to be considered for use.

There’s always a cost to introducing a new technology, and anyone wishing to do so must provide details on how they plan to educate the rest of the engineering team. They can defer this cost, by limiting the scope of the training to those directly working with the new tech, yet in doing so, they carry the risk and burden of supporting the project until the technology is more widely known.

This may seem a little unfair on the team that wants to experiment, however it helps to increase the bus-factor within the wider team, and helps to reduce the chances of a single point of failure developing who is more prone to burn-out.

Deviations from the Sensible Default should also be stored in ADRs, with the relevant context and discussion that lead to the deviation. Storing decisions in this manner help teams avoid repeating conversations and re-debating choices when new team members join, or teams change. They also provide useful information for future maintainers of a project.

The number of deviations should be kept to a minimum. Should the number of deviations continually grow, it’s probably time to consider whether the Sensible Default is the right one.

## Encouraging experimentation
Many times when I explain the concept of Sensible Defaults, I’m challenged by engineers who believe that by setting defaults I’m reducing the scope of innovation and experimentation. It’s a fair challenge, and I believe that it’s important that new technology is evaluated and considered for use, lest a team end up with difficult to maintain legacy software that is hard to recruit new team members for.

To ensure a team doesn’t end up in this situation, I encourage the use of innovation or free development time. During this time, engineers are free to use whatever technology they like to build non-mission critical applications. This is the space to experiment with the new deployment technology, or JavaScript framework which Hacker News is blowing up with this week.

By using new technology to build real-world applications, automation and tools that help improve engineering efficiency, engineers make it past the “getting started” tutorials and start to understand how the technology works in a production-like environment. Achieving this level of experience with a technology means that the debate over it’s uses can reference existing applications, rather than just replaying the top comments and opinions from the blogosphere.

## From chaos to cohesion
Whilst engineers are comfortable adhering to standards (see arguments over the correct use of HTTP methods and status codes in RESTful web services as an example), when it comes to choosing technology, the drive to use the newest technology coupled with the move to service based architectures often leads to a somewhat chaotic and overly complex development environment.

I hope that I’ve shown here that by employing critical technology review and documenting the results as Sensible Defaults, engineering organisations improve their operational efficiency and resilience. [The needs of the many outweigh the needs of the few](https://www.youtube.com/watch?v=Xa6c3OTr6yA).

However, Sensible Defaults are just that - defaults. They’re the first choice, not the only choice, and deviations are still possible, providing we make these choices consciously.

We can use innovation time and non-mission critical development for experimentation, helping to ensure that the development team has the opportunity to learn about new technology in a production-like environment.

Finally, I’d like to close with a quote I found whilst researching this blog post. Whilst the post it comes from doesn’t talk about software, I feel it sums up the need for Sensible Defaults well.

> Sensible defaults can reduce friction and provide simplicity anywhere one can think to apply them. They are the bedrock of minimalist practice and a quiet mind.
> &emdash;&emdash; [@patrickhone](https://twitter.com/patrickrhone) - [Sensible Defaults](http://patrickrhone.com/2010/11/08/sensible-defaults/)
