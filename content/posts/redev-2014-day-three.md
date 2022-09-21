+++
author = "Steve Bennett"
date = 2014-11-25T14:14:11Z
description = ""
draft = true
slug = "redev-2014-day-three"
title = "Øredev 2014 - Day Three"
+++

I've finally got round to adding my notes from the final day of Øredev 2014. It's taken a little longer than I anticipated due to travel and work commitments. You can find the rest of my notes in [part one](__GHOST_URL__/2014/11/7/oredev-2014-day-one) and [part two](__GHOST_URL__/2014/11/12/redev-2014-day-two).

## [Opening Keynote: The most human human](http://vimeo.com/111194377) - [Brian Christian](http://brian-christian.com/)

Brian opened the final day of Øredev with a talk focussed on the Turing test and the different approaches that have been taken over the years in an attempt to beat the test. From the early efforts of using NLP to create a fake physiatrist to more recent efforts such as [Cleverbot](http://www.cleverbot.com/), computer scientists have tried to create an AI that mimics a human to hold a conversation. We’re getting closer each year, but it’s clear that there’s still a way to go.

The [Loebner prize](http://www.loebner.net/Prizef/loebner-prize.html) is the annual competition in which teams compete to build the “most human computer” - an AI that can hold a conversation and is determined to be the most human-like. Brian was one of the agents (competing against the AI to fool the judges) and won the “most human human” award in 2009. In the talk, he describes the competition and the traps which computers fall into when trying to imitate humans.

The talk was interesting and underlines that whilst we’re making progress in lots of areas, we’re a long way off OS1 and the artificial intelligence critiqued on day 1.

## [Session 1: Integrating skilled testing with agile development](http://vimeo.com/111621831) - [James Bach - Satisfice, Inc](https://twitter.com/jamesmarcusbach)

The agile testing quadrants were introduced in the book Agile Testing, and has since been used to describe a model for integrating testers into an agile team. James used his talk to focus on the short comings of the testing quadrants, which he then followed with an explanation of a refactoring to create a new better model.

James’ talk was entertaining, energetic and informative. The changes to the model seemed sensible when he explained them, in particular the focus on testing with or without tools or those practices that support the team and critiquing the project. James argued well that in fact, all testing usually requires some sort of tooling and that it’s all done to support the team.

I would suggest that every developer and tester in an agile team watches this talk and reviews the associated documentation. It makes for interesting reading and should provoke a good discussion.

## [Session 2: Enabling Continuous Delivery with Database Practices](http://vimeo.com/111623115) - [Pramod Sadalage](http://www.twitter.com/pramodsadalage) - Thoughtworks

A validating talk from Pramod on managing databases in Continuous Delivery environments. Pramod showed how he has used DBDeploy to demonstrate how to rollout database changes, and spent a good deal of time talking through a number of patterns for applying refactoring to database tables.

It was great to see that someone else was advocating the management of databases in the same way that my current team does things.

## [Session 3: Project reactor](http://vimeo.com/111830750) - [Jon Brisban](http://www.twitter.com/j_brisbin) - Pivotal

Jon talked about how to use the [Reactor](https://github.com/reactor/reactor) library for building reactive applications on the JVM. I found this sessions interesting, as to date, I’ve not dedicated much time to reactive programming and I know I really should!

The demonstration focussed on the use of reactive streams to build an application for processing messages. It also featured the use of a web framework called [RatPack](http://www.ratpack.io/) which seemed interesting as well. Both something which I’ll be taking a look at in the near future.

## [Session 4: Micro-service lessons](http://vimeo.com/111627195) - [Fred George](http://www.twitter.com/fgeorge52) - Outpace Systems

Microservices are a hot topic in the industry at the moment, and because of this I’m having a lot of discussions about them. In this talk, Fred described the current landscape in the area of microservices and used a number of comparisons to highlight some of the lessons he’s learnt.

He evaluated the use of synchronous and asynchronous implementation models, the use of pseudo microservices implemented in clojure, how to manage datastores, and the choices of technologies.

It was enough to whet the appetite in the area of micro-services, and enough for me to want to continue the conversation back in my day job. Fred also mentioned a microservice conference in Berlin, [microXchang](http://microxchg.io/), taking place in 2015.

## [Session 5: The architecture of Stack Overflow](http://vimeo.com/111633696) - [Marco Cecconi](http://www.twitter.com/sklivvz) - Stack Exchange

Where would the average developer be without Stack Overflow and the Stack Exchange network? In the penultimate session that I attended, Marco described the architecture of the Stack Exchange network and some of the factors that influenced the design.

What struck me was the scale, more specifically the small scale. The whole Stack Exchange network is run from a surprisingly small number of web and database servers, 9 web tier and 4 database tier (although half are hot standby) serving 560 million requests per month.

Combined with this, the team are intensely focussed on speed. They aim to keep the homepage loads down to around 50ms, and revert releases when they break this contract.

To achieve this the developers have made some optimisations to the code as well as making some trade-offs which you might ordinarily consider bad practice. Some examples of this include rewriting the compiler and using a high number of static methods to assist the garbage collection. They also make heavy use of caches at all levels.

A good example of doing what’s right for your application and users rather than what’s best practice.



