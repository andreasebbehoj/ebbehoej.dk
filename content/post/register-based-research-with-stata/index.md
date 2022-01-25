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
authors:
  - admin
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

In my world of medicine and epidemiological research that would often mean:

1) identify a cohort of patients with some condition, [say rare adrenal tumors](https://www.dovepress.com/pheochromocytoma-in-denmark-during-1977-2016-validating-diagnosis-code-peer-reviewed-fulltext-article-CLEP), using a combination of registered diagnosis codes and surgical procedures,

2) assess risk of an outcome, such as [estimating risk of cardiovascular disease](https://pubmed.ncbi.nlm.nih.gov/29374097/) from hospital contacts or [unemployment rates](https://ssrn.com/abstract=4000566) in a public administrative registry of transfer payments, 

3) or both 1 and 2 in the same study.

You can read *a bit* more in EMA's [33-page guideline ](https://www.ema.europa.eu/en/guideline-registry-based-studies)for registry-based research, if you are so inclined. 

## Example data - The Danish National Patient Registry

We will need some registry-data to serve as an example during this post series and so you can get your hands dirty, playing around with some data yourselves. I am most familiar with the Danish health registries, so I've chosen to make a synthetic data based on the Danish National Patient Registry (aka. Landspatientregisteret, LPR, or DNPR). You can read about [DNPR in this scientific paper](https://doi.org/10.2147/CLEP.S91125). In brief, it is a nationwide registry containing administrative data on all somatic hospitalizations (since 1977) and all outpatient and psychistric contacts (since 1995). 

I've made a short description of DNPR and its various datasets below. You can read it now or wait. I'll refer to it in the coming posts, as, so you don't have to bore yourself with it now. Just know that the DNPR registry data is split into various datasets (t_adm, t_diag, t_opr, ...) and that *recnum* is the key variable used to identify a unique hospital contact across all datasets. 

### Download data

You can download the completely made-up dataset on Github (INSERT LINK). Or you can download the files directly into your current folder using your do-file editor and the code below (which is what I am going to do in all posts): 

```
*** Check if files are present

*** Download from github

```

Ones this is working, we are ready to get our hands dirty doing real data management on our fake registry data.  !!!INSERT LINK TO FIRST POST!!! 

Or you can read the detailed description of DNPR data before you move on. 

### t_adm

The table with the administrative stuff. Each row in t_adm corresponds to a hospital admission, outpatient visit, etc. t_adm include data such as date of admission, date of discharge, hospital name, department name, medical speciality, home municipality, and more. 

INSERT TABLE

t_adm includes two variables you really need to know about. The Central Person Registry (CPR) number and the *recnum.* 

* The CPR number is a unique personal ID that all Danish residents gets assigned at birth or when moving to Denmark. The CPR number does not change (like a social security number) and used across all Danish adminstrative and health registries. The CPR number is truly the One Variable of all Danish registries, which binds them together and rule them all. 
* The *recnum* is an abbreviation for 'record number' and is just that. A unique record number which identifies each hospital contact in DNPR, whether it be a hospitalization, a contact to the outpatient clinic, or a visit to the emergency room. The record number is found in all the DNPR datasets and is thus the key variable when we want to combine data across t_adm, t_diag, t_surg, etc. 

### t_diag

INSERT TABLE

The table with diagnosis codes. Each hospital contact in t_adm, each *recnum*, is registered under at least one diagnosis code (but up to 99)  in *c_diag*. All contacts have a primary code, while secondary, referral, and supplementary codes are optional. The type of diagnosis code is found in the aptly named c_diagtype. Supplementary codes specify something about the diagnosis, like "TUL1 Right-sided" to indicate the diagnosis code is about the right side. And yes, a diagnosis codes can have several supplementary codes.

And to complicate things a bit more, NDPR used the 8th edition of International Classification of Diseases (ICD-8) in 1977-1995 and changed to the 10th edition (ICD-10) in 1996. 

So all in all, each recnum in t_adm can be matched with *a lot* of diagnoses in t_diag. The risk of losing track of things is skyhigh here, but we'll get to that.

### t_opr / t_sksopr

INSERT TABLE

The table with surgery codes. t_opr is the name of the old registry (1977-1995) and t_sksopr is new one (1996-). The main difference is that t_opr and t_sksopr use different classification systems for surgery. But luckily the surgical tables are pretty similar to t_diag. You have primary surgery codes, secondary surgery codes, supplementary codes, and the works. 

### Other NPDR datasets

There are plenty of other datasets: t_foedsler with specific data on deliveries, t_sksube on various tests and examinations, t_pers on specific dates of outpatient visits, and much more. I'll describe registries, if I use them in my posts down the line. If you are very interested in them, then you are probably Danish, and can read more [here](https://www.esundhed.dk/Dokumentation?rid=5).