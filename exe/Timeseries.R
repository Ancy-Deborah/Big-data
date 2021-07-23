library("forecast")
library("TTR")
AirPassengers
data<-AirPassengers
str(data)

#ADDITIVE MODEL
plot.ts(data)
class(data)

#DECOMPOSE THE DATA
tms<-decompose(data)
tms$type
tms$seasonal
tms$trend
plot(tms)

#REMOVE SEASONAL DATA if needed
withoutseasonal<-data-tms$seasonal
plot(withoutseasonal)

#FORECAST for NEXT YEAR
forecast_data<-HoltWinters(data,beta = FALSE,gamma = FALSE)
forecast_data
forecast_data$fitted
forecast_data$SSE
plot(forecast_data)

forecasts <-forecast:::forecast.HoltWinters(forecast_data, h=12)
forecasts
plot(forecasts)
