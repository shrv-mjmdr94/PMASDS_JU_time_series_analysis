#exercise_4 & 5

library(fpp2)
goog

autoplot(goog) +
  ggtitle("Daily closing stock prices of Google Inc.") +
  xlab("Time") +
  ylab("Price(Unit: US$)")


ggseasonplot(writing)
ggsubseriesplot(writing)
# The sales amount of paper falls down in August annually

ggseasonplot(fancy)
ggsubseriesplot(fancy)
# In December, 1992 the monthly sales for a souvenir shop increased dramatically 
# compared to the same month of the last year

ggseasonplot(a10)
ggsubseriesplot(a10)
# The amount of antidiabetes monthly scripts falls down in February annually

ggseasonplot(h02)
ggsubseriesplot(h02)
# The amount of corticosteroid monthly scripts also falls down in February annually

