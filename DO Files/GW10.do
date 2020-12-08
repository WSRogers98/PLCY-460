set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "GW10.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\groupwork10"

gen treatment = 1 if age >=65
replace treatment =0 if age<65
gen Post =1 if year == 2007
replace Post =0 if year== 2005

*Comparison between selfemployment at different ages after Medicare Part-D
reg selfemployed Post if treatment ==1
reg selfemployed Post if treatment ==0
*Self employment seems to go up after itroduction of Medicare Part-D

reg selfemployed i.treatment##i.Post
*other two figures written on paper

*the interaction term estimates a causal estimate of the effect of treatment by telling us how different  self employment is by using a control and controlling other factors that may affect the data
*assumptions that are required for this data is there are no changes to the economy that affect self employment 