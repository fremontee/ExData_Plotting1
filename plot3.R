## plot3.R

library(ggplot2)
library(graphics)
require(data.table)

## prerequisite example: 
## setwd("C:/Donald/Personal/Coursera/Data Science Specialization/Course4_Exploratory Data Analysis/Week1/Assignment")

energy_usage	   		<- fread("./exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header= TRUE, na.strings=c("?"))
energy_usage_sub		<- subset(energy_usage, Date=="1/2/2007" | Date=="2/2/2007")

rm(energy_usage)

with(energy_usage_sub, plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))

with(energy_usage_sub, lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Sub_metering_1, type="l",  col="black")) 
with(energy_usage_sub, lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Sub_metering_2, type="l",  col="red")) 
with(energy_usage_sub, lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Sub_metering_3, type="l",  col="blue")) 

legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,"plot3.png",width=720,height=720, bg="transparent")
dev.off()
