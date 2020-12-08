set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "Quiz7.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\Quiz7"


regress income_2017 faminc_1997 mom_ba

regress income_2017 mom_ba
 *#2: there is a positive relationship between income and mother earning a ba
 

regress income_2017 faminc_1997 mom_ba
 *#3 family income has a positive relationship with income albeit a small one 
 
 *#4
*  B1^OmitX2 = B1+B2delta
*assuming mom_ba is B1 based of the question wording
regress income_2017 mom_ba
regress income_2017 faminc_1997 mom_ba
 *B1^OmitX2=17168.75    B1=10313.86
 * B1^OmitX2 >b1 so there is positive bias
 * 17168.75=10313.86+B2delta
 * 17168.75=10313.86+.20delta
 regress income_2017 faminc_1997
  *B1^OmitX2=17168.75    B1=10313.86
 * B1^OmitX2 >b1 so there is positive bias
 * 17168.75=10313.86+B2delta
 * 17168.75=10313.86+.20*delta
 * delta = 34274.45