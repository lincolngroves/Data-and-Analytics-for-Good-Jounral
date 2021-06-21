*-------------------------------------------------------------------------------------------------------*
|                            SAS | Data and Analytics for Good Journal	                  	        |
|                                    02 - SAIPE Data - 05.06.2021                                       |
*-------------------------------------------------------------------------------------------------------*;
libname 	saipe "C:\Users\ligrov\OneDrive - SAS\Data for Good\Social Innovations Summit\SAS Data";;
options 	orientation=landscape mlogic symbolgen pageno=1 error=3;

title1 		"SAS | Data and Analytics for Good Journal";
title2 		"Import and Prepare the SAIPE Data | County Level Data Analysis";
footnote 	"File = 02 - SAIPE Data - 05.06.2021";


*****************************************************  Data source;
*********************************  https://www.census.gov/programs-surveys/saipe.html ;
*********************************  https://www.census.gov/data/datasets/2019/demo/saipe/2019-state-and-county.html ;

*-------------------------------------------------------------------------------------*
|                                    Import Data                                      |
*-------------------------------------------------------------------------------------*;
data y2019;

	Year 	= 2019 ;

	infile 	"C:\Users\ligrov\OneDrive - SAS\Data for Good\Social Innovations Summit\Raw Data\est2019ALL.txt" pad missover lrecl=264;

	input		StateFIP				1-2
			CountyFIPS				4-6
			Poverty					8-15
			Poverty_Lower				17-24
			Poverty_Upper				26- 33
			Poverty_Pct				35- 38
			Poverty_Pct_Lower			40- 43
			Poverty_Pct_Upper			45- 48
			Poverty_0_17				50- 57
			Poverty_0_17_Lower			59- 66
			Poverty_0_17_Upper			68- 75
			Poverty_Pct_0_17			77- 80
			Poverty_Pct_0_17_Lower			82- 85
			Poverty_Pct_0_17_Upper			87- 90
			Poverty_5_17_Families			92- 99
			Poverty_5_17_Families_Lower		101-108
			Poverty_5_17_Families_Upper		110-117
			Poverty_5_17_Families			119-122
			Poverty_5_17_Families_Lower		124-127
			Poverty_5_17_Families_Upper		129-132
			Median_Household_Income			134-139
			Median_HH_Income_Lower			141-146
			Median_HH_Income_Upper			148-153
			State_Name			$	194-238
			State_Postal			$	240-241
	;

	label	StateFIP 				= 'FIPS state code' 
			CountyFIPS 			= 'FIPS county code ( 0 for US or state level records)' 
			Poverty 			= 'Estimate of people of all ages in poverty' 
			Poverty_Lower 			= '90% confidence interval lower bound of estimate of people of all ages in poverty' 
			Poverty_Upper 			= '90% confidence interval upper bound of estimate of people of all ages in poverty' 
			Poverty_Pct 			= 'Estimated percent of people of all ages in poverty' 
			Poverty_Pct_Lower 		= '90% confidence interval lower bound of estimate of percent of people of all ages in poverty' 
			Poverty_Pct_Upper 		= '90% confidence interval upper bound of estimate of percent of people of all ages in poverty' 
			Poverty_0_17 			= 'Estimate of people age 0-17 in poverty' 
			Poverty_0_17_Lower 		= '90% confidence interval lower bound of estimate of people age 0-17 in poverty' 
			Poverty_0_17_Upper 		= '90% confidence interval upper bound of estimate of people age 0-17 in poverty' 
			Poverty_Pct_0_17 		= 'Estimated percent of people age 0-17 in poverty' 
			Poverty_Pct_0_17_Lower 		= '90% confidence interval lower bound of estimate of percent of people age 0-17 in poverty' 
			Poverty_Pct_0_17_Upper 		= '90% confidence interval upper bound of estimate of percent of people age 0-17 in poverty' 
			Poverty_5_17_Families 		= 'Estimate of related children age 5-17 in families in poverty' 
			Poverty_5_17_Families_Lower	= '90% confidence interval lower bound of estimate of related children age 5-17 in families in poverty' 
			Poverty_5_17_Families_Upper 	= '90% confidence interval upper bound of estimate of related children age 5-17 in families in poverty' 
			Poverty_5_17_Families 		= 'Estimated percent of related children age 5-17 in families in poverty' 
			Poverty_5_17_Families_Lower 	= '90% confidence interval lower bound of estimate of percent of related children age 5-17 in families in poverty' 
			Poverty_5_17_Families_Upper 	= '90% confidence interval upper bound of estimate of percent of related children age 5-17 in families in poverty' 
			Median_Household_Income 	= 'Estimate of median household income' 
			Median_HH_Income_Lower 		= '90% confidence interval lower bound of estimate of median household income' 
			Median_HH_Income_Upper 		= '90% confidence interval upper bound of estimate of median household income' 
			State_Name 			= 'State or county name' 
			State_Postal 			= 'Two-letter Postal State abbreviation' ;
	;
