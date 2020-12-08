set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "ClassExample1.log", replace

*DATA: US Census 1940 1% Sample
use "C:\Users\willi\Documents\PLCY460\Master Data\ClassExample1"

sum
tab higrade
sum incwage, detail
describe

gen female=1 if sex==2
replace female=0 if sex==1

recode higrade (1/14=1 "less HS") (15=2 "HS") (16/18=3 "Some College") (19=4 "College") (20=5 "College+"), gen(education)
tab education
tab education, nolabel

save "C:\Users\willi\Documents\PLCY460\Cleaned Data\ClassExample1Cleaned.dta", replace

sum incwage if female ==1
sum incwage if female==0

corr higrade incwage

twoway(scatter incwage higrade)
 graph export "icnomegrade.pdf", replace
 
 log close