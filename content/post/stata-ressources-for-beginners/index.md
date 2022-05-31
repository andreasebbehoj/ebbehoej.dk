---
title: Stata ressources for beginners
subtitle: You've got Stata installed and are ready to analyze your data. But how
  do you get started with importing your data, removing outliers errors and make
  that sweet graph? In this post, I'll share my favourite go-to sources on.
date: 2020-04-27T12:53:33.840Z
summary: You've got Stata installed and are ready to analyze your data. But how
  do you get started with importing your data, removing outliers and make that
  sweet graph you want?
  In this post, I'll share my go-to resources for when Stata serves you lemons.
draft: false
featured: false
authors:
  - admin
tags:
  - stata
  - stata resources
categories:
  - stata
image:
  filename: featured
  focal_point: Smart
  preview_only: false
---
Learning to use Stata can get pretty frustrating. Luckily, there are really good guides to find on the internet. Taking the time to read a few or watch some tutorial videos can be a good investment in time. That is unless you really enjoy aimlessly searching around the internet to understand why "it just won't work".

In this post, I'll share my favourite go-to ressources for whenever Stata sends you a curve ball.

{{% toc %}}

### YouTube

There are **a lot** of YouTube tutorials on Stata and it is a good place to start when learning Stata. Personally, I prefer [StataCorp's own YouTube channel](https://www.youtube.com/user/statacorp/playlists) with Chuck Huber, because 1) they have tons of tutorials covering both both simple and complicated tasks, 2) videos are conveniently categorized in playlists, and 3) most importantly, because Chuck's videos are short!
There are a lot of other videos on YouTube that have better graphics or cover more complex stuff. But they can be hit'n miss and some of them spend ages explaining every excruciating detail of even the simplest functions. Not Chuck Huber, that guy is a surgeon.

Some good playlists to start with:

1) [Back-to-School link](https://www.youtube.com/playlist?list=PLN5IskQdgXWnnIVeA_Y0OBGmnw21fvcmU)) - Quick introduction to the most common tasks. Importing data, box-plots, t-tests, the works.

2) [Data Management](https://www.youtube.com/playlist?list=PLN5IskQdgXWmih67kPngkd0P022h1j82j)) - How to work with dates, convert text to numbers, reshaping data from wide to long format etc. Data management is by far the most time-consuming thing to learn in Stata, so I suggest you invest some time here.

3) There are also specific playlist on [logistic regression](https://www.youtube.com/playlist?list=PLN5IskQdgXWmD5uP_XwBlu0F_ADPo7KNn), [survival analysis](https://www.youtube.com/playlist?list=PLN5IskQdgXWncs-_vy0KVNRn9xboYA6db), [power calculations](https://www.youtube.com/playlist?list=PLN5IskQdgXWmExGRjdy0s0VCdYnzGMZrT), [multiple imputations](https://www.youtube.com/playlist?list=PLN5IskQdgXWmhjxC5eopeRJwpI9G7Kp5w), and many others.

### Books

If you want to go oldschool and read a book (or e-book), I'd recommend:
* Take Good Care of Your Data, by Svend Juul ([link](https://www.epidata.dk/php/downloadc.php?file=takecare.pdf))

A short (and free!) little pamphlet. It gives quick overview on how to organize your data and work in Stata. Would especially recommend the sections on do-files.

* An Introduction to Stata for Health Researchers, by Svend Juul ([link](https://www.stata.com/bookstore/introduction-stata-health-researchers/))
The second book is THE in-depth Stata bible for the truly dedicated. There is a reason why Svend Juul is considered something of a Stata legend and this book is a big part of it. It covers _everything_ from importing data to advanced programming and analyses. Costs around 60$.

### Stata cheat sheets

The [cheat sheets](https://www.stata.com/bookstore/stata-cheat-sheets/) likely provide the best overview of (almost) all commands you are ever going to need. Commands are neetly sorted after the different steps most analyses consists of:

1. Data processing: Importing data, exploring data for weird outliers, removing duplicates, making new variables etc. There are commands for importing from Excel, text files etc.

2. Data transformation: Removing variables, labeling data, correcting errors, summarizing variables and generating new ones. And of course how to merge (combine) two datasets. Oh merging...

3. Data visualization & Plotting in Stata: Scatter plots (ie. XY-plots), histograms, bar charts, boxplots, how to combine graphs, and the list goes on.

4. Data analysis: T-tests, linear regressions, non-parametric tests, time to event analyses, and much much more. This is what it all comes down to in your hunt for that ever-elusive p-value <.05.

5. Programming: This section is for when you get a bit more advanced and want to learn about the endless possibilities in "loops", "globals", locals" and "tempfiles". Stata programming can save you from writing the same code over and over or from manually copy/pasting  [hundreds of csv files into a a single data file]({{< ref "/post/stata-ressources-for-beginners/index.md" >}}). Be warned: this rabbit hole is deep and can get time-consuming.

### Stata's dialog box and help function

When I have problems with a specific Stata function, the first thing I usually do is typing

```
db [insert function name]
```

Db means dialog box and it basically opens a dialog box for the specific command so you can select the variables and options with the mouse instead of typing it as a command.

If `db` doesn't solve your problem, then you can type

```
help [insert function name]
```

This will open the Stata help file that explains how to use the command and provides some examples. If that still doesn't do it, then it is time to ask Google or a friend.

### Statalist - the Stata forum

Whenever I google "stata how to something-something", [Statalist](https://www.statalist.org/) is usually the first hit I get. The layout is pretty old-fashioned but this is truly a goldmine of Stata poesi.

A word of warning before you ask a question at Statalist: [Read their guide first](https://www.statalist.org/forums/help#gfaq_postingadvice)! Stata-aficionados from around the globe are willing to help you but they will bite, if you don't follow protocol. It is called Stata, not STATA. Use your real name. And woe you, if you ask a question without submitting your code.

Read. The. Guide. First.

### Conclusion

I hope some of these ressources are useful to you. Feel free to reach out if you have questions, comments, or suggestions for other good Stata ressources for beginners.
