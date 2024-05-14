# sarima

AirPassengers
data("AirPassengers")

library(tseries)
library(forecast)

plot.ts(AirPassengers)
#decom = decompose(AirPassengers)
#plot(decom)

plot(decompose(AirPassengers))

acf(AirPassengers)
pacf(AirPassengers)
ggtsdisplay(AirPassengers)

one_diff = diff(AirPassengers, lag = 12, differences = 1)
plot(one_diff)


ggtsdisplay(one_diff)

two_diff = diff(one_diff)
ggtsdisplay(two_diff)

library(astsa)
library(urca)
library(forecast)

sarima(AirPassengers, p=2, d=1, q=2, P=0, D=1, Q=0, S=12)

library(lmtest)
coeftest(two_diff)
