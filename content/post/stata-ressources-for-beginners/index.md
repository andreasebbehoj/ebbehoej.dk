---
title: Stata ressources for beginners
subtitle: You've got Stata installed and are ready to analyze your data. But how
  do you get started with importing your data, removing outliers errors and make
  that sweet graph? In this post, I'll share my favourite go-to sources on.
date: 2020-04-27T12:53:33.840Z
summary: Hope these ressources are useful. Remember, that if you have a problem,
  then Google probably holds the answer.
draft: false
featured: false
authors:
  - admin
categories:
  - stata
image:
  filename: featured
  focal_point: Smart
  preview_only: false
---
Whatever the question, "Google" is usually the answer. But here are some other great guides and ressources that I use a lot.

**Stata cheat sheets ([link](https://www.stata.com/bookstore/stata-cheat-sheets/))**

The best overview of (almost) all commands you are going to need. Commands are neetly sorted in the different steps most analyses consists of: 

1. Data processing: Importing data, exploring data for weird outliers, removing duplicates, making new variables etc. There are commands for importing from Excel, text files etc. 
2. Data transformation: Removing variables, labeling data, correcting errors, summarizing variables and generating new ones. And how to merge (combine) two data sets. Oh merging...
3. Data visualization & Plotting in Stata: Scatter plots (ie. XY-plots), histograms, bar charts, boxplots, how to combine graphs, and the list goes on.
4. Data analysis: Ttests, linear regressions, non-parametric tests, time to event analyses, and much much more. This is what it all comes down to, in your endless hunt for that elusive p-value <.05
5. Programming: Tired of copy/pasting results from tables in Stata to our paper? Annoyed with the +50 lines of of almost identical histograms in your do file? Ready to dip your feet in some Stata programming? Then this is the place to get the first inkling of the endless possibilities that "loops", "globals/locals" and "tempfiles" provide. Be warned, this particular rabbit holes is deep and can be time-consuming.

**Take Good Care of Your Data, by Svend Juul ([link](https://www.epidata.dk/php/downloadc.php?file=takecare.pdf))**

A short (and free!) little pamphlet from a local legend. It gives a quick introduction on how to organize your data and work in Stata. Would especially recommend the sections on how to work with do files. The sections on how to design questionnaires in Epidata are interesting but I would any day recommend using RedCAP for data collection if you have access to it.

**An Introduction to Stata for Health Researchers, by Svend Juul ([link](https://www.stata.com/bookstore/introduction-stata-health-researchers/))**

THE in-depth Stata bible by the man and the legend: Svend Juul. It covers all stages from importing data to advanced coding and analysis. Costs around 60$ and is most likely only for the truely dedicated. 

**Stata's dialog box and help function**

When I have problems with a specific Stata function, the first thing I usually do is typing "db *function-name*". Db means dialog box and it basically opens a dialog box for the specific command so you can select the variables and options with the mouse instead of typing it as a command. 

If *db* doesn't solve your problem, then you can type "help *function-name*". This will open the Stata help file that explains how to use the command and provides some examples. If that still doesn't do it, then it is time to google or ask a friend. 

**Statalist - the Stata forum ([link](https://www.statalist.org/))**

Whenever I google "stata how to something-something", Statalist is usually the first hit I get. The layout is pretty old-fashioned but this is truly a goldmine of Stata poesi. 

A word of warning before you ask a question at Statalist: [Read the guide ](https://www.statalist.org/forums/help#gfaq_postingadvice)first! Stata-aficionados from around the globe are willing to help you but they will bite, if you don't follow protocol. It is called Stata, not STATA. Use your real name. And woe you, if you do you submit your code when asking a question. 

Read. The. Guide. First.