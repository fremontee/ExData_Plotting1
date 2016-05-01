## plot2.R

library(ggplot2)
library(graphics)
require(data.table)

## prerequisite example: 
## setwd("C:/Donald/Personal/Coursera/Data Science Specialization/Course4_Exploratory Data Analysis/Week1/Assignment")

energy_usage	   		<- fread("./exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header= TRUE, na.strings=c("?"))
energy_usage_sub		<- subset(energy_usage, Date=="1/2/2007" | Date=="2/2/2007")

rm(energy_usage)

with(energy_usage_sub, plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")) 

dev.copy(png,"plot2.png",width=480,height=480, bg="transparent")
dev.off()
