///////////////////////////////////////////////////////////////////////////////
/////////////////// Clean dataset for Python //////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

/// Jie Xia, SUSTech
/// 2024-02-08

///////////////////////////////////////////////////////////////////////////////、
//// 1. Convert csv file to dta for checking

import delimited "E:\USA auditor turnover data\Audit Analytics data\auditfee.csv", clear

save "E:\USA auditor turnover data\Audit Analytics data\auditfee.dta", replace

import delimited "E:\USA auditor turnover data\Audit Analytics data\financial restatement.csv", clear

save "E:\USA auditor turnover data\Audit Analytics data\financial restatement.dta", replace

///////////////////////////////////////////////////////////////////////////////
//// 2. Limited sample in USA

use "E:\USA auditor turnover data\Audit Analytics data\AuditAnalytics_SOX404InternalControls.dta" , clear

gen usa_flag = .
replace usa_flag = 1 if strmatch(AUD_STATE_REG, "*US*")
keep if usa_flag == 1
drop usa_flag

order AUDITOR_FKEY FYE_IC_OP FY_IC_OP OP_AUD_NAME NAME COMPANY_FKEY

save "E:\USA auditor turnover data\Audit Analytics data\AuditAnalytics_SOX404InternalControls_USA.dta", replace

//// Generate AA USA sample auditor
/*
    Create a list that only contain USA auditor in AA file
	Then, merge it with Revelio lab data to drop some obs
*/
keep FY_IC_OP AUDITOR_FKEY OP_AUD_NAME

duplicates drop FY_IC_OP AUDITOR_FKEY, force

export delimited "E:\USA auditor turnover data\Audit Analytics data\AuditAnalytics_AUDITOR_USA.csv", replace

///////////////////////////////////////////////////////////////////////////////
//// 3. Limit AA data for python to construct office-level variables
/*
    In AA SOX404InternalControls data, 
	There should only be one row for each combination of these fields: 
	"COMPANY_FKEY, AUDITOR_FKEY, FY_IC_OP, IC_OP_TYPE, IS_NTH_RESTATED"
*/

use "E:\USA auditor turnover data\Audit Analytics data\AuditAnalytics_SOX404InternalControls_USA.dta", clear

keep COMPANY_FKEY NAME AUDITOR_FKEY OP_AUD_NAME FY_IC_OP IS_NTH_RESTATE IC_OP_TYPE AUD_CITY AUD_STATE_NAME AUDIT_FEES BUS_CITY COMBINED_IC_OP

order AUDITOR_FKEY OP_AUD_NAME COMPANY_FKEY NAME AUDITOR_FKEY OP_AUD_NAME  FY_IC_OP IS_NTH_RESTATE IC_OP_TYPE BUS_CITY AUD_CITY AUD_STATE_NAME AUDIT_FEES COMBINED_IC_OP

sort AUDITOR_FKEY FY_IC_OP COMPANY_FKEY

//// Only keep record from auditor(IC_OP_TYPE == a)
gen auditor_flag = 0
replace auditor_flag = 1 if strmatch(IC_OP_TYPE, "a")
drop if auditor_flag == 0
drop auditor_flag

gen BUS_CITY_TITLE = proper(BUS_CITY)

gen flag = 0
replace flag = 1 if BUS_CITY_TITLE == AUD_CITY
tab flag

save "E:\USA auditor turnover data\Audit Analytics data\AuditAnalytics_us_cleaned_for_python.dta",replace

//// Save a list of audit office city for comparing with 'city' field in revelio labs sample
keep AUD_CITY AUD_STATE_NAME

duplicates drop AUD_CITY AUD_STATE_NAME, force

export delimited "E:\USA auditor turnover data\Audit Analytics data\AuditAnalytics_SOX404InternalControls_us_city_list.csv", replace


























