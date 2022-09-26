+++
author = "Steve Bennett"
date = 2014-11-12T15:07:37Z
description = ""
draft = true
slug = "oredev-2014-day-two"
title = "Øredev 2014 - Day Two"
+++

This is the second in a three part series giving an overview of the sessions I attended at Øredev 2014. Part one of the series can be found [here]({{< ref "/posts/oredev-2014-day-one.md" >}}).

## [Opening Keynote: Getting comfortable, being uncomfortable](http://vimeo.com/111086686) - [Keavy McMinn](https://www.twitter.com/keavy) - Github

Day 2 started with a Keynote for Keavy McMinn, a self-described maker from Github. Keavy has a passion for fine art and used the keynote to walk the audience through some of the pieces she has created for recent exhibitions. She used this exploration to help explain the importance to her of finding a way to keep making, and the importance of this in her role at Github.

Keavy also described the process for developing software at Github, and the way which written communication in particular is used. Being a mostly remote team, being able to express your ideas clearly and concisely in writing is key to the way Github works.

## [Session 1: Beyond responsive design - UI for the modern web application](http://vimeo.com/111214647) - [Peter Smith](https://www.twitter.com/roysvork) - One and Three Consulting

In this session, Peter demonstrated some of the key components which he feels contribute to the development of a successful multi-screen web application. I think he’s right to point out that a good web app needs to be more than responsive if it’s going to compete with native mobile applications. Responsive techniques will make sure that your site renders correctly, but it might not be enough to improve the usability of the site.

To do this, Peter re-imagined the conference website as a mobile web application, borrowing navigational techniques such as the hamburger, property sheets and tabbed content to build a more compelling application.

Although the final site was very flashy, I’d question how gracefully something like this would degrade, in particular in areas with poor network connectivity.

## [Session 2: Build a better bootstrap](http://vimeo.com/111288391) - [Tim G. Thomas](http://www.twitter.com/timgthomas) - Frog

Tim used this session to outline some of his opinions with CSS frameworks, using bootstrap as an example. He paid a lot of attention to layout issues which are solved for the most part using grids in bootstrap and showed how you could achieve the same thing without the use of a framework.

He then explained some concepts around behaviours in bootstrap and how you could achieve a similar thing using other frameworks.

I’m not really sure if Tim managed to show a “better bootstrap” but did show that for production applications you should be looking to roll your own framework using specific technologies for specific tasks, rather than taking something out of the box.

One of the key takeaways for me (and repeated in another session) was the need to create a site documenting your framework, and more importantly build it using your framework.

## [Session 3: Automation abstractions - Page objects and beyond](http://vimeo.com/111214646) - [Alan Richardson](http://twitter.com/eviltester) - Compendium Developments

Alan Richardson is a software tester and used this session to demonstrate how different types of abstractions can lead to better structured test code. He focussed predominantly on the development of WebDriver based tests, but went further than describing the use of Page Objects as an abstraction layer.

Alan described how he used abstractions based on the domain, users or other higher level concepts to structure his tests, using the SOLID principles to influence the design of the tests he writes. One clear recommendation from Alan is to create different abstractions for structural (page objects) and functional objects (interactions). Using this model, it’s likely that you’ll be able to reuse your structural abstractions in your functional ones.

What was good about this session is that it was obviously based on a lot of experience writing tests for different teams. Alan was able to show what he’s found to work, and therefore what might work for other teams.

## [Session 4: ORMs - You're doing it wrong](http://vimeo.com/111288389) - [Jimmy Bogard](http://twitter.com/jbogard) - Headspring

For me, this was an interesting session looking at what’s bad with ORM’s and what we should or shouldn’t be using them for. Even though the examples were shown using .Net the patterns, or more accurately antipatterns presented are applicable irrespective of the implementation.

The main antipatterns highlighted were either in the area of mapping or querying. In reference to querying, problems usually occur in the use of objects generated from database tables, mappings and navigations and the use of joins. In reference to querying, ORM implementations typically have issues due to lazy-loading and do this through a DSL. In most cases this DSL is just different enough from SQL to be confusing.

## [Session 5: Teaching our CSS to play nice](http://vimeo.com/111290459) - [Jen Myers](http://twitter.com/antiheroine)

In this session Jen shared her experience of working on teams to show us how to write, document and build CSS. I see too frequently that CSS isn’t written with the same care and attention as other code that’s written and that eventually leads to maintenance issues.

Jen broke down her talk into 3 areas. First, she focussed on some key questions to ask at the start of a project. What’s the scope? Should we use a framework? Should we use a pre-processor? How should we organise the CSS?

Once you’ve covered off these points, you can move onto the micro-choices which make up the style-guide. How do you order properties? Do we use shorthand? There were also a number of recommendations around structuring CSS.

And finally, the importance of documenting the style guide and choices is important, and once again a suggested way of doing this is to create a living style guide.

## [Closing keynote: About passion and collaboration](http://vimeo.com/111204421) - [Nile Rodgers](http://twitter.com/nilerodgers) - CHIC

A different kind of keynote. In two hours, Nile answered questions about his career, passions and the collaborations he has had over the last 40 years or so in the music industry. His stories were great, and his passion for making music was clear. He did, however, like to drop in a name and the stage was littered with the names of pop stars from the last 40 years.

Nile talked about how CHIC’s biggest record came about, a story showing that by not getting the thing you wanted, you might actually end up with something better.



