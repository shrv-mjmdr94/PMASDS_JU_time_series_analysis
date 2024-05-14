library(tidyverse)
library(feasts)

retaildata <- readxl::read_excel("D:/PMASDS project/time_series_analysis/retail.xlsx", skip = 1)

retaildata
myts <- ts(retaildata[,"A3349873A"],
           frequency = 12, start = c(1982, 4))

myts <- as_tsibble(retaildata, index = Date, key = Product)

column_name <- "Sales"

autoplot(myts, column_name) # Plot the time series
ggseasonplot(myts, column_name) # Plot the seasonal pattern
ggsubseriesplot(myts, column_name) # Plot the subseries
gglagplot(myts, column_name)
ggAcf(myts, column_name)
