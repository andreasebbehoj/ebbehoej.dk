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
categories:
  - "stata"
image:
  filename: featured
  focal_point: Smart
  preview_only: false
---
Whatever the question, "Google" is usually the answer. But there a lot of great guides and ressources that might give you an answer a lot faster than simply wandering aimlessly around the internet. In this post, I'll share my favourite go-to sources for whenever Stata sends you a curve ball.

{{% toc %}}

### Stata cheat sheets ([link](https://www.stata.com/bookstore/stata-cheat-sheets/))

The best overview of (almost) all commands you are ever going to need. Commands are neetly sorted in the different steps most analyses consists of:

1. Data processing: Importing data, exploring data for weird outliers, removing duplicates, making new variables etc. There are commands for importing from Excel, text files etc.
2. Data transformation: Removing variables, labeling data, correcting errors, summarizing variables and generating new ones. And of course how to merge (combine) two datasets. Oh merging...
3. Data visualization & Plotting in Stata: Scatter plots (ie. XY-plots), histograms, bar charts, boxplots, how to combine graphs, and the list goes on.
4. Data analysis: Ttests, linear regressions, non-parametric tests, time to event analyses, and much much more. This is what it all comes down to, in your endless hunt for that elusive p-value <.05
5. Programming: Tired of copy/pasting results from tables in Stata to our paper? Annoyed with the +50 lines of of almost identical histograms in your do file? Ready to dip your feet in some Stata programming? Then this is the place to get the first inkling of the endless possibilities that "loops", "globals/locals" and "tempfiles" provide. Be warned, this particular rabbit holes is deep and can be time-consuming.

### YouTube guides

There are **a lot** of YouTube videos on how to learn Stata. I personally prefer StataCorp's own YouTube channel with Chuck Huber because 1) they have tons of tutorials covering both both simple and complicated tasks, 2) videos are conveniently categorized in playlists, and 3) most importantly, because Chuck's videos are short!

You can find all playlists [here](https://www.youtube.com/user/statacorp/playlists). Some good one to start with:

1) [Back-to-School link](https://www.youtube.com/playlist?list=PLN5IskQdgXWnnIVeA_Y0OBGmnw21fvcmU)) - quick introduction to the most common tasks like importing data, making simple graphs, doing t-tests, etc.

2) [Data Management](https://www.youtube.com/playlist?list=PLN5IskQdgXWmih67kPngkd0P022h1j82j)) - How to work with dates, convert text to numbers, reshaping data from wide to long format etc. Data management is by far the most time-consuming thing to learn in Stata, so it is a good place to invest some time.

3) More specific guides on [logistic regression](https://www.youtube.com/playlist?list=PLN5IskQdgXWmD5uP_XwBlu0F_ADPo7KNn), [survival analysis](https://www.youtube.com/playlist?list=PLN5IskQdgXWncs-_vy0KVNRn9xboYA6db), [power calculations](https://www.youtube.com/playlist?list=PLN5IskQdgXWmExGRjdy0s0VCdYnzGMZrT), [multiple imputations](https://www.youtube.com/playlist?list=PLN5IskQdgXWmhjxC5eopeRJwpI9G7Kp5w), and many others.

There are a lot of other good videos on YouTube. Some use informative graphics to improve learning. Some cover more complex stuff. But there also very long videos that spend 20 min on every excrusiating detail of how to import excel files. Not Chuck Huber, that guy is a surgeon.

### Books
If you want to go oldschool and read a book (or e-book), I'd recommend:
* Take Good Care of Your Data, by Svend Juul ([link](https://www.epidata.dk/php/downloadc.php?file=takecare.pdf))
* An Introduction to Stata for Health Researchers, by Svend Juul ([link](https://www.stata.com/bookstore/introduction-stata-health-researchers/))**

The first is a short (and free!) little pamphlet. It a quick introduction on how to organize your data and work in Stata. Would especially recommend the sections on how to work with do-files. The sections on how to collect data in Epidata are also interesting but I would any day recommend using RedCAP for data collection.

The second book is THE in-depth Stata bible. There is a reason why Svend Juul is considered something of a Stata legend. This book is a big part of it. The book covers _everything_ from importing data to advanced coding and analysis. Costs around 60$ and is most likely only for the truely dedicated/nerdy.

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

This will open the Stata help file that explains how to use the command and provides some examples. If that still doesn't do it, then it is time to ask google or perhaps a nerdy friend.

### Statalist - the Stata forum ([link](https://www.statalist.org/))

Whenever I google "stata how to something-something", Statalist is usually the first hit I get. The layout is pretty old-fashioned but this is truly a goldmine of Stata poesi.

A word of warning before you ask a question at Statalist: [Read the guide ](https://www.statalist.org/forums/help#gfaq_postingadvice)first! Stata-aficionados from around the globe are willing to help you but they will bite, if you don't follow protocol. It is called Stata, not STATA. Use your real name. And woe you, if you ask a question without also submitting your code.

Read. The. Guide. First.

### Conclusion

I hope some of these ressources are useful to you. Remember, that whatever the question, Google probably knows the answer.
