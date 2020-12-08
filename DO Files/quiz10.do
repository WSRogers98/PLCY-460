set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "Quiz10.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\Quiz 10"

// #1
regress mathscore lninc age97 age2 urban privateschool
// mathscore =  -183.0+4.95*lninc+28.58*age97+-1.14*age2+-1.63*urban+4.45*privateschool
//for every change in lninc mathscore increases by 4.95 percentage points.

// #2
// sum is not relevant for question its just for me
sum age97, detail
/*
mathscore =  -183.0+4.95*lninc+28.58*(16)+-1.14*(16^2)+-1.63*urban+4.45*privateschool
457.28-291.84
28.58*(16)+-1.14*(16^2) =165.44
including both age variables:
at age 16, the slope of age is 165.44 
*/
regress DestroyEver97 age97 urban privateschool faminc female mathscore
margins, dydx(privateschool) atmean