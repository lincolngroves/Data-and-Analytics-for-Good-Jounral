*-------------------------------------------------------------------------------------------------------*
|                            SAS Institute | Data and Anaytics for Good Journal                	        |
|                                     01 - ACS Data - 05.06.2021                                        |
*-------------------------------------------------------------------------------------------------------*;
libname 	ipums "C:\Users\ligrov\OneDrive - SAS\Data for Good\Social Innovations Summit\SAS Data";
options 	orientation=landscape mlogic symbolgen pageno=1 error=3;

title1 		"SAS Institute | Data and Anaytics for Good Journal";
title2 		"Import and Prepare ACS Data | County Level Data Analysis";
footnote 	"File = 01 - ACS Data - 05.06.2021";

filename 	ASCIIDAT "C:\Users\ligrov\OneDrive - SAS\Data and Analytics for Good Journal\Social Innovations Summit\Raw Data\usa_00047.dat";


*-------------------------------------------------------------------------------------*
|                                    Prepare Formats                                  |
*-------------------------------------------------------------------------------------*;
proc format cntlout = ipums.ACS_f;
	value CINETHH_f
	  0 = "N/A (GQ)"
	  1 = "Yes, with a subscription to an Internet Service"
	  2 = "Yes, without a subscription to an Internet Service"
	  3 = "No Internet access at this house, apartment, or mobile home"
	;

	value CIHISPEED_f
	  00 = "N/A (GQ)"
	  10 = "Yes (Cable modem, fiber optic or DSL service)"
	  11 = "Cable modem only"
	  12 = "Fiber optic only"
	  13 = "DSL service only"
	  14 = "Cable modem + Fiber optic"
	  15 = "Cable modem + DSL service"
	  16 = "Fiber optic + DSL service"
	  17 = "Cable modem, Fiber optic and DSL service"
	  20 = "No"
	;

	value SEX_f
	  1 = "Male"
	  2 = "Female"
	;

	value RACE_f
	  1 = "White"
	  2 = "Black/African American/Negro"
	  3 = "American Indian or Alaska Native"
	  4 = "Chinese"
	  5 = "Japanese"
	  6 = "Other Asian or Pacific Islander"
	  7 = "Other race, nec"
	  8 = "Two major races"
	  9 = "Three or more major races"
	;

	value HISPAN_f
	  0 = "Not Hispanic"
	  1 = "Mexican"
	  2 = "Puerto Rican"
	  3 = "Cuban"
	  4 = "Other"
	  9 = "Not Reported"
	;

	value BPL_f
	  001 = "Alabama"
	  002 = "Alaska"
	  004 = "Arizona"
	  005 = "Arkansas"
	  006 = "California"
	  008 = "Colorado"
	  009 = "Connecticut"
	  010 = "Delaware"
	  011 = "District of Columbia"
	  012 = "Florida"
	  013 = "Georgia"
	  015 = "Hawaii"
	  016 = "Idaho"
	  017 = "Illinois"
	  018 = "Indiana"
	  019 = "Iowa"
	  020 = "Kansas"
	  021 = "Kentucky"
	  022 = "Louisiana"
	  023 = "Maine"
	  024 = "Maryland"
	  025 = "Massachusetts"
	  026 = "Michigan"
	  027 = "Minnesota"
	  028 = "Mississippi"
	  029 = "Missouri"
	  030 = "Montana"
	  031 = "Nebraska"
	  032 = "Nevada"
	  033 = "New Hampshire"
	  034 = "New Jersey"
	  035 = "New Mexico"
	  036 = "New York"
	  037 = "North Carolina"
	  038 = "North Dakota"
	  039 = "Ohio"
	  040 = "Oklahoma"
	  041 = "Oregon"
	  042 = "Pennsylvania"
	  044 = "Rhode Island"
	  045 = "South Carolina"
	  046 = "South Dakota"
	  047 = "Tennessee"
	  048 = "Texas"
	  049 = "Utah"
	  050 = "Vermont"
	  051 = "Virginia"
	  053 = "Washington"
	  054 = "West Virginia"
	  055 = "Wisconsin"
	  056 = "Wyoming"
	  090 = "Native American"
	  099 = "United States, ns"
	  100 = "American Samoa"
	  105 = "Guam"
	  110 = "Puerto Rico"
	  115 = "U.S. Virgin Islands"
	  120 = "Other US Possessions"
	  150 = "Canada"
	  155 = "St. Pierre and Miquelon"
	  160 = "Atlantic Islands"
	  199 = "North America, ns"
	  200 = "Mexico"
	  210 = "Central America"
	  250 = "Cuba"
	  260 = "West Indies"
	  299 = "Americas, n.s."
	  300 = "SOUTH AMERICA"
	  400 = "Denmark"
	  401 = "Finland"
	  402 = "Iceland"
	  403 = "Lapland, n.s."
	  404 = "Norway"
	  405 = "Sweden"
	  410 = "England"
	  411 = "Scotland"
	  412 = "Wales"
	  413 = "United Kingdom, ns"
	  414 = "Ireland"
	  419 = "Northern Europe, ns"
	  420 = "Belgium"
	  421 = "France"
	  422 = "Liechtenstein"
	  423 = "Luxembourg"
	  424 = "Monaco"
	  425 = "Netherlands"
	  426 = "Switzerland"
	  429 = "Western Europe, ns"
	  430 = "Albania"
	  431 = "Andorra"
	  432 = "Gibraltar"
	  433 = "Greece"
	  434 = "Italy"
	  435 = "Malta"
	  436 = "Portugal"
	  437 = "San Marino"
	  438 = "Spain"
	  439 = "Vatican City"
	  440 = "Southern Europe, ns"
	  450 = "Austria"
	  451 = "Bulgaria"
	  452 = "Czechoslovakia"
	  453 = "Germany"
	  454 = "Hungary"
	  455 = "Poland"
	  456 = "Romania"
	  457 = "Yugoslavia"
	  458 = "Central Europe, ns"
	  459 = "Eastern Europe, ns"
	  460 = "Estonia"
	  461 = "Latvia"
	  462 = "Lithuania"
	  463 = "Baltic States, ns"
	  465 = "Other USSR/Russia"
	  499 = "Europe, ns"
	  500 = "China"
	  501 = "Japan"
	  502 = "Korea"
	  509 = "East Asia, ns"
	  510 = "Brunei"
	  511 = "Cambodia (Kampuchea)"
	  512 = "Indonesia"
	  513 = "Laos"
	  514 = "Malaysia"
	  515 = "Philippines"
	  516 = "Singapore"
	  517 = "Thailand"
	  518 = "Vietnam"
	  519 = "Southeast Asia, ns"
	  520 = "Afghanistan"
	  521 = "India"
	  522 = "Iran"
	  523 = "Maldives"
	  524 = "Nepal"
	  530 = "Bahrain"
	  531 = "Cyprus"
	  532 = "Iraq"
	  533 = "Iraq/Saudi Arabia"
	  534 = "Israel/Palestine"
	  535 = "Jordan"
	  536 = "Kuwait"
	  537 = "Lebanon"
	  538 = "Oman"
	  539 = "Qatar"
	  540 = "Saudi Arabia"
	  541 = "Syria"
	  542 = "Turkey"
	  543 = "United Arab Emirates"
	  544 = "Yemen Arab Republic (North)"
	  545 = "Yemen, PDR (South)"
	  546 = "Persian Gulf States, n.s."
	  547 = "Middle East, ns"
	  548 = "Southwest Asia, nec/ns"
	  549 = "Asia Minor, ns"
	  550 = "South Asia, nec"
	  599 = "Asia, nec/ns"
	  600 = "AFRICA"
	  700 = "Australia and New Zealand"
	  710 = "Pacific Islands"
	  800 = "Antarctica, ns/nec"
	  900 = "Abroad (unknown) or at sea"
	  950 = "Other n.e.c."
	  999 = "Missing/blank"
	;

	value SCHOOL_f
	  0 = "N/A"
	  1 = "No, not in school"
	  2 = "Yes, in school"
	  9 = "Missing"
	;

	value EDUCD_f
	  000 = "N/A or no schooling"
	  001 = "N/A"
	  002 = "No schooling completed"
	  010 = "Nursery school to grade 4"
	  011 = "Nursery school, preschool"
	  012 = "Kindergarten"
	  013 = "Grade 1, 2, 3, or 4"
	  014 = "Grade 1"
	  015 = "Grade 2"
	  016 = "Grade 3"
	  017 = "Grade 4"
	  020 = "Grade 5, 6, 7, or 8"
	  021 = "Grade 5 or 6"
	  022 = "Grade 5"
	  023 = "Grade 6"
	  024 = "Grade 7 or 8"
	  025 = "Grade 7"
	  026 = "Grade 8"
	  030 = "Grade 9"
	  040 = "Grade 10"
	  050 = "Grade 11"
	  060 = "Grade 12"
	  061 = "12th grade, no diploma"
	  062 = "High school graduate or GED"
	  063 = "Regular high school diploma"
	  064 = "GED or alternative credential"
	  065 = "Some college, but less than 1 year"
	  070 = "1 year of college"
	  071 = "1 or more years of college credit, no degree"
	  080 = "2 years of college"
	  081 = "Associate's degree, type not specified"
	  082 = "Associate's degree, occupational program"
	  083 = "Associate's degree, academic program"
	  090 = "3 years of college"
	  100 = "4 years of college"
	  101 = "Bachelor's degree"
	  110 = "5+ years of college"
	  111 = "6 years of college (6+ in 1960-1970)"
	  112 = "7 years of college"
	  113 = "8+ years of college"
	  114 = "Master's degree"
	  115 = "Professional degree beyond a bachelor's degree"
	  116 = "Doctoral degree"
	  999 = "Missing"
	;

	value EMPSTAT_f
	  0 = "N/A"
	  1 = "Employed"
	  2 = "Unemployed"
	  3 = "Not in labor force"
	;

	value OCC2010_f
	  0010 = "Chief executives and legislators/public administration"
	  0020 = "General and Operations Managers"
	  0030 = "Managers in Marketing, Advertising, and Public Relations"
	  0100 = "Administrative Services Managers"
	  0110 = "Computer and Information Systems Managers"
	  0120 = "Financial Managers"
	  0130 = "Human Resources Managers"
	  0140 = "Industrial Production Managers"
	  0150 = "Purchasing Managers"
	  0160 = "Transportation, Storage, and Distribution Managers"
	  0205 = "Farmers, Ranchers, and Other Agricultural Managers"
	  0220 = "Constructions Managers"
	  0230 = "Education Administrators"
	  0300 = "Architectural and Engineering Managers"
	  0310 = "Food Service and Lodging Managers"
	  0320 = "Funeral Directors"
	  0330 = "Gaming Managers"
	  0350 = "Medical and Health Services Managers"
	  0360 = "Natural Science Managers"
	  0410 = "Property, Real Estate, and Community Association Managers"
	  0420 = "Social and Community Service Managers"
	  0430 = "Managers, nec (including Postmasters)"
	  0500 = "Agents and Business Managers of Artists, Performers, and Athletes"
	  0510 = "Buyers and Purchasing Agents, Farm Products"
	  0520 = "Wholesale and Retail Buyers, Except Farm Products"
	  0530 = "Purchasing Agents, Except Wholesale, Retail, and Farm Products"
	  0540 = "Claims Adjusters, Appraisers, Examiners, and Investigators"
	  0560 = "Compliance Officers, Except Agriculture"
	  0600 = "Cost Estimators"
	  0620 = "Human Resources, Training, and Labor Relations Specialists"
	  0700 = "Logisticians"
	  0710 = "Management Analysts"
	  0720 = "Meeting and Convention Planners"
	  0730 = "Other Business Operations and Management Specialists"
	  0800 = "Accountants and Auditors"
	  0810 = "Appraisers and Assessors of Real Estate"
	  0820 = "Budget Analysts"
	  0830 = "Credit Analysts"
	  0840 = "Financial Analysts"
	  0850 = "Personal Financial Advisors"
	  0860 = "Insurance Underwriters"
	  0900 = "Financial Examiners"
	  0910 = "Credit Counselors and Loan Officers"
	  0930 = "Tax Examiners and Collectors, and Revenue Agents"
	  0940 = "Tax Preparers"
	  0950 = "Financial Specialists, nec"
	  1000 = "Computer Scientists and Systems Analysts/Network systems Analysts/Web Developers"
	  1010 = "Computer Programmers"
	  1020 = "Software Developers, Applications and Systems Software"
	  1050 = "Computer Support Specialists"
	  1060 = "Database Administrators"
	  1100 = "Network and Computer Systems Administrators"
	  1200 = "Actuaries"
	  1220 = "Operations Research Analysts"
	  1230 = "Statisticians"
	  1240 = "Mathematical science occupations, nec"
	  1300 = "Architects, Except Naval"
	  1310 = "Surveyors, Cartographers, and Photogrammetrists"
	  1320 = "Aerospace Engineers"
	  1350 = "Chemical Engineers"
	  1360 = "Civil Engineers"
	  1400 = "Computer Hardware Engineers"
	  1410 = "Electrical and Electronics Engineers"
	  1420 = "Environmental Engineers"
	  1430 = "Industrial Engineers, including Health and Safety"
	  1440 = "Marine Engineers and Naval Architects"
	  1450 = "Materials Engineers"
	  1460 = "Mechanical Engineers"
	  1520 = "Petroleum, mining and geological engineers, including mining safety engineers"
	  1530 = "Engineers, nec"
	  1540 = "Drafters"
	  1550 = "Engineering Technicians, Except Drafters"
	  1560 = "Surveying and Mapping Technicians"
	  1600 = "Agricultural and Food Scientists"
	  1610 = "Biological Scientists"
	  1640 = "Conservation Scientists and Foresters"
	  1650 = "Medical Scientists, and Life Scientists, All Other"
	  1700 = "Astronomers and Physicists"
	  1710 = "Atmospheric and Space Scientists"
	  1720 = "Chemists and Materials Scientists"
	  1740 = "Environmental Scientists and Geoscientists"
	  1760 = "Physical Scientists, nec"
	  1800 = "Economists and market researchers"
	  1820 = "Psychologists"
	  1830 = "Urban and Regional Planners"
	  1840 = "Social Scientists, nec"
	  1900 = "Agricultural and Food Science Technicians"
	  1910 = "Biological Technicians"
	  1920 = "Chemical Technicians"
	  1930 = "Geological and Petroleum Technicians, and Nuclear Technicians"
	  1960 = "Life, Physical, and Social Science Technicians, nec"
	  1980 = "Professional, Research, or Technical Workers, nec"
	  2000 = "Counselors"
	  2010 = "Social Workers"
	  2020 = "Community and Social Service Specialists, nec"
	  2040 = "Clergy"
	  2050 = "Directors, Religious Activities and Education"
	  2060 = "Religious Workers, nec"
	  2100 = "Lawyers, and judges, magistrates, and other judicial workers"
	  2140 = "Paralegals and Legal Assistants"
	  2150 = "Legal Support Workers, nec"
	  2200 = "Postsecondary Teachers"
	  2300 = "Preschool and Kindergarten Teachers"
	  2310 = "Elementary and Middle School Teachers"
	  2320 = "Secondary School Teachers"
	  2330 = "Special Education Teachers"
	  2340 = "Other Teachers and Instructors"
	  2400 = "Archivists, Curators, and Museum Technicians"
	  2430 = "Librarians"
	  2440 = "Library Technicians"
	  2540 = "Teacher Assistants"
	  2550 = "Education, Training, and Library Workers, nec"
	  2600 = "Artists and Related Workers"
	  2630 = "Designers"
	  2700 = "Actors, Producers, and Directors"
	  2720 = "Athletes, Coaches, Umpires, and Related Workers"
	  2740 = "Dancers and Choreographers"
	  2750 = "Musicians, Singers, and Related Workers"
	  2760 = "Entertainers and Performers, Sports and Related Workers, All Other"
	  2800 = "Announcers"
	  2810 = "Editors, News Analysts, Reporters, and Correspondents"
	  2825 = "Public Relations Specialists"
	  2840 = "Technical Writers"
	  2850 = "Writers and Authors"
	  2860 = "Media and Communication Workers, nec"
	  2900 = "Broadcast and Sound Engineering Technicians and Radio Operators, and media and communication equipme"
	         "nt workers, all other"
	  2910 = "Photographers"
	  2920 = "Television, Video, and Motion Picture Camera Operators and Editors"
	  3000 = "Chiropractors"
	  3010 = "Dentists"
	  3030 = "Dieticians and Nutritionists"
	  3040 = "Optometrists"
	  3050 = "Pharmacists"
	  3060 = "Physicians and Surgeons"
	  3110 = "Physician Assistants"
	  3120 = "Podiatrists"
	  3130 = "Registered Nurses"
	  3140 = "Audiologists"
	  3150 = "Occupational Therapists"
	  3160 = "Physical Therapists"
	  3200 = "Radiation Therapists"
	  3210 = "Recreational Therapists"
	  3220 = "Respiratory Therapists"
	  3230 = "Speech Language Pathologists"
	  3240 = "Therapists, nec"
	  3250 = "Veterinarians"
	  3260 = "Health Diagnosing and Treating Practitioners, nec"
	  3300 = "Clinical Laboratory Technologists and Technicians"
	  3310 = "Dental Hygienists"
	  3320 = "Diagnostic Related Technologists and Technicians"
	  3400 = "Emergency Medical Technicians and Paramedics"
	  3410 = "Health Diagnosing and Treating Practitioner Support Technicians"
	  3500 = "Licensed Practical and Licensed Vocational Nurses"
	  3510 = "Medical Records and Health Information Technicians"
	  3520 = "Opticians, Dispensing"
	  3530 = "Health Technologists and Technicians, nec"
	  3540 = "Healthcare Practitioners and Technical Occupations, nec"
	  3600 = "Nursing, Psychiatric, and Home Health Aides"
	  3610 = "Occupational Therapy Assistants and Aides"
	  3620 = "Physical Therapist Assistants and Aides"
	  3630 = "Massage Therapists"
	  3640 = "Dental Assistants"
	  3650 = "Medical Assistants and Other Healthcare Support Occupations, nec"
	  3700 = "First-Line Supervisors of Correctional Officers"
	  3710 = "First-Line Supervisors of Police and Detectives"
	  3720 = "First-Line Supervisors of Fire Fighting and Prevention Workers"
	  3730 = "Supervisors, Protective Service Workers, All Other"
	  3740 = "Firefighters"
	  3750 = "Fire Inspectors"
	  3800 = "Sheriffs, Bailiffs, Correctional Officers, and Jailers"
	  3820 = "Police Officers and Detectives"
	  3900 = "Animal Control"
	  3910 = "Private Detectives and Investigators"
	  3930 = "Security Guards and Gaming Surveillance Officers"
	  3940 = "Crossing Guards"
	  3950 = "Law enforcement workers, nec"
	  4000 = "Chefs and Cooks"
	  4010 = "First-Line Supervisors of Food Preparation and Serving Workers"
	  4030 = "Food Preparation Workers"
	  4040 = "Bartenders"
	  4050 = "Combined Food Preparation and Serving Workers, Including Fast Food"
	  4060 = "Counter Attendant, Cafeteria, Food Concession, and Coffee Shop"
	  4110 = "Waiters and Waitresses"
	  4120 = "Food Servers, Nonrestaurant"
	  4130 = "Food preparation and serving related workers, nec"
	  4140 = "Dishwashers"
	  4150 = "Host and Hostesses, Restaurant, Lounge, and Coffee Shop"
	  4200 = "First-Line Supervisors of Housekeeping and Janitorial Workers"
	  4210 = "First-Line Supervisors of Landscaping, Lawn Service, and Groundskeeping Workers"
	  4220 = "Janitors and Building Cleaners"
	  4230 = "Maids and Housekeeping Cleaners"
	  4240 = "Pest Control Workers"
	  4250 = "Grounds Maintenance Workers"
	  4300 = "First-Line Supervisors of Gaming Workers"
	  4320 = "First-Line Supervisors of Personal Service Workers"
	  4340 = "Animal Trainers"
	  4350 = "Nonfarm Animal Caretakers"
	  4400 = "Gaming Services Workers"
	  4420 = "Ushers, Lobby Attendants, and Ticket Takers"
	  4430 = "Entertainment Attendants and Related Workers, nec"
	  4460 = "Funeral Service Workers and Embalmers"
	  4500 = "Barbers"
	  4510 = "Hairdressers, Hairstylists, and Cosmetologists"
	  4520 = "Personal Appearance Workers, nec"
	  4530 = "Baggage Porters, Bellhops, and Concierges"
	  4540 = "Tour and Travel Guides"
	  4600 = "Childcare Workers"
	  4610 = "Personal Care Aides"
	  4620 = "Recreation and Fitness Workers"
	  4640 = "Residential Advisors"
	  4650 = "Personal Care and Service Workers, All Other"
	  4700 = "First-Line Supervisors of Sales Workers"
	  4720 = "Cashiers"
	  4740 = "Counter and Rental Clerks"
	  4750 = "Parts Salespersons"
	  4760 = "Retail Salespersons"
	  4800 = "Advertising Sales Agents"
	  4810 = "Insurance Sales Agents"
	  4820 = "Securities, Commodities, and Financial Services Sales Agents"
	  4830 = "Travel Agents"
	  4840 = "Sales Representatives, Services, All Other"
	  4850 = "Sales Representatives, Wholesale and Manufacturing"
	  4900 = "Models, Demonstrators, and Product Promoters"
	  4920 = "Real Estate Brokers and Sales Agents"
	  4930 = "Sales Engineers"
	  4940 = "Telemarketers"
	  4950 = "Door-to-Door Sales Workers, News and Street Vendors, and Related Workers"
	  4965 = "Sales and Related Workers, All Other"
	  5000 = "First-Line Supervisors of Office and Administrative Support Workers"
	  5010 = "Switchboard Operators, Including Answering Service"
	  5020 = "Telephone Operators"
	  5030 = "Communications Equipment Operators, All Other"
	  5100 = "Bill and Account Collectors"
	  5110 = "Billing and Posting Clerks"
	  5120 = "Bookkeeping, Accounting, and Auditing Clerks"
	  5130 = "Gaming Cage Workers"
	  5140 = "Payroll and Timekeeping Clerks"
	  5150 = "Procurement Clerks"
	  5160 = "Bank Tellers"
	  5165 = "Financial Clerks, nec"
	  5200 = "Brokerage Clerks"
	  5220 = "Court, Municipal, and License Clerks"
	  5230 = "Credit Authorizers, Checkers, and Clerks"
	  5240 = "Customer Service Representatives"
	  5250 = "Eligibility Interviewers, Government Programs"
	  5260 = "File Clerks"
	  5300 = "Hotel, Motel, and Resort Desk Clerks"
	  5310 = "Interviewers, Except Eligibility and Loan"
	  5320 = "Library Assistants, Clerical"
	  5330 = "Loan Interviewers and Clerks"
	  5340 = "New Account Clerks"
	  5350 = "Correspondent clerks and order clerks"
	  5360 = "Human Resources Assistants, Except Payroll and Timekeeping"
	  5400 = "Receptionists and Information Clerks"
	  5410 = "Reservation and Transportation Ticket Agents and Travel Clerks"
	  5420 = "Information and Record Clerks, All Other"
	  5500 = "Cargo and Freight Agents"
	  5510 = "Couriers and Messengers"
	  5520 = "Dispatchers"
	  5530 = "Meter Readers, Utilities"
	  5540 = "Postal Service Clerks"
	  5550 = "Postal Service Mail Carriers"
	  5560 = "Postal Service Mail Sorters, Processors, and Processing Machine Operators"
	  5600 = "Production, Planning, and Expediting Clerks"
	  5610 = "Shipping, Receiving, and Traffic Clerks"
	  5620 = "Stock Clerks and Order Fillers"
	  5630 = "Weighers, Measurers, Checkers, and Samplers, Recordkeeping"
	  5700 = "Secretaries and Administrative Assistants"
	  5800 = "Computer Operators"
	  5810 = "Data Entry Keyers"
	  5820 = "Word Processors and Typists"
	  5840 = "Insurance Claims and Policy Processing Clerks"
	  5850 = "Mail Clerks and Mail Machine Operators, Except Postal Service"
	  5860 = "Office Clerks, General"
	  5900 = "Office Machine Operators, Except Computer"
	  5910 = "Proofreaders and Copy Markers"
	  5920 = "Statistical Assistants"
	  5940 = "Office and administrative support workers, nec"
	  6005 = "First-Line Supervisors of Farming, Fishing, and Forestry Workers"
	  6010 = "Agricultural Inspectors"
	  6040 = "Graders and Sorters, Agricultural Products"
	  6050 = "Agricultural workers, nec"
	  6100 = "Fishing and hunting workers"
	  6120 = "Forest and Conservation Workers"
	  6130 = "Logging Workers"
	  6200 = "First-Line Supervisors of Construction Trades and Extraction Workers"
	  6210 = "Boilermakers"
	  6220 = "Brickmasons, Blockmasons, and Stonemasons"
	  6230 = "Carpenters"
	  6240 = "Carpet, Floor, and Tile Installers and Finishers"
	  6250 = "Cement Masons, Concrete Finishers, and Terrazzo Workers"
	  6260 = "Construction Laborers"
	  6300 = "Paving, Surfacing, and Tamping Equipment Operators"
	  6320 = "Construction equipment operators except paving, surfacing, and tamping equipment operators"
	  6330 = "Drywall Installers, Ceiling Tile Installers, and Tapers"
	  6355 = "Electricians"
	  6360 = "Glaziers"
	  6400 = "Insulation Workers"
	  6420 = "Painters, Construction and Maintenance"
	  6430 = "Paperhangers"
	  6440 = "Pipelayers, Plumbers, Pipefitters, and Steamfitters"
	  6460 = "Plasterers and Stucco Masons"
	  6500 = "Reinforcing Iron and Rebar Workers"
	  6515 = "Roofers"
	  6520 = "Sheet Metal Workers, metal-working"
	  6530 = "Structural Iron and Steel Workers"
	  6600 = "Helpers, Construction Trades"
	  6660 = "Construction and Building Inspectors"
	  6700 = "Elevator Installers and Repairers"
	  6710 = "Fence Erectors"
	  6720 = "Hazardous Materials Removal Workers"
	  6730 = "Highway Maintenance Workers"
	  6740 = "Rail-Track Laying and Maintenance Equipment Operators"
	  6765 = "Construction workers, nec"
	  6800 = "Derrick, rotary drill, and service unit operators, and roustabouts, oil, gas, and mining"
	  6820 = "Earth Drillers, Except Oil and Gas"
	  6830 = "Explosives Workers, Ordnance Handling Experts, and Blasters"
	  6840 = "Mining Machine Operators"
	  6940 = "Extraction workers, nec"
	  7000 = "First-Line Supervisors of Mechanics, Installers, and Repairers"
	  7010 = "Computer, Automated Teller, and Office Machine Repairers"
	  7020 = "Radio and Telecommunications Equipment Installers and Repairers"
	  7030 = "Avionics Technicians"
	  7040 = "Electric Motor, Power Tool, and Related Repairers"
	  7100 = "Electrical and electronics repairers, transportation equipment, and industrial and utility"
	  7110 = "Electronic Equipment Installers and Repairers, Motor Vehicles"
	  7120 = "Electronic Home Entertainment Equipment Installers and Repairers"
	  7125 = "Electronic Repairs, nec"
	  7130 = "Security and Fire Alarm Systems Installers"
	  7140 = "Aircraft Mechanics and Service Technicians"
	  7150 = "Automotive Body and Related Repairers"
	  7160 = "Automotive Glass Installers and Repairers"
	  7200 = "Automotive Service Technicians and Mechanics"
	  7210 = "Bus and Truck Mechanics and Diesel Engine Specialists"
	  7220 = "Heavy Vehicle and Mobile Equipment Service Technicians and Mechanics"
	  7240 = "Small Engine Mechanics"
	  7260 = "Vehicle and Mobile Equipment Mechanics, Installers, and Repairers, nec"
	  7300 = "Control and Valve Installers and Repairers"
	  7315 = "Heating, Air Conditioning, and Refrigeration Mechanics and Installers"
	  7320 = "Home Appliance Repairers"
	  7330 = "Industrial and Refractory Machinery Mechanics"
	  7340 = "Maintenance and Repair Workers, General"
	  7350 = "Maintenance Workers, Machinery"
	  7360 = "Millwrights"
	  7410 = "Electrical Power-Line Installers and Repairers"
	  7420 = "Telecommunications Line Installers and Repairers"
	  7430 = "Precision Instrument and Equipment Repairers"
	  7510 = "Coin, Vending, and Amusement Machine Servicers and Repairers"
	  7540 = "Locksmiths and Safe Repairers"
	  7550 = "Manufactured Building and Mobile Home Installers"
	  7560 = "Riggers"
	  7610 = "Helpers--Installation, Maintenance, and Repair Workers"
	  7630 = "Other Installation, Maintenance, and Repair Workers Including Wind Turbine Service Technicians, and "
	         "Commercial Divers, and Signal and Track Switch Repairers"
	  7700 = "First-Line Supervisors of Production and Operating Workers"
	  7710 = "Aircraft Structure, Surfaces, Rigging, and Systems Assemblers"
	  7720 = "Electrical, Electronics, and Electromechanical Assemblers"
	  7730 = "Engine and Other Machine Assemblers"
	  7740 = "Structural Metal Fabricators and Fitters"
	  7750 = "Assemblers and Fabricators, nec"
	  7800 = "Bakers"
	  7810 = "Butchers and Other Meat, Poultry, and Fish Processing Workers"
	  7830 = "Food and Tobacco Roasting, Baking, and Drying Machine Operators and Tenders"
	  7840 = "Food Batchmakers"
	  7850 = "Food Cooking Machine Operators and Tenders"
	  7855 = "Food Processing, nec"
	  7900 = "Computer Control Programmers and Operators"
	  7920 = "Extruding and Drawing Machine Setters, Operators, and Tenders, Metal and Plastic"
	  7930 = "Forging Machine Setters, Operators, and Tenders, Metal and Plastic"
	  7940 = "Rolling Machine Setters, Operators, and Tenders, metal and Plastic"
	  7950 = "Cutting, Punching, and Press Machine Setters, Operators, and Tenders, Metal and Plastic"
	  7960 = "Drilling and Boring Machine Tool Setters, Operators, and Tenders, Metal and Plastic"
	  8000 = "Grinding, Lapping, Polishing, and Buffing Machine Tool Setters, Operators, and Tenders, Metal and Pl"
	         "astic"
	  8010 = "Lathe and Turning Machine Tool Setters, Operators, and Tenders, Metal and Plastic"
	  8030 = "Machinists"
	  8040 = "Metal Furnace Operators, Tenders, Pourers, and Casters"
	  8060 = "Model Makers and Patternmakers, Metal and Plastic"
	  8100 = "Molders and Molding Machine Setters, Operators, and Tenders, Metal and Plastic"
	  8130 = "Tool and Die Makers"
	  8140 = "Welding, Soldering, and Brazing Workers"
	  8150 = "Heat Treating Equipment Setters, Operators, and Tenders, Metal and Plastic"
	  8200 = "Plating and Coating Machine Setters, Operators, and Tenders, Metal and Plastic"
	  8210 = "Tool Grinders, Filers, and Sharpeners"
	  8220 = "Metal workers and plastic workers, nec"
	  8230 = "Bookbinders, Printing Machine Operators, and Job Printers"
	  8250 = "Prepress Technicians and Workers"
	  8300 = "Laundry and Dry-Cleaning Workers"
	  8310 = "Pressers, Textile, Garment, and Related Materials"
	  8320 = "Sewing Machine Operators"
	  8330 = "Shoe and Leather Workers and Repairers"
	  8340 = "Shoe Machine Operators and Tenders"
	  8350 = "Tailors, Dressmakers, and Sewers"
	  8400 = "Textile bleaching and dyeing, and cutting machine setters, operators, and tenders"
	  8410 = "Textile Knitting and Weaving Machine Setters, Operators, and Tenders"
	  8420 = "Textile Winding, Twisting, and Drawing Out Machine Setters, Operators, and Tenders"
	  8450 = "Upholsterers"
	  8460 = "Textile, Apparel, and Furnishings workers, nec"
	  8500 = "Cabinetmakers and Bench Carpenters"
	  8510 = "Furniture Finishers"
	  8530 = "Sawing Machine Setters, Operators, and Tenders, Wood"
	  8540 = "Woodworking Machine Setters, Operators, and Tenders, Except Sawing"
	  8550 = "Woodworkers including model makers and patternmakers, nec"
	  8600 = "Power Plant Operators, Distributors, and Dispatchers"
	  8610 = "Stationary Engineers and Boiler Operators"
	  8620 = "Water Wastewater Treatment Plant and System Operators"
	  8630 = "Plant and System Operators, nec"
	  8640 = "Chemical Processing Machine Setters, Operators, and Tenders"
	  8650 = "Crushing, Grinding, Polishing, Mixing, and Blending Workers"
	  8710 = "Cutting Workers"
	  8720 = "Extruding, Forming, Pressing, and Compacting Machine Setters, Operators, and Tenders"
	  8730 = "Furnace, Kiln, Oven, Drier, and Kettle Operators and Tenders"
	  8740 = "Inspectors, Testers, Sorters, Samplers, and Weighers"
	  8750 = "Jewelers and Precious Stone and Metal Workers"
	  8760 = "Medical, Dental, and Ophthalmic Laboratory Technicians"
	  8800 = "Packaging and Filling Machine Operators and Tenders"
	  8810 = "Painting Workers and Dyers"
	  8830 = "Photographic Process Workers and Processing Machine Operators"
	  8850 = "Adhesive Bonding Machine Operators and Tenders"
	  8860 = "Cleaning, Washing, and Metal Pickling Equipment Operators and Tenders"
	  8910 = "Etchers, Engravers, and Lithographers"
	  8920 = "Molders, Shapers, and Casters, Except Metal and Plastic"
	  8930 = "Paper Goods Machine Setters, Operators, and Tenders"
	  8940 = "Tire Builders"
	  8950 = "Helpers--Production Workers"
	  8965 = "Other production workers including semiconductor processors and cooling and freezing equipment opera"
	         "tors"
	  9000 = "Supervisors of Transportation and Material Moving Workers"
	  9030 = "Aircraft Pilots and Flight Engineers"
	  9040 = "Air Traffic Controllers and Airfield Operations Specialists"
	  9050 = "Flight Attendants and Transportation Workers and Attendants"
	  9100 = "Bus and Ambulance Drivers and Attendants"
	  9130 = "Driver/Sales Workers and Truck Drivers"
	  9140 = "Taxi Drivers and Chauffeurs"
	  9150 = "Motor Vehicle Operators, All Other"
	  9200 = "Locomotive Engineers and Operators"
	  9230 = "Railroad Brake, Signal, and Switch Operators"
	  9240 = "Railroad Conductors and Yardmasters"
	  9260 = "Subway, Streetcar, and Other Rail Transportation Workers"
	  9300 = "Sailors and marine oilers, and ship engineers"
	  9310 = "Ship and Boat Captains and Operators"
	  9350 = "Parking Lot Attendants"
	  9360 = "Automotive and Watercraft Service Attendants"
	  9410 = "Transportation Inspectors"
	  9420 = "Transportation workers, nec"
	  9510 = "Crane and Tower Operators"
	  9520 = "Dredge, Excavating, and Loading Machine Operators"
	  9560 = "Conveyor operators and tenders, and hoist and winch operators"
	  9600 = "Industrial Truck and Tractor Operators"
	  9610 = "Cleaners of Vehicles and Equipment"
	  9620 = "Laborers and Freight, Stock, and Material Movers, Hand"
	  9630 = "Machine Feeders and Offbearers"
	  9640 = "Packers and Packagers, Hand"
	  9650 = "Pumping Station Operators"
	  9720 = "Refuse and Recyclable Material Collectors"
	  9750 = "Material moving workers, nec"
	  9800 = "Military Officer Special and Tactical Operations Leaders"
	  9810 = "First-Line Enlisted Military Supervisors"
	  9820 = "Military Enlisted Tactical Operations and Air/Weapons Specialists and Crew Members"
	  9830 = "Military, Rank Not Specified"
	  9920 = "Unemployed, with No Work Experience in the Last 5 Years or Earlier or Never Worked"
	;

