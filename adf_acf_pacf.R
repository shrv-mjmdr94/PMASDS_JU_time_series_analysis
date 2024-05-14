data("AirPassengers")
print(AirPassengers)

library(tseries)
adf.test(AirPassengers)

library(forecast)
plot.ts(AirPassengers)
acf(AirPassengers)
pacf(AirPassengers)

ggtsdisplay(AirPassengers)

# Box-Jenkins Methodology 
plot.ts(AirPassengers)
adf.test(AirPassengers)
acf(AirPassengers)
pacf(AirPassengers)
ggtsdisplay(AirPassengers)

fit = auto.arima(AirPassengers)

library(lmtest)
library(zoo)

coeftest(fit)
residuals(fit)

checkresiduals(fit)
tsdiag(fit)

ggtsdisplay(fit$residuals)
summary(fit)
fc = forecast(fit, h=10)
fc
plot(fc)
plot.ts(fc$residuals)
s