run;

proc contents data=saipe.SAIPE_2019;
run;


*-------------------------------------------------------------------------------------*
|                                Permanent Data Set                                   |
*-------------------------------------------------------------------------------------*;
data saipe.SAIPE_2019 ;
	set 	y2019 ;
	where	CountyFIPS ne 0 ;
	drop	year ;
run;


*-------------------------------------------------------------------------------------------------------*
| 				Merge in Social Vulnerability Index					|
*-------------------------------------------------------------------------------------------------------*;
proc import datafile="C:\Users\ligrov\OneDrive - SAS\Data for Good\Social Innovations Summit\Raw Data\SVI2018_US_COUNTY.csv"
     	out=svi2018
     	dbms=csv
     	replace;
	guessingrows=1000;
run;

proc contents data=svi2018;
run;


*---------------------------------------------------------------------------------------------------------------*
| 					Data for Good | Data Set						|
*---------------------------------------------------------------------------------------------------------------*;
proc sql;
	create 	table v1 as
	select	a.*,
		b.*
	from 	ipums.employment_2019 as a right join ipums.ACS_County_Labor_Environment as b
	on	a.State_FIPS=b.StateFIP & a.County_FIPS=b.CountyFIPS ;

	create 	table v2 as
	select	a.State_Name, a.State_Postal,
		a.*,
		b.*
	from 	saipe.SAIPE_2019 as a left join svi2018 as b
	on	a.StateFIP=b.StateFIP & a.CountyFIPS=b.CountyFIPS ;

	create 	table Vulnerable_Populations_DataSet as
	select	a.State_Name, a.State_Postal,
		a.*,
		b.*
	from 	v2 as a left join v1 as b
	on	a.StateFIP=b.StateFIP & a.CountyFIPS=b.CountyFIPS ;
quit;


*********************************  Clean Up 'Final' Dataset;
data saipe.Vulnerable_Populations_DataSet ;
	set 	Vulnerable_Populations_DataSet ;

	drop 	LAUS_Code--County_Name_State_Abbreviation ;

	where	poverty ne . & High_Speed_Internet ne .;

**********************************  Label SVI Data ;
	label	E_TOTPOP = "Estimate of Daytime Population in County"
		Socioeconomic = "Socioeconomic Status"
		Household_Comp_Disability = "Household Composition & Disability"
		Minority_Language = "Minority Status and Language"
		Housing_Type_Transportation = "Housing Type & Transportation"
		Overall_SVI_Index = "Overall Social Vulnerability Index" ;
run;


*------------------------------------------------------------------------------------*
|                  		  Univariate Statistics              	             |
*------------------------------------------------------------------------------------*;
ods listing close;
ods pdf file="C:\Users\ligrov\OneDrive - SAS\Data for Good\Social Innovations Summit\Output\Vulnerable Populations Data - Univariate Stats - &sysdate..pdf";


	title1 "SAS | Data and Analytics for Good Journal";	
	title2 "Vulnerable Populations Data | Univariate Stats";
	proc means data=saipe.Vulnerable_Populations_DataSet maxdec=2;
	run;


	title1 "SAS | Data for Good";	
	title2 "Vulnerable Populations Data | Data Dictionary";
	proc contents data=saipe.Vulnerable_Populations_DataSet ;
	run;


ods pdf close;
ods listing;


*----------------------------------------------------------------------------------------*
|		                  	Tables in Excel          	       		 |
*----------------------------------------------------------------------------------------*;

ODS EXCEL FILE="C:\Users\ligrov\OneDrive - SAS\Data and Analytics for Good Journal\Social Innovations Summit\Output\ProcContents.xlsx"
   options (sheet_interval='PAGE') ;

	ods exclude directory;
	ods exclude members;
	proc contents data=saipe.Vulnerable_Populations_DataSet memtype=data;
	run;

ODS EXCEL CLOSE;
