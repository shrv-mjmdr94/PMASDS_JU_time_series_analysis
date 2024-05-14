library(tseries)
library(forecast)

data("AirPassengers")
plot(AirPassengers)

# acf and pacf plot
plot.ts(AirPassengers)
acf(AirPassengers)
pacf(AirPassengers) #partial ACF

# ADF 

data = series.values
