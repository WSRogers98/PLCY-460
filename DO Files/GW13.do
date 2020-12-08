set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "GW13.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\groupwork13"

// 13.1
// P(A) = All people that have a mother that graduated college (just Graduated College)
// 1491/11040 = 13.5%
// P(B) = All people that had a parent attend their class
// 3146/11040  = 28.50%
// P(C) = All people that had a parent that did not complete high school
// 1649/11040 = 14.94%
// P(A and B)
// 465/11040 = 4.21%
// P(A given B)
// 465/3146 = 14.78%
// P(B given A)
// 465/1491 =  31.19%

//13.2
regress married education age
predict marriedLPM
sum marriedLPM
// it exceeds 1 so logit should be used
logit married education age
sum married 
margins, dydx(education) atmean
// 1 increase of education inctrease chance of marrierd by .69418 percentage points

