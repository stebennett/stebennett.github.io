+++
author = "Steve Bennett"
date = 2015-11-26T16:32:29Z
description = ""
draft = false
slug = "navigation-and-pair-programming"
title = "Navigation and Pair Programming"

+++

I’ve become a bit of a fan of pair programming over the years. I enjoy working through problems with another developer, as I find it usually leads to a deeper understanding of the problem, the domain and the improves the quality of the code that is produced. I also almost always learn something.

Pair programming is the name of a development practice where two developers work together to solve a problem in code, usually using a single computer, with shared input devices.

In all pairs, there’s a “navigator” and a “driver”. Like taking a journey in a car, the driver has the wheel (the keyboard) and is responsible for performing the actions to make progress (writing the code). The navigator ensures that the pair end up at the right destination, giving the driver direction and helping the pair to stay on track.

Effective pairing relies on strong navigation. Without it, the pair will likely get lost in their implementation and not make the progress they initially set out to achieve. A lot of attention is placed on helping people to improve their driving skills, however in my experience, learning to become an effective navigator can greatly improve a pairs productivity.

Let’s think about effective navigators on a car journey. They have a clear idea of the destination, the right information about how to get there and can clearly communicate the moves that need to be taken to reach it. Good navigators are also on the lookout for things that can improve the journey. It could be a detour, a comfort break, or just putting on the right driving music.

Effective pair programming navigation is very much the same. I’ve developed the following techniques, to ensure that I’m effective when navigating. To start, I make sure that I always have a notebook with me. I use a old-school dead-tree notebook, rather than a laptop to keep the distractions to a minimum. You can’t get a slack message on paper.

I’ll start each pairing session with a blank page, and at the top, write the goal for the session. This is our destination. Next, I’ll work with my driver to decide how we’ll know when we reach it. I’ll note down each of the features that identify the destination on a new line. These form our acceptance criteria for the session and help us to know when we’re done with the task. In turn, this will mean we don’t drive right past it.

Before we can decide how to get to the destination, we’ll need to know where we are. So, now we’ll spend some time assessing the codebase to get our bearings. I’ll use this information along with what we know about the destination to build a map indicating how we get there.

This “map” will consist of a number of small incremental tasks, or checkpoints, each of which take us closer to the destination. For example, the map might contain things like, “add a functional test” for the new feature, then “create the data model”, “implement the new service call”, and “transform the response”.

Finally, before starting to write any code, we’ll look at the map and make sure it makes sense. Do we have all the information we need to make each checkpoint? Do we have them in the right order?

Then we’ll set off, using our map to guide our session, marking off each checkpoint as we pass them.

More often than not, as we progress we’ll see opportunities to improve the code base further through refactoring. Rather than attempt the refactoring immediately, I’ll add them to the list as extra checkpoints on the road to our destination. That way, we’ll deliver working code first, enabling us to discover more about these extra checkpoints. Once we have something working, we can make the decision whether it’s worth visiting these extra places on this trip.

Incidentally, the tasks or checkpoints provide a good reminder to commit our code frequently. Providing we’re working in a methodical way, we shouldn’t really be breaking anything as we pass through each checkpoint. The checkpoints also provide good places for the pair to swap over, or just take a break.

We’ll continue the pairing session as long as there are tasks on my notepad which take us to the destination, and help us leave the code base in a better shape than when we started. You can think of this as wanting to make the journey easier for the next person who wants to make the trip.

Once we’ve hit all the checkpoints, we’ll conduct a final review of the session acceptance criteria to ensure we really have reach the destination we were aiming for. If we’re at the right place, then we’re done with the pairing session.

For me, the journey analogy works quite well, especially when we consider the “driver” and “navigator” roles. Treating the pairing session in this way helps to focus the pair on the destination, and keeps both from wandering off track and ending up somewhere they didn’t want to be (often with a long drive back to the original destination).
