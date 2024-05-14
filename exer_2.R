#exercise_2

data <- read.csv("D:/PMASDS project/time_series_analysis/tute1.csv", header = TRUE)
data
View(data)

new_data <- ts(data [-1], start = 1981, frequency = 4)
View(new_data)

autoplot(new_data, facets = TRUE)
