clear

*** 1) Define csv files to include
local filepath = "`c(pwd)'" // Store current path (where do file and csv files are located)
local files : dir "`filepath'" files "*.csv" // Store name of all files ending with .csv
di `"`files'"' // Display list of files to import data from


*** 2) Loop over all files to import and append each file
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


*** 3) Exporting finaldata
order id, first
sort id Segment
save "csv_combined.dta", replace