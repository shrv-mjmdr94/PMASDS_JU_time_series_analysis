library(tseries)
library(ggplot2)
library(forecast)
data = read.csv("C:/Users/shour/Downloads/P2-Movie-Ratings.csv", header = TRUE)
data
summary(data)

library(fpp2)


# erercise of time plot
autoplot(a10)+
  ggtitle("ANTIDIABETIC DRUG SALES")+
  ylab('million')+
  xlab("year")


###########################

ggseasonplot(a10, year.labels = TRUE, year.labels.left = TRUE) +
  ylab("millon") + 
  ggtitle("SEASONAL PLOT:")

ggseasonplot(a10, polar = TRUE) + 
  ylab("millon") +
  ggtitle("Polar seasonal plot")

###########################
#trend and seasonality
data("AirPassengers")
plot.ts(AirPassengers)
###########################
#white Noise
set.seed(30)
y <- ts(rnorm(50))
autoplot(y) + ggtitle("White NOISE")


#time series decomposition
data("AirPassengers")
print(AirPassengers)
class(AirPassengers)
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)
#checking missing values
sum(is.na(AirPassengers))

data = ts(AirPassengers, frequency = 12)
data
plot(data)

#decomposition
decom = decompose(data)
plot(decom)

decom = decompose(data, "multiplicative")
plot(decom)

# Detrend by Diffencing
data
plot(data)
dif_1 = diff(data)
dif_1
plot(dif_1)


# Detrend by model fitting
library(lmtest)
data = ts(AirPassengers, frequency = 12)
plot(data)
trend = lm(data~c(1:length(data)))
trend
plot(trend)
detrend = residuals(trend)
plot.ts(detrend)