run;


********************************************  Note: data are already limited to individuals aged 16-64 who are not enrolled in school ;

*-------------------------------------------------------------------------------------*
|                                Permanent Data Set                                   |
*-------------------------------------------------------------------------------------*;
data IPUMS.ACS_2019 ;

	infile ASCIIDAT pad missover lrecl=64;

	input
	  YEAR        1-4
	  STATEFIP    5-6
	  COUNTYFIP   7-9
	  PUMA        10-14
	  CPUMA0010   15-18
	  CINETHH     19-19
	  CIHISPEED   20-21
	  PERWT       22-31 .2
	  SEX         32-32
	  AGE         33-35
	  RACE        36-36
	  RACED       37-39
	  HISPAN      40-40
	  HISPAND     41-43
	  BPL         44-46
	  BPLD        47-51
	  SCHOOL      52-52
	  EDUC        53-54
	  EDUCD       55-57
	  EMPSTAT     58-58
	  EMPSTATD    59-60
	  OCC2010     61-64
	;

	label
	  YEAR      = "Census year"
	  STATEFIP  = "State (FIPS code)"
	  COUNTYFIP = "County (FIPS code)"
	  PUMA      = "Public Use Microdata Area"
	  CPUMA0010 = "Consistent PUMA, 2000-2010"
	  CINETHH   = "Access to internet"
	  CIHISPEED = "Broadband (high speed) Internet service such as cable, fiber optic, or DSL service"
	  PERWT     = "Person weight"
	  SEX       = "Sex"
	  AGE       = "Age"
	  RACE      = "Race [general version]"
	  RACED     = "Race [detailed version]"
	  HISPAN    = "Hispanic origin [general version]"
	  HISPAND   = "Hispanic origin [detailed version]"
	  BPL       = "Birthplace [general version]"
	  BPLD      = "Birthplace [detailed version]"
	  SCHOOL    = "School attendance"
	  EDUC      = "Educational attainment [general version]"
	  EDUCD     = "Educational attainment [detailed version]"
	  EMPSTAT   = "Employment status [general version]"
	  EMPSTATD  = "Employment status [detailed version]"
	  OCC2010   = "Occupation, 2010 basis"
	;

	format
	  CINETHH    CINETHH_f.
	  CIHISPEED  CIHISPEED_f.
	  SEX        SEX_f.
	  RACE       RACE_f.
	  HISPAN     HISPAN_f.
	  BPL        BPL_f.
	  SCHOOL     SCHOOL_f.
	  EDUCD      EDUCD_f.
	  EMPSTAT    EMPSTAT_f.
	  OCC2010    OCC2010_f.
	;

	format
	  PERWT      11.2
	;

