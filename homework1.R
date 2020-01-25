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
avg_points <- wine[,mean(points), by = country] 
avg_points
avg_price <- wine[,mean(na.omit((price))), by = province]
a <- avg_price[order(-V1)]
a[1]
US_avg_price <- wine[, mean(na.omit(price)), by = .(country,province)]
b <- US_avg_price[order(-V1,country)]
b[5]
tab <- wine[,designation]
g <- grep("20 [Yy]ear[Ss]|20-[Yy]ear[Ss]|20-[Yy]ear[Ss]-[Oo]ld|20 [Yy]ear|20-[Yy]ear|20-[Yy]ear-[Oo]ld", tab)
length(g)
