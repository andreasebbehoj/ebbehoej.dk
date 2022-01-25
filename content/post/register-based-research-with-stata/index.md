---
title: Register-based research with Stata
subtitle: A series on how to handle common issues when working with
  registry-data in Stata
date: 2022-01-25T12:10:42.654Z
summary: Stata is excellent for register-based research, but the learning curve
  can be steep and it is easy to get lost when you are standing in front of a
  mountain of data. This series provides you with some climbing gear for the
  journey.
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
Stata has been my preferred tool for managing health registry data for epidemiological research over the last 5-6 years. It has some really efficient commands for combining data from different registries and reshaping them to fit your statistical needs. Once you get the hang of it, Stata absolutely excels at data management.

But the devil is in the detail, and in this case, the devil is hiding in the word *once*. Because the learning curve can be steep with Stata. And you can quickly lose track of things when you are trying to combine the data on 100,000 patients from the "t_population" file with their 1,000,000 hospital contacts from "t_adm". And then you need to combine each hospital contact with 5-10 diagnosis codes from "t_diag" and perhaps even some surgical procedures from "t_opr". This is this the point where you wish you were a 'real researcher'. You know, wearing a coat, doing cool stuff in the lab and, critically, being able to manage your dataset in a single spreadsheet. But I digress. 

Don't panic, just because your dataset is huge and messy. 99% of your data problems can be solved with *reshape* and *merge*, and -hopefully- this guide will cover the rest. 



# Before we begin ...

A bit of house-keeping before we get to the juicy stuff. What is registry-based research, how to download the data example we will be using, etc.

## Registry-based research

I suspect that if you (and three other people in the world, who found this guide), probably know what registry-based research is. But just so everybody is on the same page: Registry-based research is exactly what the name suggest: Investigation of some research question using data from a registry. 

In my world of medicine and epidemiology that would typical mean:

1) identify a cohort of patients with some condition, [say rare adrenal tumors](https://www.dovepress.com/pheochromocytoma-in-denmark-during-1977-2016-validating-diagnosis-code-peer-reviewed-fulltext-article-CLEP), using a combination of registered diagnosis codes and surgical procedures,

2) assess risk of an outcome, such as [estimating risk of cardiovascular disease](https://pubmed.ncbi.nlm.nih.gov/29374097/) from hospital contacts or [unemployment rates](https://ssrn.com/abstract=4000566) in a public administrative registry of transfer payments, 

3) or both 1 and 2 in the same study.

You can read *a bit* more in EMA's [33-page guideline ](https://www.ema.europa.eu/en/guideline-registry-based-studies)for registry-based research, if you are so inclined. 

## Example data