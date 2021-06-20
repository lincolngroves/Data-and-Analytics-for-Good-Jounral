*-------------------------------------------------------------------------------------------------------*
|                         	 SAS Institute | Data and Analytics for Good Journal                    |
|                               00 - Employment Data Import - 05.06.2021                                |
*-------------------------------------------------------------------------------------------------------*;
libname 	county "C:\Users\ligrov\OneDrive - SAS\Data for Good\Social Innovations Summit\SAS Data";
options 	orientation=landscape mlogic symbolgen pageno=1 error=3;

title1 		"SAS Institute | Data and Anaytics for Good Journal";
title2 		"Country Level Data Import";
footnote 	"File = 00 - Employment Data Import - 05.06.2021";

******** 	SOURCE:  BLS, LAUS ;
******** 	Note: Data from https://www.bls.gov/lau/ , https://www.bls.gov/lau/#cntyaa ;

*-------------------------------------------------------------------------------------*
|                                        Employment Data                              |
*-------------------------------------------------------------------------------------*;
proc import datafile="C:\Users\ligrov\OneDrive - SAS\Data for Good\Social Innovations Summit\Raw Data\Remix\LFP Emp Unemp counties 2019.csv"
     out=y_2019
     dbms=csv
     replace;
run;


*************************************************  Clean Variable Names ;
proc sql;
	create 	table county.Employment_2019 as
	select	LAUS_Code, State_FIPS, County_FIPS, 
			County_Name_State_Abbreviation label="County, State",
			Labor_Force					as Labor_Force 				format comma11. 		label="Labor Force | 2019" ,
			Employed					as Employed 				format comma11. 		label="Employed | 2019" ,
			Unemployed				 	as Unemployed 				format comma11. 		label="Unemployed | 2019" ,
			Unemployment_Rate____/100	as Unemployment_Rate		format percent9.1		label="Unemployment Rate | 2019"
	from 	y_2019
	order	by 1,2,3,4,5;
quit;

proc means data=county.Employment_2019;
run;
