set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "Quiz6.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\NLSY 05_Q6"
sum momhighgrade97, detail
tab momhighgrade97

* I am currently confusing stata with my other programming languages so doing this by hand
* I may use # instead of * to commennt on accident as well, sorry its been a long week of C programming

*total without no answer= 8003
*total less than HS= 1811
*22.63%

regress faminc05 momhighgrade97
* i remebered how to do it
drop if  momhighgrade97 <0
drop if faminc05 <0
tab momhighgrade97

* the question wording makes me thing fam is dependent and mom is independent 
regress faminc05 momhighgrade97