*******************************************************************  Drop Unused Variables ;
	drop RACED HISPAND BPLD EDUC EMPSTATD ;

*******************************************************************  Omit this line if there are multiple data sets ;
	datanum = 1 ;

*******************************************************************  Occupation Code Groupings ;
*******************************************************************  Note: manual corrections appear on the second row ;
	   OCCUP_LTD=. ;
	if OCC2010 in ( 0 9920 ) 																								then 	OCCUP_LTD=0 ;
	if OCC2010 in ( 10 20 40 50 60 100 110 120 130 140 150 160 200 210 220 230 300 310 320 430 330 340 350 360 410 420  
					30 205 ) 																								then 	OCCUP_LTD=1 ;
	if OCC2010 in ( 500 510 520 530 540 560 600 620 700 710 720 730 ) 														then 	OCCUP_LTD=2 ;
	if OCC2010 in ( 800 810 820 830 840 850 860 900 910 930 940 950 ) 														then 	OCCUP_LTD=3 ;
	if OCC2010 in ( 1000 1110 1010 1020 1040 1060 1100 1200 1240 1220 
					1050 1230 )																								then 	OCCUP_LTD=4 ;
	if OCC2010 in ( 1300 1310 1320 1340 1350 1360 1400 1410 1420 1430 1440 1450 1460 1520 1530 1540 1550 1560 )				then 	OCCUP_LTD=5 ;
	if OCC2010 in ( 1600 1610 1640 1650 1700 1710 1720 1740 1760 1800 1810 1820 1860 1840 1900 1910 1920 1930 1940 1960 
					1830 )																									then 	OCCUP_LTD=6 ;
	if OCC2010 in ( 2000 2010 2020 2040 2050 2060 )																			then 	OCCUP_LTD=7 ;
	if OCC2010 in ( 2100 2140 2150 )																						then 	OCCUP_LTD=8 ;
	if OCC2010 in ( 2200 2300 2310 2320 2330 2340 2400 2430 2440 2540 2550 )												then 	OCCUP_LTD=9 ;
	if OCC2010 in ( 2600 2630 2700 2710 2720 2740 2750 2760 2800 2810 2820 2830 2840 2850 2860 2900 2910 2920 
					2825 )																									then 	OCCUP_LTD=10 ;
	if OCC2010 in ( 3000 3010 3030 3040 3050 3060 3110 3120 3130 3140 3150 3160 3200 3210 3220 3230 3240 3250
					3260 3300 3310 3320 3400 3410 3500 3510 3520 3530 3540									  )				then 	OCCUP_LTD=11 ;
	if OCC2010 in ( 3600 3610 3620 3630 3640 3650 )																			then 	OCCUP_LTD=12 ;
	if OCC2010 in ( 3700 3710 3720 3730 3740 3750 3800 3820 3840 3850 3900 3910 3920 3940 3950 
					3930 )																									then 	OCCUP_LTD=13 ;
	if OCC2010 in ( 4000 4010 4020 4030 4040 4050 4060 4110 4120 4130 4140 4150 )											then 	OCCUP_LTD=14 ;
	if OCC2010 in ( 4200 4210 4220 4230 4240 4250 )																			then 	OCCUP_LTD=15 ;
	if OCC2010 in ( 4300 4320 4340 4350 4400 4410 4420 4430 4460 4500 4510 4520 4530 4540 4550 4600 4610 4620 4640 4650 )	then 	OCCUP_LTD=16 ;
	if OCC2010 in ( 4700 4710 4720 4740 4750 4760 4800 4810 4820 4830 4840 4850 4900 4920 4930 4940 4950 
					4965 )																									then 	OCCUP_LTD=17 ;
	if OCC2010 in ( 5000 5010 5020 5030 5100 5110 5120 5130 5140 5150 5160 5200 5350 5220 5230 5240 5250 5260
					5300 5310 5320 5330 5340 5360 5400 5410 5420 5500 5510 5520 5530 5540 5550 5560 5600 5610
					5620 5630 5700 5800 5810 5820 5840 5850 5860 5900 5910 5920  
					5940 5165 )																								then 	OCCUP_LTD=18 ;
	if OCC2010 in ( 6010 6040 6050 6100 6120 6130 
					6005 )																									then 	OCCUP_LTD=19 ;
	if OCC2010 in ( 6200 6210 6220 6230 6240 6250 6260 6300 6320 6330 6360 6400 6420 6430 6440 6460 6500 6520
					6530 6600 6660 6700 6710 6720 6730 6740 
					6515 6355 6765 )																						then 	OCCUP_LTD=20 ;
	if OCC2010 in ( 6800 6820 6830 6840 6940 )																				then 	OCCUP_LTD=20 ;
	if OCC2010 in ( 7000 7010 7020 7030 7040 7100 7110 7120 7130 7140 7150 7160 7200 7210 7220 7240 7260 7300 7320
					7330 7340 7350 7360 7410 7420 7430 7510 7540 7550 7560 7610 
					7315 7630 )																								then 	OCCUP_LTD=22 ;
	if OCC2010 in ( 7700 7710 7720 7730 7740 7750 7800 7810 7830 7840 7850 7900 7920 7930 7940 7950 7960 8000 8010 8220
					8030 8040 8060 8100 8130 8140 8150 8200 8210 8230 8240 8260 8250 8300 8310 8320 8330 8340 8350 8400
					8410 8420 8450 8460 8500 8510 8550 8530 8540 8600 8610 8620 8630 8640 8650 8710 8720 8730 8740 8750
					8760 8800 8810 8830 8850 8860 8910 8920 8930 8940 8950 
					7855 8965 )																								then 	OCCUP_LTD=23 ;
	if OCC2010 in ( 9000 9030 9040 9110 9120 9130 9140 9150 9200 9230 9240 9260 9300 9310 9350 9360 9410 9420 9510 9520
					9560 9600 9610 9620 9630 9640 9650 9720 9750 
					9050 9100 )																								then 	OCCUP_LTD=24 ;

	if OCC2010 in ( 9800 9810 9820 9830 )																					then 	OCCUP_LTD=25 ;


