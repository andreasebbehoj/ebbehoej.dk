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


### Setup
API is deactivated by default for security purposes, so you need to active it.

##### REDCap settings
In REDCap, the API is deactivated by default. To enable it, navigate to "User Rights", click on your username, click "Edit user privileges", tick "API Export" and save changes:
{{< figure src="redcap-edit-user-privileges.png" title="" lightbox="true" >}}
Only the project administrator can give you permission to use API. If you are project administrator but cannot find API in settings, then your institution probably restricted access to APIs and you need to contact the institution's REDCap super admin.
Note: Unless you know what you are doing or it is only a test database, I advice strongly against checking the "API Import/Update". If you fooled around with the API import function, you could inadvertently overwrite your entire database.

Once you has access, update the page. You should see a new "API" app in menu to the left:
{{< figure src="redcap-api-menu.PNG" title="" lightbox="true" >}}
If you see this, then the API is active.

##### Getting the API key
Click the API menu. Click "Generate API token"
{{< figure src="redcap-generate-token.PNG" title="" lightbox="true" >}}

A 32-character text string appears. This is your API key (or API Token in REDCap lingo) that you will need in a second.
Open Notepad (or TextEdit for MacOS), copy/paste the API token and save it as "APIKEY_redcap.txt" in the folder where you keep your Stata do file.

A word of warning: The API key is confidential! Anyone who has the code can download your entire dataset including social security numbers and other patient identifiable data. Treat your API key as you would treat the code to your bank account.

### cURL
We will use the nifty little program cURL to call the API from Stata. cURL is short for _Client URL_. It is program used for interacting webpages and servers with commands instead of using the mouse. And it can communicate with APIs.

It should be preinstalled on Windows 10 and newer versions of MacOS.To check if it is installed, first open the terminal by pressing the **Windows-key** and search for "Command Prompt" (in MacOS: press **Cmd** + **spacebar**). Once in the terminal, type `curl --V`  If the output looks something like this, you're good to go:
{{< figure src="curl-preinstalled.PNG" title="" lightbox="true" >}}

If cURL is not installed, follow [this guide](https://help.ubidots.com/en/articles/2165289-learn-how-to-install-run-curl-on-windows-macosx-linux).

### In Stata
Time to open Stata. We will use Stata's `shell` function to run cURL and interact with the REDCap API. The code is provided below and can be downloaded [here](LINK). You don't need to understand what is does (cannot say, I entirely understands it myself) but explanations are provided in comments. You need to correct _curlpath_ and _apiurl_ to match your
```stata

```

To call the API in Stata, we will use the `shell` function in Stata to call the program cURL. It is preinstalled on Windows 10 and newer versions of MacOS. To ensure


##### Sources
Most of this code is _heavily_ inspired by (red: copied from)
