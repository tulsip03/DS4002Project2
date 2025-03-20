# DS4002Project2

## Section 1: Software and Platforms
Software: We used Stata to clean our dataset and take out any unnecessary or redundant columns. Then we used R Studio write the .dta file created by Stata into a .csv file that would be easier to use in R when writing code to create our visualizations. 
Packages used: We used ggplot2, dyplr, and tidyverse to create our EDA plots. We also used mtsdii, forecast, lubridate, ggfortify, ggpubr, and tseries to conduct our cleaning and prediction analysis. 
Platform: All members used Macs



## Section 2: Map of Our Documentation 
This repository contains:
* LICENSE
* README.MD
* REFERENCES File
* DATA Folder
  * Raw data for HDI and GDI
  * Cleaned HDI and GDI data from 2000-2023
* SCRIPTS
  *  Stata cleaning script
  *  R cleaning script
  *  Analysis/Visualization script
* OUTPUT
  * Data dictionary, EDA Plots, Analysis Results and Final Plots

## Section 3: Instructions for Reproducing Our Results
1. Download raw data in the DATA folder. Data file is called "HDR23-24_Composite_indices_complete_time_series.csv".
2. To clean data, open and run "1_hdi_cleaning_code.do" in SCRIPTS folder. Stata was used to clean data in this file (if Stata is not available to student, see step #4 for cleaned code). This code will produce a .dta file but needs to be converted to .csv for analysis in R.
3. To convert to .csv run the "2_cleaning_hdi.R" file in the SCRIPTS folder. The fully cleaned data can also be found in the DATA folder called "hdi_clean".
4. Using R, to create EDA plots, download and run "3_Project2_EDA.R" in the SCRIPTS folder.
* Run the three EDA plots.
5. To run forecasting predictions and ARIMA analysis, download and run the "4_Project2_Arima.R" file in the SCRIPTS folder.
* For this section, make sure to import "hdi_clean" data file for analysis.
* Run "3_Project2_EDA.R" to make sure you have all the correct variables loaded for analysis.
