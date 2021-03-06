## plot4.R

library(ggplot2)
library(graphics)
require(data.table)

## prerequisite example: 
## setwd("C:/Donald/Personal/Coursera/Data Science Specialization/Course4_Exploratory Data Analysis/Week1/Assignment")

energy_usage	   		<- fread("./exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header= TRUE, na.strings=c("?"))
energy_usage_sub		<- subset(energy_usage, Date=="1/2/2007" | Date=="2/2/2007")

rm(energy_usage)

par(mfrow=c(2,2))
#1
with(energy_usage_sub, plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Global_active_power, ylab="Global Active Power", xlab="", type="l"))

#2
with(energy_usage_sub, plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Voltage, ylab="Global Active Power", xlab="datetime",type="l"))


#3
with(energy_usage_sub, plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))

with(energy_usage_sub, lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Sub_metering_1, type="l",  col="black")) 
with(energy_usage_sub, lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Sub_metering_2, type="l",  col="blue")) 
with(energy_usage_sub, lines(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Sub_metering_3, type="l",  col="red")) 

legend("topright",pch="-",col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#4
with(energy_usage_sub, plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"), Global_reactive_power, ylab="Global Reactive Power", xlab="datetime",type="l"))



dev.copy(png,"plot4.png",width=480,height=480, bg="transparent")
dev.off()
