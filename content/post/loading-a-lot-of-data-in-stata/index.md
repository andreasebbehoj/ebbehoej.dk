---
title: Loading (a lot of) data in Stata
subtitle: How to use loops in Stata for loading several csv files.
date: 2020-05-04T18:12:53.414Z
summary: "A guide on how to load many csv or excel files into Stata without
  copy/pasting yourself to death."
draft: false
featured: false
authors:
  - admin
tags:
  - ""
categories:
  - stata
image:
  filename: featured
  focal_point: Smart
  preview_only: false
---

An office mate asked me about a Stata problem, he had been struggling with: how to load around 200 individual csv-files (comma separated files) into Stata?

### The Problem
There were approx. 100 patients and each patient had 2 csv-files. He _could_ of course manually copy/paste the contents from file into a single excel file and then load the combined file into Stata. It is completely doable with 100 patients x 2 files, but it's repetitive and boring. And also there is the risk that he miss a file or copy the same file twice. And what if it was 1000 or 10000 files?

No thanks. Plenty of monkey work in a PhD already.

### The Data structure
Each patient had 2 csv-files that each looked somewhat like this:

{{< figure src="id_data.png" title="example csv file (obviously not real-life patient data)" lightbox="true" >}}

All csv-files were stored in a single folder and systematically named: [ID number]-data-1.csv and [ID number]-data-2.csv:
{{< figure src="filelist.png" title="Data structure in folder" lightbox="true" >}}


### The Solution
We use Stata's mighty _loop_ function to do the copy-pasting for us. We'll do that in 3½ steps:
1. Define csv files to include
2. Loop over files to import and append each file
3. Export final data set

You can download the csv- and Stata Do-file from the example [here](https://github.com/andreasebbehoj/ebbehoej.dk/tree/master/content/post/loading-a-lot-of-data-in-stata/Example) if you want to run it yourself.


#### Step 1 - Define csv files
First we need to define which files to include. Assuming you have your do file in the same folder as all the csv-files, then we want all csv files from the "current" folder (the folder that Stata is working in). We'll first define a _local_ with the path to the current folder, which Stata stores under the name c(pwd).
```
local filepath = "`c(pwd)'" // Save path to current folder in a local
di "`c(pwd)'" // Display path to current folder
```

Next, we want to store a list with the names of all csv files in the folder that we want to import. We'll store this list in a _local_ as well.
```
local files : dir "`filepath'" files "*.csv" // Save name of all files in folder ending with .csv in a local
di `"`files'"' // Display list of files to import data from
```


#### Step 2 - Loop over files
To actually import the files listed in the _files_ local, we'll do a couple of things

First, we will generate a temporary file called _master_. This is where we store the new accumulating data.
```
tempfile master // Generate temporary save file to store data in
save `master', replace empty
```

Next, we will ask Stata to run a loop (i.e. run the same code several times) for all files stored in the local _files_. The loop consists of two parts: A, where each csv file is imported (_import delimited_) and B, where that file is appended to the _master_ file. To keep track of which observations belong to which patients, we'll generate a variable _id_ in part A containing  the name of the imported csv file.
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

#### Step 3 - Export final data set
If you are used to Stata, then exporting the final data set is pretty straight forward.
```
order id, first
sort id Segment
save "csv_combined.dta", replace
```

### Final remarks
Hope this introduction to the _loop_ and _dir_ functions has helped. The principles can of course be utilized for much more complicated data set and/or more complex tasks.

Other examples of use:
* Importing txt-files (same principle as csv files above but change _dir_ and _import delimited_ to new file format)
* Importing pdf files (use DocuFreezer to batch convert pdf files to txt files and same as above)
* Convert individual csv data files to individual Stata files (simple add _local newfile = subinstr("`x'", ".csv", "", .)_ and _save `newfile', replace_ in bottom of loop)
* Copy all csv files from many different folders into a single folder using _copy_ and _shell_ (a bit more advanced, see this [post on Statalist](https://www.statalist.org/forums/forum/general-stata-discussion/general/1384969-using-copy-with-local-macros))
