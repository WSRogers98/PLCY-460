set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "Quiz9.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\Quiz9"

// I 100% think i did this wrong because i want to say we have to do the indicator stuff of F-tests we previously did but the questions make no mention of it so i assume its just regular regressions?
// I thought i could handle a quiz with an active gunman nearby but I guess I cant oops
// the helicopter is very distracting

// #2
sum gr8_math, detail
// mean: 52.46
// standard deviation: 9.31
// range: 50.13

// #3
tab depression
// 22.67%

// #4
// it doesn't say to do this as an indicator? i assume just a regular bivariate
regress gr8_math depression
// the coefficient indicated depression has a negative impact on test score. this is not statistically significant because we have a low R^2 value and taking depression alone does not explain for all variability.

// #5
regress gr8_math depression female white parent_ba parent_income k_genknow
// parent education, general knowledge and race seem to have a positive coefficient relationship with test score  while depression and is female have a negative relationship with test score. parent income seems to have little affect. it is significant because we have a higher R^2 value (.27) so more variance is explained but it is only enough for a small linear association.