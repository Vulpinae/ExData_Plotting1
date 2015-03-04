# set working directory
setwd("~/Coursera/04_Exploratory_Data_Analysis/Project1")

#read datafile
data<-read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#subset on right dates
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

#make Datetime variable
data$Datetime = paste(data$Date, data$Time)
data$Datetime = strptime(data$Datetime, format = "%d/%m/%Y %H:%M:%S")

#Make line graph over time for Global Active Power
png(filename="plot3.png", width=480, height=480)
plot(data$Datetime, data$Sub_metering_1, , type="l", main = "", 
     ylab="Energy sub metering", xlab="") 
lines(data$Datetime, data$Sub_metering_2, type="l", col="red")
lines(data$Datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(1,1,1), col=c("black", "red","blue")) # gives the legend lines the correct color and width
dev.off()

