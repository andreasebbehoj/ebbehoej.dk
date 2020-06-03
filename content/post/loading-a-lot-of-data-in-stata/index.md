---
title: Loading multiple csv files in Stata
subtitle: How to load endless csv files into Stata with the loop function instead of copy/pasting yourself to death.
date: 2020-05-04T18:12:53.414Z
summary: "How to load endless csv files into Stata with the loop function instead of copy/pasting yourself to death."
draft: false
featured: false
authors:
  - admin
tags:
  - "stata"
categories:
  - stata
image:
  filename: featured
  focal_point: Smart
  preview_only: false
header:
  image: "header_csv.jpg"
  caption: "Image credit: [Pxfuel](https://www.pxfuel.com/)"
---
### The Problem
One of my colleagues had a pretty common data problem: How to load around 200 individual csv-files (comma separated files) into Stata?

There were approx. 100 patients and each patient had 2 csv-files containing different scans. He _could_ of course manually copy/paste the contents from file into a single excel file and then load the combined file into Stata. While it is completely possible to do, it is repetitive, boring and there is a high risk of making manual errors.

No thanks. Life offers plenty of monkey work already.

{{% toc %}}


### The Solution
We use Stata's mighty _loop_ function to do the copy-pasting for us. We'll do that in 3 steps:
1. Define csv files to include
2. Loop over files to import and append each file
3. Export final data set

You can download the csv- and Stata Do-file from the example [here](https://github.com/andreasebbehoj/stata-examples/tree/master/Importing%20multiple%20csv%20files) if you want to run it yourself.

### Data structure
Each patient had 2 csv-files that each looked somewhat like this:

{{< figure src="id_data.png" title="example csv file (obviously, it is just gibberish and not real patient data)" lightbox="true" >}}
Note, that number of rows or columns doesn't matter. However, for this code to work each column must represent a variable (preferably with variable name in first row) and each row represent an observation (which is the most common data structure). Importing files with other data structures is a story for another day.

All csv-files were stored in a single folder and systematically named: [ID number]-data-1.csv and [ID number]-data-2.csv:
{{< figure src="filelist.png" title="Data structure in folder" lightbox="true" >}}


### Step 1 - Define csv files
First we need to define which files to include. Assuming you have your do file in the same folder as all the csv-files, then we want all csv files from the "current" folder (the folder that Stata is working in). We'll first define a _local_ with the path to the current folder, which Stata stores under the name _c(pwd)_.
```stata
local filepath = "`c(pwd)'" // Save path to current folder in a local
di "`c(pwd)'" // Display path to current folder
```

Next, we want to store a list with the names of all csv files in the folder that we want to import. We'll store this list in a _local_ as well.
```
local files : dir "`filepath'" files "*.csv" // Save name of all files in folder ending with .csv in a local
di `"`files'"' // Display list of files to import data from
```


### Step 2 - Loop over files
To actually import the files listed in the _files_ local, we'll do a couple of things

First, we will generate a temporary file called _master_.
```
tempfile master // Generate temporary save file to store data in
save `master', replace empty
```
Note: The name of the tempfile is not important, this is simply where we will store the data while running our code.

Next, we will ask Stata to run a loop (i.e. run the same code several times) for all files stored in the local _files_. The loop consists of two parts: A, where each csv file is imported (`import delimited`) and B, where that file is added (`append`) to bottom of the _master_ file. To keep track of which observations belong to which patients, we generate a variable _id_ in part A containing  the name of each imported csv file.
```
foreach x of local files {
    di "`x'" // Display file name

	* 2A) Import each file
	qui: import delimited "`x'", delimiter(";")  case(preserve) clear // Import csv file
	qui: gen id = subinstr("`x'", ".csv", "", .)	// Generate id variable (same as file name but without .csv)

	* 2B) Append each file to masterfile
	append using `master'
	save `master', replace
}
```
Run this code, and voila! You have combined all 200 (or 200,000) files in the blink of an eye. Only thing left is to export the data.


### Step 3 - Export final data set
If you are used to Stata, then exporting the final data set is pretty straight forward.
```
order id, first
sort id Segment
save "csv_combined.dta", replace
```


### Final remarks
Hope this introduction to the `loop` and `dir` commands has helped. The principles can of course be utilized for much more complicated data set and/or more complex tasks.

Other examples of use:
* Importing txt-files (same principle as csv files above but change `dir` and `import delimited` to new file format)
* Importing pdf files (use DocuFreezer to batch convert pdf files to txt files and same as above)
* Convert individual csv data files to individual Stata files (simply add `save "newfilename.dta", replace` in bottom of loop)
* Copy csv files from many different folders into a single folder using `copy` and `shell` (a bit more advanced, see [this post on Statalist](https://www.statalist.org/forums/forum/general-stata-discussion/general/1384969-using-copy-with-local-macros))