*******************************************************************  Occupation Code Groupings - Narrow ;
			if OCCUP_LTD = 0 							then Occup_LTD2=0 ;
	/*		  0 = "N/A"																				*/
	else 	if OCCUP_LTD in ( 1 2 3 4 5 6 8 10 )		then Occup_LTD2=1 ;
	/*		  1 = "Management, Business, Science, and Arts Occupations"
			  2 = "Business Operations Specialists"
			  3 = "Financial Specialists"
			  4 = "Computer and Mathematical Occupations"
			  5 = "Architecture and Engineering Occupations"
			  6 = "Life, Physical, and Social Science Occupations"
			  8 = "Legal Occupations"
			  10 = "Arts, Design, Entertainment, Sports, and Media Occupations"						*/
	else 	if OCCUP_LTD in ( 7 9 11 12 )				then Occup_LTD2=2 ;
	/*		  7 = "Community and Social Services Occupations"
			  9 = "Education, Training, and Library Occupations"
			  11 = "Healthcare Practitioners and Technical Occupations"
			  12 = "Healthcare Support Occupations"													*/
	else 	if OCCUP_LTD in ( 17 18 )					then Occup_LTD2=3 ;
	/*		  17 = "Sales and Related Occupations"
			  18 = "Office and Administrative Support Occupations"									*/
	else 	if OCCUP_LTD in ( 14 15 16 )				then Occup_LTD2=4 ;
	/*		  14 = "Food Preparation and Serving Occupations"
			  15 = "Building and Grounds Cleaning and Maintenance Occupations"
			  16 = "Personal Care and Service Occupations"											*/
	else 	if OCCUP_LTD in ( 19 20 21 22 23 24 )		then Occup_LTD2=5 ;
	/*		  19 = "Farming, Fishing, and Forestry Occupations"
			  20 = "Construction and Extraction Occupations"
			  21 = "Extraction Workers"						
			  22 = "Installation, Maintenance, and Repair Workers"
			  23 = "Production Occupations"
			  24 = "Transportation and Material Moving Occupations"									*/
	else 	if OCCUP_LTD in ( 13 25 )					then Occup_LTD2=6 ;
	/*		  13 = "Protective Service Occupations"
			  25 = "Military Specific Occupations" ;												*/


