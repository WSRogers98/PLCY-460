set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "GW9.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\groupwork9"

regress Amount MPHover
*Amount = 6.89MPHover+4.42

regress Amount MPHover Black
*it seems like African Americans get smaller tickets

* just to check if anything was missng
gen black2 =Black if Black != .
regress Amount MPHover black2
* confirms that African Americans get smaller fines

regress Amount MPHover Hispanic
regress Amount MPHover Black Hispanic
* it slightly altered the data for black and hispanics have a higher cost for mph than black

gen Hispanic2 = Hispanic if Hispanic!= .
regress Amount MPHover Black Hispanic2
*confirms that ticket price changes by mph less than average but more than blacks

regress Amount MPHover OutTown
regress Amount MPHover Black Hispanic OutTown
* out of town has a slightly less ticket cost than average

*ttest
ttest Amount, by(Female)
* Females get charged more for tickets and this is statistically significant

sum Amount if Female==0
sum Amount if Female==1
/*
by hand 

t=(124.67-116.73)/sqrt((58.28^2/21173)+(51.49^2/10501))
= 7.94/.6698  =11.85

*/
*end 9.1


*begin 9.2
regress Amount Female
regress Amount MPHover Female

gen male = Female if Female==0
gen female2  = Female if Female ==1

regress Amount male
regress Amount MPHover male

regress Amount female2
regress Amount MPHover female2
* it would appear that men get a higher costing ticket (constant is higher for men than women)

gen fmph = Female+MPHover
regress Amount MPHover Female fmph
*why is my fmph omitted?

gen blackage = Black+Age
regress Amount Age Black blackage
* now it omits black?
* as age goes up ticket prices increase for black whereas it decreases for nonblack