set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "GW4.log", replace

* Merging spreadhseet and data
insheet using "C:\Users\willi\Documents\PLCY460\2016ue.csv"
save  "C:\Users\willi\Documents\PLCY460\Master Data\GW4", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\GW4"
merge 1:m statefip using "C:\Users\willi\Documents\PLCY460\Master Data\2016ACS-clean"

*creating and labeling  a Full Time Variable
gen fulltime=1 if uhrswork >= 40
replace fulltime=0 if uhrswork < 40
label variable fulltime "Full time Employment (40 hours or more)"
label define ftlabel 0 "Not Full Time" 1 "Full Time"
label values fulltime ftlabel

* Finding ratio for north and south carolina
tab fulltime if state=="North Carolina"
tab fulltime if state=="South Carolina"

*labeling race & black variable 
label variable race "Race [general version]"
label define racelabel 1 "White" 2 "black/African American" 3 "American Indian or Alaska Native" 4 "Chinese" 5"Japanese" 6 "Other Asian or Pacific Islander" 7 "Other race, nec" 8 "Two major races" 9 "Three or more major races"
label values race racelabel
gen black=1 if race ==2
replace black=0 if race!=2
label define blacklabel 0 "not Black" 1 "Black"
label values black blacklabel
tab race 
tab black

* generating rent per bedroom
gen rpbdrm=rent/bedrooms
label variable rpbdrm " Rent per Bedroom"
sum rpbdrm, detail