********************************************************  Educational Attainment - US Born | Prepare variables for analysis ;
	Educ_Group = ( 18 <= age <= 20 & sex ne . & BPL <= 56 ) ;

	Dropout = ( SCHOOL ne 2 ) * ( educd < 62 ) ;
	perwt2  = ( perwt * educ_group ) ;

	format 		Student_Group $20. ;
	if			HISPAN = 0 and RACE=1		then Student_Group = "White" ;
	else if		HISPAN = 0 and RACE=2		then Student_Group = "Black" ;
	else if 	hispan in ( 1 2 3 4)		then Student_Group = "Hispanic";
	else		Student_Group="Other" ;


********************************************************  Recode variable to integrate legacy code ;
	rename countyfip = countyfips ;


********************************************************  Internet access ;
	Internet_Access = ( CINETHH in (1,2) );
	if CINETHH=0 then Internet_Access = . ;
	perwt3 = ( perwt * ( Internet_Access ne . ) );

	High_Speed_Internet = ( 0 < CIHISPEED < 20 );
	if CIHISPEED=0 then High_Speed_Internet = . ;
	perwt4 = ( perwt * ( High_Speed_Internet ne . ) );
run;


*-------------------------------------------------------------------------------------*
|                    Import PUMA to County Cross-Walk                                 |
*-------------------------------------------------------------------------------------*;

