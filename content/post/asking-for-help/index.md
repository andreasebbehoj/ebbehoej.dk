---
title: Asking for help with Stata
subtitle: Do's and don'ts when writing researchers for help
date: 2022-05-31T09:08:25.626Z
summary: Most researchers are happy to help you, if you're struggling with your
  Stata code. But how do you ask other Stata nerds for help?
draft: false
featured: false
authors:
  - admin
tags:
  - stata
categories:
  - stata
  - stata resources
image:
  filename: featured
  focal_point: Smart
  preview_only: false
header:
    image: "header_asking-for-help.jpg"
    caption: "An example of a pretty effective -albeit rather unspecific- plea for help."
---
Sometimes you get stuck in Stata and your code simply refuses to work. You've googled everything, gone through the Stata cheat sheets, read the documentation and [all the other tools you can think of](https://www.ebbehoej.dk/post/stata-ressources-for-beginners/). You're stuck and you need help from somebody.

Luckily, most researchers are happy to help. But how do you go about asking on a forum or writing to somebody? What do you need to include in your post or email so that others have a chance of understanding what you want and where your code has gone wrong?

I get quite a few emails from people who've read one of my guides but can't get it to work. I like helping people (Stata is my hobby afterall) and you are always welcome to ask. But often, the initial email I receive is not very specific about the problem or doesn't include the information I need to understand where the problem lies. Hence, this short guide on how to ask other researchers for help.

# In forums

There are several great forums where experts are happy to help (e.g. Statalist or Stackoverflow). Please please please **always read the forum guidelines** before you ask your question on a forum. Statalist, for example, have a [nice post on what ](https://www.statalist.org/forums/help)you need to do before asking for help.

Generally, forums want you to include:

1. Aim - what are you trying to do?
2. Problem - where is your code failing
3. Your actual code !!!

The key thing is to include a working example of your code which everybody can run on their own computers. The best thing is if you can reproduce your issue using one of the example datasets which comes with Stata (google or type `help dta_examples` to find a relevant dataset). That way other researchers can easily run your code, see where your problem lies, and correct your code or suggest another solution.

# By mail

If you're a specific researcher (say me), they might have other preferences than a forum, depending on what your issue is. What you need to include in your email might also depends on what you want help with. If you're writing the author of a specific package to report a bug, it is again adviseable to make a short do file with a example dataset that reproduces the error. If you're writing the author of a scientific paper, who have produced a cool graph or analysis that you want to reproduce, then it might be OK to just (politely) ask if you can have a copy of the do file.

# Writing me

As I said, I am happy to answer emails about Stata and my posts, programs, etc. But if you're writing me about an issue, **I would very much like** you to include the following in your email:

1. A description of your problem

For obvious reasons. If you can indicate what you have tried to do to fix the problem that would also be helpful.

2. Your do-file

A lot of the emails, I receive, are due to typos in the do file. A ` instead of  ', a missing comma, or a typo in the name of a local. These are easy for to fix, but only if I can actually read the whole code.

And by 'the whole code' I mean everything that is relevant to the issue at hand, especially anything you copied from one of my guides. I don't need 2000 lines of histograms and scatterplots, if your problem is about [automating data import from REDcap with API](https://www.ebbehoej.dk/post/automating-data-import-from-redcap/).

3. A log file of you running the code (see caveat below)

Often, I get an email saying that "I tried  your code on whatever topic but Stata reports an error". That is not as informative or precise as the including the actual error message that Stata gives you. A log file includes everything you see in the Stata results window, including your code, results, error messages, the whole shabang.

Log files are extremely useful for many reasons. If you haven't heard about logs, then I'd recommend you google a bit or see a YouTube video about Stata logs (for example [Joseph Cohen's 4 min guide](https://www.youtube.com/watch?v=VD_QHHC4F6k)).

In brief, you start a log by typing `log using filename, replace`, run your code from the beginning until the end (or until you hit the error message), then type `log close`. The log file can now be found in your folder.

4. Other info that might be relevant

Depending on your issue it could be relevant to send a screen dump of a graph, the browse window, or the folder containing the files you want to import. The relevant files you attach in your first mail, the easier it is for me to understand your problem and help you. But remember not send sensitive data (see below)!

# An important caveat

Never ever send patient identifiable data or other types sensitive data! Not to me or anyone else. Regular emails are not a safe way to send sensitive data. Besides, there are often rules against that (GDPR, privacy rules, institution policies, etc). So before you send your email, check:

* Attached files: Obviously, you shouldn't send .csv or .dta files with identifiably patient data. But completely anonymized data are OK. If you want to send a file/screen dump of the data, replace IDs and dates with some gibberish. That way I can understand you data structure without knowing that it was John Doe from Arkansas, born May 5 1966, who underwent appendectomy October 22 last year.
* Do file: Remember that if you drop specific observations (e.g. `drop if socialsecuritynumber="050201-1234"`) then you have sensitive data in your do file. Delete it before you share the do file with others.
* Log file: Be aware that if you write `list` or `codebook id name date_birth date_death` in your code then the data is gonna show up in your log file. You can use `log off|on` in your do file to temporarily pause the log file so sensitive data is not recorded.

# Final remarks

That were my tips on how to ask others for help. Naturally, I hope you'll read this before you write me, so we can both save time. If you wrote me an email before reading this, then don't fret. As I said, Stata is my hobby and I don't mind helping others with it.
