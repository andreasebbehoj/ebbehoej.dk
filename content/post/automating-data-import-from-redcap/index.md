---
title: Automating data import from Redcap
subtitle: "Redcap is fantastic for storing your valuable research data. But
  everytime you add or update results you need to download the newest data to
  rerun your analyses, which quickly gets tedious. Luckily there is faster and
  better way: use Redcap's API!"
date: 2020-05-23T19:42:50.925Z
summary: "Redcap is fantastic for storing your valuable research data. But
  everytime you add or update results you need to download the newest data to
  rerun your analyses, which quickly gets tedious. Luckily there is a better and
  faster way: use Redcap's API!"
draft: true
featured: false
authors:
  - admin
tags:
  - stata
  - data import
  - api
  - redcap
categories:
  - stata
image:
  filename: featured
  focal_point: Smart
  preview_only: false
---
### Introduction

Most (sane) researchers probably use Redcap to collect and store their valuable research data. The advances of using Redcap are plentiful: Reproducibility, automatic backups, data safety, GCP-compliant logging, etc. If you have not yet seen the light and still collect data in an Excel spreadsheet (yikes!), then you are missing out on a huge time saver. 

However, collecting data in Redcap has one minor disadvantage. Everytime you add a new record, correct an error or change anything in Redcap, you need to download the new version of your data to your computer before you can rerun your analysis with the new data.

##### What is API?