**************************************************************  Note - this file uses 2000 Census Definitions ;
proc import datafile="C:\Users\ligrov\OneDrive - SAS\Data for Good\Social Innovations Summit\Raw Data\County Level to PUMA Crosswalk - 10.11.16.csv"
     out=PUMA
     dbms=csv
     replace;
	 guessingrows=1000;
run;

***************************************************************  Years - Just 2019, for now... ;
data years;
	input Year;
	datalines;
		2019
	;
run;

proc sql;
	create 	table PUMA_X_Years1 as
	select	a.*, b.*
	from	years as a, puma as b 
	order 	by statefip, county, year ;
quit;

**************************************************************  Must update to use 2010 Census PUMA Definitions ;
**************************************************************  http://mcdc.missouri.edu/applications/geocorr2018.html ;
proc import datafile="C:\Users\ligrov\OneDrive - SAS\Data for Good\Social Innovations Summit\Raw Data\MCDC - geocorr2018.csv"
     out=PUMA2
     dbms=csv
     replace;
	 guessingrows=1000;
run;

proc sql;
	create 	table PUMA_X_Years as
	select	a.puma as PUMA00,
			a.*, 
			b.puma12 as PUMA, b.PUMAname
	from	puma_x_years1 as a left join puma2 as b
	on		a.statefip=b.state & a.county=b.county 
	order 	by statefip, county, year ;
quit;

proc sql;
	create 	table PUMA_X_Years2 as
	select	
			a.*, 
			b.puma12, b.PUMAname
	from	puma_x_years1 as a left join puma2 as b
	on		a.statefip=b.state & a.county=b.county 
	order 	by statefip, county, year ;
quit;

data PUMA_X_Years;
	set 	PUMA_X_Years2 ;
	rename 	puma = puma00 ;
	rename 	puma12=puma ;

	label 	PUMA12 	= "PUMA | Revised"
			PUMA 	= "PUMA | Old";
run;


*-------------------------------------------------------------------------------------*
|                      Estimate Statistics - By PUMA and County 		              |
*-------------------------------------------------------------------------------------*;
****************************  Issue: samples in some counties too small for reliable estimates ;

******************************************* Note:
	value EMPSTAT_f
	  0 = "N/A"
	  1 = "Employed"
	  2 = "Unemployed"
	  3 = "Not in labor force"	;

%macro loopy(var1,var2,name2);
	proc sql;
		create 	table ipums.acs_labor_&name2 as 
		select	distinct YEAR, STATEFIP, &var1, &var2,

	/*******************************************************************  Educational Attainment */
				sum( perwt2 * dropout ) 								/ sum( perwt2 ) 									as Dropouts_All 		label="Dropouts - All" 					format percent9.2		,
				sum( perwt2 * dropout * (Student_Group = "White")  ) 	/ sum( perwt2 * (Student_Group = "White") ) 		as Dropouts_White 		label="Dropouts - Whites" 				format percent9.2		,
				sum( perwt2 * dropout * (Student_Group = "Black")  ) 	/ sum( perwt2 * (Student_Group = "Black") ) 		as Dropouts_Black 		label="Dropouts - Blacks" 				format percent9.2		,
				sum( perwt2 * dropout * (Student_Group = "Hispanic")  ) / sum( perwt2 * (Student_Group = "Hispanic") ) 		as Dropouts_Hispanic 	label="Dropouts - Hispanic" 			format percent9.2		,
				sum( perwt2 * dropout * (Student_Group = "Other")  ) 	/ sum( perwt2 * (Student_Group = "Other") ) 		as Dropouts_Other 		label="Dropouts - Others" 				format percent9.2		,

				sum( perwt2 * dropout * (sex=1)	) 						/ sum( perwt2 * (sex=1) ) 							as Dropouts_Men 		label="Dropouts - Men" 					format percent9.2		,
				sum( perwt2 * dropout * (sex=2)	) 						/ sum( perwt2 * (sex=2) ) 							as Dropouts_Women 		label="Dropouts - Women"				format percent9.2		,


	/*******************************************************************  Internet Access */
				sum( perwt3 * Internet_Access ) 							/ sum( perwt3 )					as 		Internet_Access			label="Internet Access in Home"					format percent9.2		,	
				sum( perwt4 * High_Speed_Internet )							/ sum( perwt4 )					as 		High_Speed_Internet		label="High Speed Internet in Home"				format percent9.2		,

	/*******************************************************************  Labor Force Activity */
				sum( PERWT * (sex=1) ) 																		as 		Population_Men 			label="Population | Men"						format comma11.			,
				sum( ( EMPSTAT=1 ) * PERWT * (sex=1) ) / sum( ( EMPSTAT in (1 2) ) * PERWT * (sex=1) ) 		as		Employment_Rate_Men		label="Employment Rate | Men"					format percent9.1 		,
				sum( ( EMPSTAT=3 ) * PERWT * (sex=1) ) / sum( ( EMPSTAT in (1 2 3) ) * PERWT * (sex=1) ) 	as		Not_in_LF_Men			label="Not in Labor Force | Men"				format percent9. 		,

				sum( ( EMPSTAT=3 ) * PERWT * (sex=1) * (25<=age<=54) ) / 
				sum( ( EMPSTAT in (1 2 3) ) * (sex=1) * PERWT * (25<=age<=54) )								as		Men_Not_LF_25_54		label="Men Not in Labor Force | 25-54"			format percent9. 		,

				sum( PERWT * (sex=2) ) 																		as 		Population_Women 		label="Population | Women"						format comma11.			,
				sum( ( EMPSTAT=1 ) * PERWT * (sex=2) ) / sum( ( EMPSTAT in (1 2) ) * PERWT * (sex=2) ) 		as		Employment_Rate_Women	label="Employment Rate"							format percent9.1 		,
				sum( ( EMPSTAT=3 ) * PERWT * (sex=2) ) / sum( ( EMPSTAT in (1 2 3) ) * PERWT * (sex=2) ) 	as		Not_in_LF_Women			label="Not in Labor Force"						format percent9. 		,

				sum( ( EMPSTAT=3 ) * PERWT * (age>=25) ) / sum( ( EMPSTAT in (1 2 3) ) * PERWT * (age>=25)) as		Not_in_LF_25P			label="Not in Labor Force | 25+"				format percent9. 		,

				calculated Population_Men / calculated Population_Women 									as 		Sex_Ratio				label="Sex Ratio - Men to Women"				format best9.2 			,

	/*******************************************************************  By Sector */	
				sum( ( Occup_LTD2=0 ) * PERWT ) / sum( PERWT ) 												as		Occup_Group_0			label="No Occupation"							format percent9.1 		,
				sum( ( Occup_LTD2=1 ) * PERWT ) / sum( PERWT ) 												as		Occup_Group_1			label="White Collar"							format percent9.1 		,
				sum( ( Occup_LTD2=2 ) * PERWT ) / sum( PERWT ) 												as		Occup_Group_2			label="Community, Health and Service"			format percent9.1 		,
				sum( ( Occup_LTD2=3 ) * PERWT ) / sum( PERWT ) 												as		Occup_Group_3			label="Office Sales and Support"				format percent9.1 		,
				sum( ( Occup_LTD2=4 ) * PERWT ) / sum( PERWT ) 												as		Occup_Group_4			label="Service Occupations"						format percent9.1 		,
				sum( ( Occup_LTD2=5 ) * PERWT ) / sum( PERWT ) 												as		Occup_Group_5			label="Blue Collar Laborers"					format percent9.1 		,
				sum( ( Occup_LTD2=6 ) * PERWT ) / sum( PERWT ) 												as		Occup_Group_6			label="Protective Services"						format percent9.1 		,

				sum( ( Occup_LTD2=0 ) * PERWT * (sex=1) ) / sum( PERWT * (sex=1) ) 							as		Occup_Group_0_Men		label="No Occupation | Men"						format percent9.1 		,
				sum( ( Occup_LTD2=1 ) * PERWT * (sex=1) ) / sum( PERWT * (sex=1) ) 							as		Occup_Group_1_Men		label="White Collar | Men"						format percent9.1 		,
				sum( ( Occup_LTD2=2 ) * PERWT * (sex=1) ) / sum( PERWT * (sex=1) ) 							as		Occup_Group_2_Men		label="Community, Health and Service | Men"		format percent9.1 		,
				sum( ( Occup_LTD2=3 ) * PERWT * (sex=1) ) / sum( PERWT * (sex=1) ) 							as		Occup_Group_3_Men		label="Office Sales and Support | Men"			format percent9.1 		,
				sum( ( Occup_LTD2=4 ) * PERWT * (sex=1) ) / sum( PERWT * (sex=1) ) 							as		Occup_Group_4_Men		label="Service Occupations | Men"				format percent9.1 		,
				sum( ( Occup_LTD2=5 ) * PERWT * (sex=1) ) / sum( PERWT * (sex=1) ) 							as		Occup_Group_5_Men		label="Blue Collar Laborers | Men"				format percent9.1 		,
				sum( ( Occup_LTD2=6 ) * PERWT * (sex=1) ) / sum( PERWT * (sex=1) ) 							as		Occup_Group_6_Men		label="Protective Services | Men"				format percent9.1 		,

				sum( ( Occup_LTD2=0 ) * PERWT * (sex=2) ) / sum( PERWT * (sex=2) ) 							as		Occup_Group_0_Women		label="No Occupation | Women"					format percent9.1 		,
				sum( ( Occup_LTD2=1 ) * PERWT * (sex=2) ) / sum( PERWT * (sex=2) ) 							as		Occup_Group_1_Women		label="White Collar | Women"					format percent9.1 		,
				sum( ( Occup_LTD2=2 ) * PERWT * (sex=2) ) / sum( PERWT * (sex=2) ) 							as		Occup_Group_2_Women		label="Community, Health and Service | Women"	format percent9.1 		,
				sum( ( Occup_LTD2=3 ) * PERWT * (sex=2) ) / sum( PERWT * (sex=2) ) 							as		Occup_Group_3_Women		label="Office Sales and Support | Women"		format percent9.1 		,
				sum( ( Occup_LTD2=4 ) * PERWT * (sex=2) ) / sum( PERWT * (sex=2) ) 							as		Occup_Group_4_Women		label="Service Occupations | Women"				format percent9.1 		,
				sum( ( Occup_LTD2=5 ) * PERWT * (sex=2) ) / sum( PERWT * (sex=2) ) 							as		Occup_Group_5_Women		label="Blue Collar Laborers | Women"			format percent9.1 		,
				sum( ( Occup_LTD2=6 ) * PERWT * (sex=2) ) / sum( PERWT * (sex=2) ) 							as		Occup_Group_6_Women		label="Protective Services | Women"				format percent9.1 		

		from 	IPUMS.ACS_2019
		group	by 1,2,3 
		having 	&var1 not in ( . 0 ) 
		order	by 2,3,1 ;
	quit;
