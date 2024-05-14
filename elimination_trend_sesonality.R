data("AirPassengers")
print(AirPassengers)

plot.ts(AirPassengers)
decom_file <- decompose(AirPassengers)
plot(decom_file)

print(decom_file)

library(forecast)
deseason <- seasadj(decom_file)
plot(deseason)
ddeseason <- diff(deseason)
plot.ts(ddeseason)
