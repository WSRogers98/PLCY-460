set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "GW7.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\groupwork7"

reg r10iearn raedyrs

twoway lfit r10iearn raedyrs

reg r10iearn raedyrs r10nsscre

regress r10nsscre raedyrs

sum raedyrs
sum r10iearn
sum r10nsscre