%mend;

%loopy(CPUMA0010,PUMA,C_PUMA);
%loopy(PUMA,CPUMA0010,PUMA);
%loopy(COUNTYFIPS,DATANUM,COUNTY);			****************  Use DATANUM simply to tokenize the parameter and allow execution ;


*-------------------------------------------------------------------------------------*
|                               Match Attempt 1 | by County              			  |
*-------------------------------------------------------------------------------------*;
proc sql;
	create 	table x1 as
	select	a.*,
			b.*
	from 	puma_x_years as a left join ipums.acs_labor_county as b
	on		a.year=b.year & a.statefip=b.statefip & a.county=b.countyfips
	order	by a.statefip, a.county, a.year ;
quit;


**************************************************  Pull Out (Legitimately) Missings;
data match1  
	missing1 (drop=COUNTYFIPS--Occup_Group_6_Women);
	set 	x1 ;

	drop	datanum ;
	if 		year in ( 2001 2002 2003 2004 ) | COUNTYFIPS not in ( . 0 )  then output match1 ;
	else	output missing1 ;
run;


*-------------------------------------------------------------------------------------*
|                               Match Attempt 2 | by PUMA               			  |
*-------------------------------------------------------------------------------------*;
proc sql;
	create 	table x2 as
	select	a.*,
			b.*
	from 	missing1 as a left join ipums.acs_labor_puma as b
	on		a.year=b.year & a.statefip=b.statefip & a.puma=b.puma
	order	by a.statefip, a.county, a.year ;
quit;

**************************************************  Pull Out (Legitimately) Missings;
data match2 
	missing2 (drop=cpuma0010--occup_group_6_women);
	set 	x2 ;

	if 		population_men ne . 	then output match2 ;
	else	output missing2 ;
run;


*-------------------------------------------------------------------------------------*
|                       Match Attempt 3 | Use IPUMS Consistent PUMA      			  |
*-------------------------------------------------------------------------------------*;

**************************************************  Create link for stubborn missings ;
proc sql;
	create 	table limited_crosswalk1 as
	select	distinct StateFIP, PUMA, County 
	from 	missing2;

	create 	table limited_crosswalk2 as
	select	distinct STATEFIP, PUMA, CPUMA0010
	from 	ipums.acs_labor_c_puma;

	create 	table limited_crosswalk3 as
	select	distinct a.StateFIP, a.puma,
			b.*
	from 	limited_crosswalk1 as a left join limited_crosswalk2 as b
	on 		a.statefip=b.statefip & a.puma=b.puma ;
quit;


**************************************************  Match ID back to missing and merge ;
proc sql;
	create 	table missing2_exp as
	select	b.CPUMA0010,
			a.*
	from	missing2 as a left join limited_crosswalk3 as b
	on		a.statefip=b.statefip & a.puma=b.puma ;

***********************************************************  Make CPUMA Unique;
	create	table c_puma_ltd as
	select 	distinct YEAR, STATEFIP, CPUMA0010, 
			dropouts_all, dropouts_white, dropouts_black, dropouts_hispanic, dropouts_other, Internet_Access, High_Speed_Internet,
			Population_Men , 	Employment_Rate_Men , 	Not_in_LF_Men , Men_Not_LF_25_54, 
			Population_Women ,	Employment_Rate_Women ,	Not_in_LF_Women ,
			Not_in_LF_25P, Sex_Ratio ,
			Occup_Group_0, Occup_Group_1, Occup_Group_2, Occup_Group_3, Occup_Group_4, Occup_Group_5, Occup_Group_6, 
			Occup_Group_0_Men, Occup_Group_1_Men, Occup_Group_2_Men, Occup_Group_3_Men, Occup_Group_4_Men, Occup_Group_5_Men, Occup_Group_6_Men, 
			Occup_Group_0_Women, Occup_Group_1_Women, Occup_Group_2_Women, Occup_Group_3_Women, Occup_Group_4_Women, Occup_Group_5_Women, Occup_Group_6_Women
	from	ipums.acs_labor_c_puma ;

	create	table match3 as
	select	a.*,
			b.*
	from	missing2_exp as a left join c_puma_ltd as b
	on 		a.year=b.year & a.statefip=b.statefip & a.cpuma0010=b.cpuma0010 ;
quit;


*-------------------------------------------------------------------------------------*
|				                      Create MasterFile   							  |
*-------------------------------------------------------------------------------------*;	
data z1;
	set	match1	(drop=COUNTYFIPS)
		match2	(drop=CPUMA0010)
		match3	(drop=CPUMA0010);
run;

*******************************************  Drop Duplicates (if applicable) ;
proc sql;
	create 	table z2 as
	select	distinct *
	from	z1 ;
quit;


*********************************************************  Issue: PerOfCounty doesnt always add up to 1 | rescale to fit ; 
proc sql;
	create 	table ACS_County_Labor_Environment as
	select	distinct StateFIP, County as CountyFIPS, Year, 

