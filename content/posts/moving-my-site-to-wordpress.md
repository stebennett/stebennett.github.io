+++
author = "Steve Bennett"
date = 2017-08-18T13:02:57Z
description = ""
draft = false
image = "https://images.unsplash.com/photo-1560472355-109703aa3edc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDR8fHdvcmRwcmVzc3xlbnwwfHx8fDE2NTM5MTMxMTQ&ixlib=rb-1.2.1&q=80&w=2000"
slug = "moving-my-site-to-wordpress"
title = "Moving my site to Wordpress"

+++


I've been a [SquareSpace](https://www.squarespace.com) customer for a couple of years now, having decided to restart my blogging efforts. I initially chose SquareSpace as I wanted a simple, hosted option so that I could concentrate on writing rather than configuring web servers.

I liked the ease with which I could get started with SquareSpace, and I was impressed with the templates and designs that I could choose from. I wasn't that impressed with the post editor, but it seemed better than most of the alternatives at the time.

Whilst SquareSpace had been a good way of getting started, I became increasingly frustrated by the editor and layout tools for writing blog posts. I also realised that I wanted more of a blog "feel" for the site, and in my opinion, the best blogging tool out there is WordPress.

I started the move earlier this week by exporting the content from SquareSpace and importing it all to a new hosted [WordPress.com](https://wordpress.com) site. After some tweaking of templates and design, I had something I was happy with, so I switched on the new [stevebennett.co](__GHOST_URL__/) domain. I still have [steve.codes](https://steve.codes), but feel the new domain is more appropriate.

I had a problem though. I had content and links referencing the old steve.codes blog, and needed to redirect this to my new site. There was no clear way to do this in the WordPress.com instance, so I needed to set up a tactical hack to do the redirect.

The "hack" involved setting up a new free-tier [Cloudflare](https://www.cloudflare.com/) account. [Cloudflare's free tier ](https://www.cloudflare.com/plans/)gives you limited DDOS and CDN capabilities, but the only thing I really needed was access to their "Page Rules", specifically the Redirect capability.

After pointing the steve.codes domain to the Cloudflare nameservers, I was able to set up two new Page Rules for redirecting existing content to the new WordPress site.

![Cloudflare configuration](__GHOST_URL__/content/images/2021/02/screen-shot-2017-08-18-at-13-29-29.png)

Two rules needed to be added, one to redirect the blog content, under `'/blog/'`, and another to cover all other content. Luckily, my blog on SquareSpace used the same slug format - `yyyy/mm/dd` - as used by WordPress.com, making the rules much simpler.

Once added, all existing links to steve.codes were successfully redirect to the new WordPress site, and the migration was complete.

Overall moving from SquareSpace to WordPress was incredibly simple, and I'm pleased with the new site.



