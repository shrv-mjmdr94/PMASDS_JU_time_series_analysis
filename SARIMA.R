####SARIMA model

data("AirPassengers")
print(AirPassengers)

#loading neccessary library
library(tseries)
library(forecast)

#identifying seasonality
plot.ts(AirPassengers)

decom = decompose(AirPassengers)
plot(decom)
# so there exist trend and sesonality

acf(AirPassengers)
pacf(AirPassengers)

ggtsdisplay(AirPassengers)

#taking seasonal differences ; since out plot exist both trend and seasonality
#we will take first difference
s1_diff = diff(AirPassengers, lag = 12, differences = 1)
diff_1 = decompose(s1_diff)
plot(diff_1)
ggtsdisplay(s1_diff)
# after taking first difference there is no seasonality but exist trend
# we have to remove this trend

r1diff = diff(s1_diff)
ggtsdisplay(r1diff)
# from this plot we see there is no trend

#estimate the coefficent of model

library(astsa)
library(urca)
library(forecast)
sarima(AirPassengers, p=2, d=1, q=2, P=0, D=1, Q=0, S=12)

sarima.for(AirPassengers, n.ahead = 36, p=2, d=1, q=2, P=0, D=1, Q=0, S=12)

#fit SARIMA
fit_1 = Arima(AirPassengers, order = c(0,1,0),
              seasonal = c(2,1,1), lambda = "auto",
              include.constant = TRUE)
library(lmtest)
coeftest(fit_1)
checkresiduals(fit_1)
ggtsdisplay(fit_1$residuals)
summary(fit_1)

fit_2 = Arima(AirPassengers, order = c(0,1,0), 
              seasonal = c(2,1,2),
              lambda = "auto",
              include.constant = TRUE)
coef(fit_2)
checkresiduals(fit_2)
ggtsdisplay(fit_2$residuals)
summary(fit_2)

fit3=Arima(AirPassengers,order = c(0,1,0),seasonal = c(2,2,2),lambda = 
             "auto", include.constant = TRUE)
coeftest(fit3)
checkresiduals(fit3)
ggtsdisplay(fit3$residuals)
summary(fit3)
fit4=Arima(AirPassengers,order = c(2,1,1),seasonal = c(0,1,0),lambda = 
             "auto", include.constant = TRUE)
coeftest(fit4)
checkresiduals(fit4)
ggtsdisplay(fit4$residuals)
summary(fit4)

