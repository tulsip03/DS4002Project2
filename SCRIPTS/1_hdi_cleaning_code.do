clear all
set more off
cd "/Users/tulsipatel/Downloads"

import delimited "HDR23-24_Composite_indices_complete_time_series.csv", clear
save "hdi.dta", replace

// cleaning data
// gnipc_* , co2_prod_* , everything separated by gender *_f* , *_m*

drop co2_prod_*
drop gnipc_*
drop *_f*
drop *_m*
drop phdi_*
drop ineq_le_*
drop diff_hdi_phdi_*
drop mf_*
drop rankdiff_hdi_phdi_*
drop coef_ineq_*

save "hdi.dta"
