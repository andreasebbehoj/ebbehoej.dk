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

However, collecting data in Redcap has one minor disadvantage. Everytime you add a new record, correct an error or change anything in Redcap, you need to download your data again to your computer before you can rerun your analysis with the new data. And since each file you export from Redcap has a new an unique name, then you also need to update the name in your Stata do-file. This my friend is repetitive and boring monkey work. And nobody likes monkey work. 

Luckily, you can automate the process of downloading data directly within Stata. All it takes is five minutes and a few lines of code in your do-file. 

##### What is API?

API stands for *Application Program Interface*. It is basically a programming language that computer programs use to communicate with each other. It works in a sort of "call and response". To take an example, we can describe what happens when you open your Facebook app to check your newsfeed:

The app sends an *API request* via the internet to Facebook's server along with a confidential *API key*. The API key is a unique password so the server know who you are and what data you have access to.

Once the server has confirmed who you are, it process the request and sends a response



When you open a mobile app like Facebook, the app sends your login credentials and a request to Facebook's server. The server receive the request, confirms your password and send a response with the requested data. In this case, the response would be the latest cat pictures on your newsfeed, new notifications, and tons of advertisements. 



##### Sources