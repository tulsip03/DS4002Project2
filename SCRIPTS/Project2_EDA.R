#Project2_EDA

library(mtsdi)
library(forecast)
library(ggplot2)
library(lubridate)
library(tidyverse)
library(ggfortify)
library(ggpubr)
library(tseries)
library(dplyr)

sourcedir <- "/Users/catherinenguyen/Downloads/DS 4002/Project 2"
datadir <- "/Users/catherinenguyen/Downloads/DS 4002/Project 2"

setwd(datadir)
hdi <- read.table('hdi_clean',header=T,sep=',')
setwd(sourcedir)

#### EDA SECTION ####
# EDA PLOT 1
# columns needed: country, hdi_#, le_#, mys_#, eys_#, gnipc_#, gdi_#
eda1 <- hdi %>% filter(country == "United States") %>%
  dplyr::select(hdi_1990, hdi_1991,hdi_1992,hdi_1993,hdi_1994,hdi_1995,hdi_1996,hdi_1997,hdi_1998,hdi_1999,hdi_2000, # hdi
                hdi_2001,hdi_2002, hdi_2003,hdi_2004,hdi_2005,hdi_2006,hdi_2007,hdi_2008,hdi_2009,hdi_2010,
                hdi_2011,hdi_2012,hdi_2013,hdi_2014,hdi_2015,hdi_2016,hdi_2017,hdi_2018,hdi_2019,hdi_2020,hdi_2021,hdi_2022,
                gdi_1990, gdi_1991,gdi_1992,gdi_1993,gdi_1994,gdi_1995,gdi_1996,gdi_1997,gdi_1998,gdi_1999,gdi_2000, # gdi
                gdi_2001,gdi_2002, gdi_2003,gdi_2004,gdi_2005,gdi_2006,gdi_2007, gdi_2008,gdi_2009,gdi_2010,
                gdi_2011,gdi_2012,gdi_2013,gdi_2014,gdi_2015,gdi_2016,gdi_2017,gdi_2018,gdi_2019,gdi_2020,gdi_2021,gdi_2022)
eda1

# make new df for plot 2
first_10_columns <- eda1[, 1:33]
last_10_columns <- eda1[, 34:66]
eda1_df <- data.frame(hdi_values = as.vector(t(first_10_columns)))
eda1_df$gdi_values <- as.vector(t(last_10_columns))
eda1_df$year <- as.vector(1990:2022)
print(eda1_df)

# PLOT 2
q1_plot <- ggplot(eda1_df) + 
  geom_point(aes(x = year, y = hdi_values, color = "HDI")) +  
  geom_point(aes(x = year, y = gdi_values, color = "GDI")) +  
  labs(title = "HDI and GDI between 1990 - 2022 in the United States",
       x = "Year", y = "Index Value") +
  labs(color = "Index Type") +
  scale_color_manual(values = c("blue", "red")) + 
  theme(plot.title = element_text(hjust = 0.5)) 
q1_plot



############


# EDA PLOT 2
# columns needed: country, hdi_#, le_#, mys_#, eys_#, gnipc_#, gdi_#

eda2 <- hdi %>% filter(country == "Cambodia") %>%
  dplyr::select(hdi_1990, hdi_1991,hdi_1992,hdi_1993,hdi_1994,hdi_1995,hdi_1996,hdi_1997,hdi_1998,hdi_1999,hdi_2000, # hdi
                hdi_2001,hdi_2002, hdi_2003,hdi_2004,hdi_2005,hdi_2006,hdi_2007,hdi_2008,hdi_2009,hdi_2010,
                hdi_2011,hdi_2012,hdi_2013,hdi_2014,hdi_2015,hdi_2016,hdi_2017,hdi_2018,hdi_2019,hdi_2020,hdi_2021,hdi_2022,
                gdi_1990, gdi_1991,gdi_1992,gdi_1993,gdi_1994,gdi_1995,gdi_1996,gdi_1997,gdi_1998,gdi_1999,gdi_2000, # gdi
                gdi_2001,gdi_2002, gdi_2003,gdi_2004,gdi_2005,gdi_2006,gdi_2007, gdi_2008,gdi_2009,gdi_2010,
                gdi_2011,gdi_2012,gdi_2013,gdi_2014,gdi_2015,gdi_2016,gdi_2017,gdi_2018,gdi_2019,gdi_2020,gdi_2021,gdi_2022)
eda2

# make new df for plot 2
first_10_columns <- eda2[, 1:33]
last_10_columns <- eda2[, 34:66]
eda2_df <- data.frame(hdi_values = as.vector(t(first_10_columns)))
eda2_df$gdi_values <- as.vector(t(last_10_columns))
eda2_df$year <- as.vector(1990:2022)
print(eda2_df)

# PLOT 2
q2_plot <- ggplot(eda2_df) + 
  geom_point(aes(x = year, y = hdi_values, color = "HDI")) +  
  geom_point(aes(x = year, y = gdi_values, color = "GDI")) +  
  labs(title = "HDI and GDI between 1990 - 2022 in Cambodia",
       x = "Year", y = "Index Value") +
  labs(color = "Index Type") +
  scale_color_manual(values = c("blue", "red")) + 
  theme(plot.title = element_text(hjust = 0.5)) 
q2_plot



#*****************************
# 
#### ANALYSIS SECTION #### 
# 
#*****************************
#### ANALYSIS SECTION ####
US_hdi <- eda1[, 1:33] # take hdi values only, not gdi

# Transpose the dataframe
US_hdi <- as.data.frame(t(US_hdi))

# Optionally, rename the column
colnames(US_hdi) <- "US_hdi_values"

# for the United States:
US.hdi <- US_hdi$US_hdi_values

##Use the ts() command to get a time series of US.hdi
hdi.ts<-ts(US.hdi)


#*****************************
# 
# Temp Linear Models
# Trend and Seasonality  
# 
#*****************************
# Create a new variable time.hdi which contains the index of the years

time.hdi <- c(1:(length(hdi.ts)))

# Get a linear model of hdi vs. the index of the year and the seasonality
hdi.trend <- lm(hdi.ts[time.hdi]~time.hdi)
hdi.trend.seasonal<-lm(hdi.ts[time.hdi]~time.hdi + sin(2*pi*time.hdi/12) + cos(2*pi*time.hdi/12))

# Use the summary() command on hdi.trend.seasonal,
# Is time significant in predicting temperature? How about seasonality?
summary(hdi.trend) # all terms are significant!
summary(hdi.trend.seasonal) # some terms significant (not seasonal)!

#Get the residuals from the hdi.trend model above and store in e.ts.hdi:

e.ts.hdi<-ts(hdi.trend$residuals) # take residuals, convert to time series

