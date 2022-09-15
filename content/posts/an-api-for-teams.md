+++
author = "Steve Bennett"
date = 2016-08-04T15:45:54Z
description = ""
draft = false
image = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxMTc3M3wwfDF8c2VhcmNofDV8fHRlYW18ZW58MHx8fA&ixlib=rb-1.2.1&q=80&w=2000"
slug = "an-api-for-teams"
title = "An API for Teams"

+++


> “In computer programming, an Application Programming Interface (API) is a set of routine definitions, protocols, and tools for building software an applications A good API makes it easier to develop a program by providing all the building blocks, which are then put together by the programmer.”
> -- [Wikipedia](https://en.wikipedia.org/wiki/Application_programming_interface)

Anyone writing code will already be familiar with APIs. Whether it's the API exposed by the [standard library of your favourite programming language](https://docs.oracle.com/javase/8/docs/api/), or a [REST](https://en.wikipedia.org/wiki/Representational_state_transfer) API exposed by a third party service, it's a necessity to understand the concept for building more than a "Hello, World!" application.

The API abstraction provides the programmer with a protocol defining the methods of interaction, whilst at the same time hiding the details of the implementation. A well-defined, consistent, structured API is a joy to work with. An API with inconsistencies, or that exposes interfaces in a dramatically different shape to others, makes life as a programmer hard.

So, if we understand the value that a consistent API can bring to software, could we apply the same ideas of abstraction to the way we work as teams?

When the engineering group exists as a single entity, there's a single way of operating, and a single interface for anyone outside of the team. We can think of this interface is the Team API. It's the set of methods and protocols the team exposes.

As soon as the team starts to become a team of teams, this single interface needs to mature into a interface which is consistent between teams. It becomes necessary to ensure that an individual team, the wider business, and other engineering teams, can collaborate efficiently and effectively with each other.

## Defining the Team API
The Team API defines the way the team will operate with others. It provides the routine definitions, protocols and tools that are used to engage with the team. Much like a software API, a consistent Team API makes it easier to build products, deliver value and fix problems across the business.

At its basic level, the Team API should define:


- The communication protocols between members of the team and anyone external to the team

- The way the team accepts work items

- The way the team delivers work items

- The way the team shows progress on work items


When your engineering team consists of multiple teams, these points need to be consistent. It's less important that the implementation is consistent, just that the Team API is.

Just as with the implementation of a software API, teams should be free to change their implementation of the Team API to focus on methods that work for them.

With this in mind, a good Team API should also:


- Abstract away from how the team implement the API

- Hide the internals of the team implementation of the API

- Remain relatively stable


In one organisation, I encountered a situation where each team had different Team API. Some teams made themselves available over Skype, whilst others used Slack. Some teams required stakeholders to raise tickets in Trello, others used Jira, whilst the rest relied on a conversation with the product owner. The differences created unnecessary confusion and cognitive load, and reduced accountability for deliverables. The engineering team couldn’t articulate their priorities, and they were unable to manage their dependencies.

Conversely, another team I worked with defined the communication protocol of their Team API as Slack. All teams had a channel, and it was easy to find and ask questions of a team in through a single medium. There was a single defined interface, and a shared understanding of how to communicate between teams. Teams were engaged with customers, stakeholders, and other engineering teams (I actually think that some of this was because Slack is such a good product, but the single communication protocol more than played its part).

## Innovation in teams
Whilst the Team API should be consistent, the underlying implementation can change. If the Team API defines that incoming requests are made through Jira tickets, then it shouldn't mean that the team must use Jira for their day-to-day work. If Trello works better for the team, then they should use that. In doing so, they will incur a cost of managing two systems, yet the overall net benefit might be worth it.

So, although the Team API should be stable, individual teams should continue to innovate the way they work. Teams should continue to inspect and adapt the way they operate, always looking for areas to improve. The abstraction that the Team API provides enables teams to evolve the way they work, trying out new things without impacting the wider engineering team delivery.

## API V2
No system lasts forever, and eventually there becomes a time when an API needs to be deprecated, and be replaced with something new. With this in mind, it's just as important that the Team API has a defined method for innovating and communicating changes to its consumers. Any changes that are made need to implemented swiftly and comprehensively. The efficiencies produced by establishing a consistent Team API cannot be realised by running multiple versions simultaneously.

## Snowflake teams
Whilst engineers appreciate the value of consistent software API, there's a challenge in providing a consistent interface to the way they work. Teams often hold the opinion that they are special snowflakes, and that by conforming to a standard interface, they'll be constrained in how they operate.

In most cases, this isn't true. Developing a consistent Team API provides everyone with a common language, and shared understanding of how to collaborate between teams. A common interface fosters collaboration, as you no longer need to put effort into understanding the way another team operates, or rely on knowing someone in the team to resolve the issue you have. It also helps your team. There's a well-defined interface for requests coming into your team and for you to communicate out, helping to remove the distractions that can occur when channels are not well defined.

At this point, I think it's worth adding a warning. Rigidly adhering to your Team API, can harm collaboration. At one company, I encountered teams who refused to speak to each other without the necessary tickets being raised first. Even if the conversation was to find out whether the ticket was being raised with the right team. It's clear then that although the Team API needs to be consistent, it also needs to be flexible. To this end, we should recognise that there are different types of requests, and that they probably need different channels of communication. This can also be encoded in your Team API.

## In closing
A good API defines methods and protocols whilst hiding implementation. Good API are also consistent with others across a similar domain. We can use both these ideas to improve the way the wider business operates with engineering, and how engineering teams work with each other. Software engineers appreciate the consistencies and abstractions provided by API, so maybe it's time to start building Team API with these ideas in mind.