/*******************************************************************  By Sector */
			sum( PerOfCounty * dropouts_all )  			/ sum( PerOfCounty * (  dropouts_all ne . ) ) 			as 		Dropouts_All 			label="Dropouts - All" 							format percent9.2		, 	
			sum( PerOfCounty * dropouts_white )  		/ sum( PerOfCounty * (  dropouts_white ne . ) ) 		as 		Dropouts_White 			label="Dropouts - Whites" 						format percent9.2		,  	
			sum( PerOfCounty * dropouts_black )  		/ sum( PerOfCounty * (  dropouts_black ne . ) ) 		as 		Dropouts_Black 			label="Dropouts - Blacks" 						format percent9.2		,  	
			sum( PerOfCounty * dropouts_hispanic )  	/ sum( PerOfCounty * (  dropouts_hispanic ne . ) ) 		as 		Dropouts_Hispanic 		label="Dropouts - Hispanic" 					format percent9.2		,  	
			sum( PerOfCounty * dropouts_other )  		/ sum( PerOfCounty * (  dropouts_other ne . ) ) 		as 		Dropouts_Other 			label="Dropouts - Others" 						format percent9.2		,  	

			sum( PerOfCounty * dropouts_men )  			/ sum( PerOfCounty * (  dropouts_men ne . ) ) 			as 		Dropouts_Men 			label="Dropouts - Men" 							format percent9.2		, 	
			sum( PerOfCounty * dropouts_women )  		/ sum( PerOfCounty * (  dropouts_women ne . ) ) 		as 		Dropouts_Women 			label="Dropouts - Women" 						format percent9.2		,  	

/*******************************************************************  Internet Access */
			sum( PerOfCounty *  Internet_Access ) 		/ sum( PerOfCounty * ( Internet_Access ne .) )			as 		Internet_Access			label="Internet Access in Home"					format percent9.2		,	
			sum( PerOfCounty *  High_Speed_Internet )	/ sum( PerOfCounty * ( High_Speed_Internet ne .) )		as 		High_Speed_Internet		label="High Speed Internet in Home"				format percent9.2		,


/*******************************************************************  Labor Market */
			sum( PerOfCounty * Employment_Rate_Men )  	/ sum( PerOfCounty * ( Employment_Rate_Men ne . ) ) 	as  	Employment_Rate_Men		label="Employment Rate | Men"					format percent9.1 		,
			sum( PerOfCounty * Not_in_LF_Men )  		/ sum( PerOfCounty * ( Not_in_LF_Men ne . ) )			as		Not_in_LF_Men			label="Not in Labor Force | Men"				format percent9. 		,
			sum( PerOfCounty * Men_Not_LF_25_54 ) 		/ sum( PerOfCounty * ( Men_Not_LF_25_54 ne . ) )		as 		Men_Not_LF_25_54		label="Not in LF | Men 25-54"					format percent9. 		,

			sum( PerOfCounty * Employment_Rate_Women ) 	/ sum( PerOfCounty * ( Employment_Rate_Women ne . ) ) 	as		Employment_Rate_Women	label="Employment Rate"							format percent9.1 		,
			sum( PerOfCounty * Not_in_LF_Women )  		/ sum( PerOfCounty * ( Not_in_LF_Women ne . ) )			as		Not_in_LF_Women			label="Not in Labor Force | Women"				format percent9. 		,

			sum( PerOfCounty * Not_in_LF_25P )  		/ sum( PerOfCounty * ( Not_in_LF_25P ne . ) )			as		Not_in_LF_25P			label="Not in Labor Force | 25+"				format percent9. 		,

			sum( PerOfCounty * Sex_Ratio )  			/ sum( PerOfCounty * ( Sex_Ratio ne . ) )				as 		Sex_Ratio				label="Sex Ratio - Men to Women"				format 6.2 				,

/*******************************************************************  By Sector */	
			sum( PerOfCounty * Occup_Group_0 )  		/ sum( PerOfCounty * ( Occup_Group_0 ne . ) )	 		as		Occup_Group_0			label="No Occupation"							format percent9.1 		,
			sum( PerOfCounty * Occup_Group_1 )  		/ sum( PerOfCounty * ( Occup_Group_1 ne . ) )			as		Occup_Group_1			label="White Collar"							format percent9.1 		,
			sum( PerOfCounty * Occup_Group_2 )  		/ sum( PerOfCounty * ( Occup_Group_2 ne . ) ) 			as		Occup_Group_2			label="Community, Health and Service"			format percent9.1 		,
			sum( PerOfCounty * Occup_Group_3 )  		/ sum( PerOfCounty * ( Occup_Group_3 ne . ) ) 			as		Occup_Group_3			label="Office Sales and Support"				format percent9.1 		,
			sum( PerOfCounty * Occup_Group_4 )  		/ sum( PerOfCounty * ( Occup_Group_4 ne . ) ) 			as		Occup_Group_4			label="Service Occupations"						format percent9.1 		,
			sum( PerOfCounty * Occup_Group_5 )  		/ sum( PerOfCounty * ( Occup_Group_5 ne . ) ) 			as		Occup_Group_5			label="Blue Collar Laborers"					format percent9.1 		,
			sum( PerOfCounty * Occup_Group_6 )  		/ sum( PerOfCounty * ( Occup_Group_6 ne . ) ) 			as		Occup_Group_6			label="Protective Services"						format percent9.1 		,

			sum( PerOfCounty * Occup_Group_0_Men )  	/ sum( PerOfCounty * ( Occup_Group_0_Men ne . ) )		as		Occup_Group_0_Men		label="No Occupation | Men"						format percent9.1 		,
			sum( PerOfCounty * Occup_Group_1_Men )  	/ sum( PerOfCounty * ( Occup_Group_1_Men ne . ) ) 		as		Occup_Group_1_Men		label="White Collar | Men"						format percent9.1 		,
			sum( PerOfCounty * Occup_Group_2_Men )  	/ sum( PerOfCounty * ( Occup_Group_2_Men ne . ) ) 		as		Occup_Group_2_Men		label="Community, Health and Service | Men"		format percent9.1 		,
			sum( PerOfCounty * Occup_Group_3_Men )  	/ sum( PerOfCounty * ( Occup_Group_3_Men ne . ) ) 		as		Occup_Group_3_Men		label="Office Sales and Support | Men"			format percent9.1 		,
			sum( PerOfCounty * Occup_Group_4_Men )  	/ sum( PerOfCounty * ( Occup_Group_4_Men ne . ) ) 		as		Occup_Group_4_Men		label="Service Occupations | Men"				format percent9.1 		,
			sum( PerOfCounty * Occup_Group_5_Men )  	/ sum( PerOfCounty * ( Occup_Group_5_Men ne . ) ) 		as		Occup_Group_5_Men		label="Blue Collar Laborers | Men"				format percent9.1 		,
			sum( PerOfCounty * Occup_Group_6_Men )  	/ sum( PerOfCounty * ( Occup_Group_6_Men ne . ) ) 		as		Occup_Group_6_Men		label="Protective Services | Men"				format percent9.1 		,

			sum( PerOfCounty * Occup_Group_0_Women )  	/ sum( PerOfCounty * ( Occup_Group_0_Women ne . ) )		as		Occup_Group_0_Women		label="No Occupation | Women"					format percent9.1 		,
			sum( PerOfCounty * Occup_Group_1_Women )  	/ sum( PerOfCounty * ( Occup_Group_1_Women ne . ) ) 	as		Occup_Group_1_Women		label="White Collar | Women"					format percent9.1 		,
			sum( PerOfCounty * Occup_Group_2_Women )  	/ sum( PerOfCounty * ( Occup_Group_2_Women ne . ) ) 	as		Occup_Group_2_Women		label="Community, Health and Service | Women"	format percent9.1 		,
			sum( PerOfCounty * Occup_Group_3_Women )  	/ sum( PerOfCounty * ( Occup_Group_3_Women ne . ) ) 	as		Occup_Group_3_Women		label="Office Sales and Support | Women"		format percent9.1 		,
			sum( PerOfCounty * Occup_Group_4_Women )  	/ sum( PerOfCounty * ( Occup_Group_4_Women ne . ) ) 	as		Occup_Group_4_Women		label="Service Occupations | Women"				format percent9.1 		,
			sum( PerOfCounty * Occup_Group_5_Women )  	/ sum( PerOfCounty * ( Occup_Group_5_Women ne . ) ) 	as		Occup_Group_5_Women		label="Blue Collar Laborers | Women"			format percent9.1 		,
			sum( PerOfCounty * Occup_Group_6_Women )  	/ sum( PerOfCounty * ( Occup_Group_6_Women ne . ) ) 	as		Occup_Group_6_Women		label="Protective Services | Women"				format percent9.1 		

	from	z2 
	group	by 1,2,3 ;
quit;


*-----------------------------------------------------------------------------------*
| 									Final Refinements								|
*-----------------------------------------------------------------------------------*;
data ipums.ACS_County_Labor_Environment;
	set ACS_County_Labor_Environment ;

	drop year ;

	if	Dropouts_White 		in (0,1) then Dropouts_White = . ;
	if	Dropouts_Black 		in (0,1) then Dropouts_Black = . ;
	if	Dropouts_Hispanic 	in (0,1) then Dropouts_Hispanic = . ;
	if	Dropouts_Other 		in (0,1) then Dropouts_Other = . ;
run;


proc contents data=ipums.ACS_County_Labor_Environment;
run;
