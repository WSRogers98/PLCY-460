set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "Quiz8.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\zambia_child_grant_evaluation"

reg chicken_num

* #1
* could i just use given treatment and post?
gen postTreat = 1 if  (treat==1 & post ==1)
replace postTreat = 0 if (treat!=1 | post !=1)
tab postTreat
* #2 & #3
* the transfer treatment seems to have a positive impact on the amount of chickens. inintially transfer and nontransfer are fairly similar but after treatment (post) there is a significant impact of the treatment. having roughly 2 chickens initially (1.88 for non-transfer)
reg chicken_num postTreat
reg chicken_num post if treat ==1
reg chicken_num post if treat  ==0
reg chicken_num treat if post ==1

* #4
*assume there was no change in external factors like a disease that could kill livestock occurring. for this to be valid only the treatment can be a contributing factor.