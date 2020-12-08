set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "GW8.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\groupwork8"
* Group Work 8

*8A clean data to only married with spouse
keep if  r10mstat == 1

*8B  coefficient from regression
reg  r10iearn  raedyrs s10iearn r10nsscre
*B0= -79531.48 B1=1993.80 B2=.132 B3= 143.49
*years of education (b1) and Iq score (b3) matter the most

*8C SE for spouse income
reg s10iearn raedyrs r10nsscre if e(sample) ==1
sum s10iearn if e(sample)==1
* se = sqrt( 1928100000/((11281-1)*45378.44(1-.0379)))
*se= 1.98
 
* the following conversion rates were done on Oct 2nd 2020
*assuming starting currency is USD
*8D 
gen yeninc = 105.36*r10iearn
reg  yeninc  raedyrs s10iearn r10nsscre
*coefficients(slope) all changed and standard error did as well  proprtionately by the conversion rate multiplier of 105.36

*8E
gen mpesoSinc = 21.65*s10iearn
reg  r10iearn  raedyrs mpesoSinc r10nsscre
* only spouise data changed and is now smaller, this would impact the SE in the same way by a factor of 21.65

*8F
reg  yeninc  raedyrs mpesoSinc r10nsscre
*regression above depicts change to SE and slope it changes by a combinatiuon of the added coeficient conversion rate

*8G
gen yenSinc = 105.36*s10iearn
gen mpesoinc = 21.65*r10iearn
reg  yeninc  raedyrs yenSinc r10nsscre
reg  mpesoinc  raedyrs mpesoSinc r10nsscre
*changes directly by the conversion rate for each.

* I believe these regressions are showing it mathematically for both the coef and SE 


*******         8.2         *******
* Continuing using the data being still cleaned
reg  r10iearn  raedyrs s10iearn r10nsscre
set seed 123456
gen normaldist =rnormal()
sum normaldist
kdensity normaldist
gen  inaccdep = r10iearn +10*rnormal()
reg inaccdep raedyrs s10iearn r10nsscre
gen inaccind =raedyrs +10*rnormal()
reg r10iearn  inaccind s10iearn r10nsscre

*1. coeeficients stay the same but R2 decreases
*2. this creates attenuation bias that decreases the coeeficient 
*3. it is worse for the independewnt variable to have an error because it causes the coefficient to decreasde towards zero