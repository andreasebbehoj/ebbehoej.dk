---
title: Loading (a lot of) data in Stata
subtitle: How to use loops in Stata for loading many csv files.
date: 2020-05-04T18:12:53.414Z
summary: "A guide on how to load many csv or excel files into Stata without
  copy/pasting yourself to death."
draft: true
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
### Problem
An office mate asked me about a Stata problem, he had been struggling with: how to load many individual csv-files (comma separated files) into Stata?

There were approx. 100 patients and each patient had 2 csv-files. He _could_ of course manually copy/paste the contents from file into a single excel file and then load the combined file into Stata. It is completely doable with 100 patients x 2 files, but it's repetitive and boring. And also there is the risk that he miss a file or copy the same file twice. And what if it was 1000 or 10000 files?

No thanks. Plenty of monkey work in a PhD already.

###Data structure
Each patient had 2 csv-files that each looked somewhat like this:

{{< figure src="id_data.png" title="example csv file (obviously not real-life patient data)" lightbox="true" >}}

All csv-files were stored in a single folder and systematically named: [ID number]-data-1.csv and [ID number]-data-2.csv:
{{< figure src="filelist.png" title="Data structure in folder" lightbox="true" >}}


### Solution
We use Stata's mighty _loop_ function to do the copy-pasting for us. We'll do that in 3½ steps:
1. Define csv files to include
2. Loop over files to import and append each file
3. Export final data set

You can download the csv- and Stata Do-file from the example [here](https://github.com/andreasebbehoj/ebbehoej.dk/tree/master/content/post/loading-a-lot-of-data-in-stata/Example) if you want to run it yourself.


## 1. Define csv files
```
local filepath = "`c(pwd)'" // Store current path (where csv files are stored)
local files : dir "`filepath'" files "*.csv" // Store name of all files ending with .csv
di `"`files'"' // Show list of files to mine data from

```

## 2. Loop over files
```
tempfile master // Generate temporary save file to store data in
save `master', replace empty

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

## 3. Export final data set
If you are used to Stata, then this is pretty straight forward:
```
order id, first
sort id Segment
save "csv_combined.dta", replace
```
