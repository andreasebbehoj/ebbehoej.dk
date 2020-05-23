---
title: Automating data import from REDCap
subtitle: "Redcap is fantastic for storing your valuable research data. But
  everytime you add or update results you need to download the newest data to
  rerun your analyses, which quickly gets tedious. Luckily there is faster and
  better way: use REDCap's API!"
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

Most (sane) researchers probably use Redcap to collect and store their valuable research data. The advances of using REDCap are plentiful: Reproducibility, automatic backups, data safety, GCP-compliant logging, etc. If you have not yet seen the light and still collect data in an Excel spreadsheet (yikes!), then you are missing out on a huge time saver. 

However, collecting data in REDCap has one minor disadvantage. Everytime you add a new record, correct an error or change anything in REDCap, you need to download your data again to your computer before you can rerun your analysis with the new data. And since each file you export from REDCap has a new an unique name, then you also need to update the name in your Stata do-file. This my friend is repetitive and boring monkey work. And nobody likes monkey work. 

Luckily, you can automate the process of downloading data directly within Stata. All it takes is five minutes and a few lines of code in your do-file. 

##### What is API?

API stands for *Application Program Interface*. It is basically a programming language that computer programs use to communicate with each other. It works in a sort of "call and response". To take an example, we can describe what happens when you open your Facebook app to check your newsfeed:

1. The app sends an *API request* via the internet to Facebook's server along with a confidential *API key*. The API request is a description of what data the app wants the server to send. The API key is a unique password that lets the server know who you are and what data you should have access to.
2. Once the server has confirmed who you are, it process the request to find the data you need. 
3. The server then sends back an *API response*, containing the data that the app requested. In this case, the response could contain the latest cat pictures on your newsfeed, new notifications, and tons of ads. 

You can also picture the API as the waiter on a restaurant. You request some food, the waiter carriers the request to the kitchen, the kitchen process the request, and sends the waiter back with a response in form of a nice enchilada. 

Enough with the theory, time to put it to use. 

##### Activating API in REDCap

In REDCap, the API is deactivated by default. To enable it, navigate to "User Rights", click on your username, click "Edit user privileges", and then tick the API Export:



you or the project administrator must give you the permission to use API. Navigate to 



##### Sources