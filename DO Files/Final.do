set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "FInal.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\460FinalExam"

// 6A
regress h1vehicle raedyrs
graph twoway (lfit h1vehicle raedyrs) (scatter h1vehicle raedyrs)

//6B
regress h1vehicle raedyrs rameduc rafeduc r1agey_e raracem h1child
//6c
regress h1vehicle raedyrs rameduc rafeduc r1agey_e raracem h1child
regress h1vehicle raedyrs r1agey_e raracem h1child
// since the R^2 value is greater when you include these two variables they improve the fit of the model
//6D kinda
sum
//6e
regress h1vehicle rafeduc if raedyrs==12
regress h1vehicle rafeduc if r1dadliv==1
regress h1vehicle rafeduc if (r1momliv==0 &rameduc==16)