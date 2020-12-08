set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "GW6.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\groupwork6"

reg momed79 wage96
graph twoway (lfit wage96 momed79) 
reg wage96 momed79, beta
