---
title: Stata ressources for beginners
subtitle: You've got Stata installed and are ready to analyze your data. But how
  do you import your data, correct errors and make a histogram? Here I'll share
  my favourite go-to sources.
date: 2020-04-27T12:53:33.840Z
summary: Hope these ressources are any use to you. Remember, that if you have a
  problem, then Google probably holds the answer.
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