---
title: Register-based research with Stata
subtitle: A series on how to use Stata for common data management problems registry-data
date: 2022-01-25T12:10:42.654Z
summary: Stata is excellent for register-based research, but the learning curve
  can be steep and it is easy to get lost when you are sitting on a mountain of
  data. This guide provides you with some climbing gear for the journey.
draft: true
featured: false
tags:
  - stata;registry-based;epidemiology
categories:
  - Stata
image:
  filename: featured
  focal_point: Smart
  preview_only: false
---
Stata has been my preferred tool for epidemiological research using health registry data for the last 5-6 years. It has some really efficient commands for combining data from different registries and reshaping them to fit your statistical needs. I have probably spent a third of my PhD writing different variations of *merge*, *reshape*, and *append*. Once you get the hang of it, Stata absolutely excels at data management.

But the devil is in the detail, and in this case, the devil is hiding in the word *once*. Because the learning curve can be steep with Stata. And you can quickly lose track of things when you are trying to combine the data on 100,000 patients from the "t_population" file with their 1,000,000 hospital contacts from "t_adm". And then you need to combine each hospital contact with 5-10 diagnosis codes from "t_diag" and perhaps even some surgical procedures from "t_opr". This is this the point where you wish you had instead become a 'real researcher', doing cool lab stuff with only 8 participants and managing your data in a old-fashioned notebook. 

Don't fret. You can solve 99% of your data problems with *reshape* and *merge*, and, hopefully, this will help get started on the