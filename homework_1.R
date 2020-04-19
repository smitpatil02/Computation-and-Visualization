# Homework 1
# Smit Patil
# Section 03

# Problem 1-----------------------------------
library(data.table)
roster <- read.csv("roster.csv")
setDT(roster)
attendance <- read.csv("attendance.csv")
setDT(attendance)
roster[, c("lastname", "firstname") := tstrsplit(names, ",", fixed=TRUE)]
rst <- roster[, firstname,lastname][order(lastname)]
table <- rbind(attendance,rst)
attend <- table[, .(Count = .N-1), by = .(firstname,lastname)][order(Count)]
names(attend)[names(attend) == "firstname"] <- "First name"
names(attend)[names(attend) == "lastname"] <- "Last name"
attend

# Problem 2-----------------------------------
library(data.table)
crime <- read.csv("crime.csv")
setDT(crime)
ans <- crime[, .(OFFENSE_CODE_GROUP,DISTRICT)]
options("max.print"=10000)
dcast(ans, OFFENSE_CODE_GROUP ~ DISTRICT)

# Problem 3-----------------------------------
library(data.table)
library(tidyverse)
wine <- read.csv("wine_data.csv")
setDT(wine)
variety <- wine[, .(Count = .N-1), by = .(variety)][order(-Count)]
setDT(variety)
head(variety, 10)
avg_points <- wine[,mean(points), by = country] 
avg_points[order(-V1)]
avg_price <- wine[,mean(na.omit((price))), by = province]
highest_avg_price <- avg_price[order(-V1)]
highest_avg_price[1]
US_avg_price <- wine[, mean(na.omit(price)), by = .(country,province)][order(-country,-V1)]
US_highest_price <- US_highest_price %>% filter(country == "US")
head(US_highest_price, 1)
designation <- wine[, designation]
twenty_year_old <- grep("20 [Yy]ear[Ss]|20-[Yy]ear[Ss]|20-[Yy]ear[Ss]-[Oo]ld|20 [Yy]ear|20-[Yy]ear|20-[Yy]ear-[Oo]ld", designation)
length(twenty_year_old)
