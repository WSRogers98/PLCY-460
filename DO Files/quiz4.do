set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "quiz4.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\2017-18 NCAA Basketball Quiz"

*label win loss
label variable team_result "Win or Loss"
label define resultlabel 1 "win" 0 "loss"
label values team_result resultlabel
tab team_result

*find home win rate
*home win rate is 68.91%
tab team_location
tab team_location, nolabel
gen homewin=1 if team_location==2 & team_result==1
replace homewin=0 if team_location==2 & team_result==0
tab homewin

* make blowout variable
gen blowout=1 if team_margin > 20
replace blowout=0 if team_margin <=20
tab blowout

*find UNC blowouts
tab team
gen UNCblowout=1 if blowout==1 & team=="North Carolina"
tab UNCblowout
*total unc blowouts = 6