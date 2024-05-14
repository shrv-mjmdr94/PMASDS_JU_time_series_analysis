# reading the file
data = read.csv("C:/Users/shour/Downloads/Inflation - Inflation.csv")

print(data)

# convert data into time series data
library(zoo)
ts_data <- read.zoo(data)
ts_data

# checking the data stationary or not
library(tseries)
adf.test(ts_data)

d1 = diff(ts_data)
print(d1)

adf.test(d1)
d2 = diff(d1)
adf.test(d2)

# finding the best fitted model
fit_data = Arima(d2, order = c(2,2,0))

# forcasting
library(forecast)
fc_data = forecast(fit_data, h = 10)
plot(fc_data)
# plotted the focasted data
plot.ts(d2)
acf(d2)
pacf(d2)
ggtsdisplay(d2)
