  
#Load data
getwd()
setwd("/home/sonia/Desktop/Workshop")
getwd()
data <- read.csv("6-Exercice World Trends-Data.csv")
data

#check import
head(data)
tail(data)
str(data)
summary(data)

#split the data into 2 data frames: 1 for each year (1960 and 2013)
data1960 <- data[data$Year == 1960,]
data2013 <- data[data$Year == 2013,]

#check row count
nrow(data1960)
nrow(data2013)

#create the additional data frames (1st open the vector file and run it)
add1960 <- data.frame(Code = Country_Code, Life.exp = Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code = Country_Code, Life.exp = Life_Expectancy_At_Birth_2013)

#check summaries
summary(add1960)
summary(add2013)

#merge the pairs of data frames
merged1960 <- merge(data1960, add1960, by.x="Country.Code", by.y="Code")
merged2013 <- merge(data2013, add2013, by.x="Country.Code", by.y="Code")

#check the new merged data frames structures
str(merged1960)
str(merged2013)

#delete columns: as we have a data set per year, we don't need the year column anymore
merged1960$Year <- NULL
merged2013$Year <- NULL

#visualisation
library(ggplot2)

qplot(data=merged1960, x=Fertility.Rate, y=Life.exp, 
      colour=Region, size=I(5), alpha=I(0.6), 
      main="Life Expectancy vs. Fertility (1960)")

qplot(data=merged2013, x=Fertility.Rate, y=Life.exp, 
      colour=Region, size=I(5), alpha=I(0.6), 
      main="Life Expectancy vs. Fertility (2013)")
