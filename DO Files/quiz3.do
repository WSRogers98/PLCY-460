set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "quiz3.log", replace

*DATA: US Census 1940 1% Sample
use "C:\Users\willi\Documents\PLCY460\Master Data\Quiz3"

tab marst
sum uhrswork, detail

gen married=1 if marst==1
replace married=0 if marst==6

sum uhrswork if married==1
sum uhrswork if married==0