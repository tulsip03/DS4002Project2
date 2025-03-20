# Project 2 Arima

#*****************************
# 
# AR, MA & ARIMA Models  
# 
#*****************************


hdi.auto <- auto.arima(e.ts.hdi,approximation=FALSE)
summary(temp.auto)


#*****************************
# 
# Forecasting  
# 
#*****************************
# Forecast with the best model:

# Use the forecast option to forecast the next 6 months of temperature residuals - hdi.auto.forecast
hdi.auto.forecast <- forecast(hdi.auto, h=6)

# plot(hdi.auto.forecast)
# plot(hdi.auto.forecast, xlab = "Time", ylab = "Forecast Values")

# same but with ggplot
autoplot(hdi.auto.forecast) +
  labs(title = "Forecast from ARIMA model for next 6 years", x = "Year", y = "Gender Development Index (GDI)") +
  theme(plot.title=element_text(face="bold", size=14), 
        axis.title.y=element_text(face="bold", size=12), 
        axis.title.x=element_text(face="bold", size=12)) 
  


# Prediction performance of forecasting of the last 6 years between 
# Create test set from hdi data set with last 6 months
# time.hdi.performance <- c(1:(length(hdi.ts)-6))

# The test period in months
next.6years.time <- c((length(time.hdi)-5):(length(time.hdi))) # this shows 28-33 because it starts at 1990 (therefore, 28 is 2018, 33 is 2023, etc.)

# The test data frame
next.6years <- data.frame(time.hdi = next.6years.time, hdi = hdi.ts[next.6years.time])

# Prediction for the next 6 months by hdi.auto:
E_Y.pred <- predict(hdi.trend, newdata=next.6years)
e_t.pred <- forecast(temp.auto, h=6)
next.6years.prediction <- E_Y.pred + e_t.pred$mean

# MSE:
mean((next.6years.prediction-next.6years$hdi)^2)

