set more off
clear
capture log close

cd "C:\Users\willi\Documents\PLCY460\Output"

log using "GW12.log", replace
use "C:\Users\willi\Documents\PLCY460\Master Data\groupwork12"
//12.1
regress home_attend losses
// losses have a negative impact on attendence
gen loss2 =losses^2
regress home_attend losses loss2
// at 80 losses
//-856184.5+(89688.45* 80)-(695.80*80^2)
// at 20 losses
//-856184.5+(89688.45* 20)-(695.80*20^2)
// it seems like the more losses the larger attendence past a certain point?
regress home_attend losses
//log linear
gen lnhome = log(home_attend)
regress lnhome losses
//linear log
gen lnlosses = log(losses)
regress home_attend lnlosses
// log log
regress lnhome lnlosses


// 12.2
regress home_attend runs_scored runs_allowed losses
testparm runs_scored runs_allowed
regress home_attend losses
// the inclusion of other variables doe snot significantly improve the fit of the model.
// F test by hand:
// F= (R^2/k)/((1-r^2)/(n-k-1))
// R^2 =.0775 k=3 n=710
// F= (.0775/3)/((1-.0775)/(710-3-1)) =19.77
//we can reject the null as F stast is greatere than critical value
