# set working directory
setwd("~/Coursera/04_Exploratory_Data_Analysis/Project1")

#read datafile
data<-read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#subset on right dates
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

#make Datetime variable
data$Datetime = paste(data$Date, data$Time)
data$Datetime = strptime(data$Datetime, format = "%d/%m/%Y %H:%M:%S")


#Make 2 x 2 graphs
png(filename="plot4.png", width=480, height=480)

# set parameters for the 2 by 2 plots 
par(mfrow = c(2, 2), mar = c(4, 4, 4, 2), oma = c(2, 0, 0, 0))

# plot 1 
plot(data$Datetime, data$Global_active_power, , type="l", main = "", 
     ylab="Global Active Power", xlab="") 

# plot 2
plot(data$Datetime, data$Voltage, , type="l", main = "", 
     ylab="Voltage", xlab="datetime") 

# plot 3
plot(data$Datetime, data$Sub_metering_1, , type="l", main = "", 
     ylab="Energy sub metering", xlab="") 
lines(data$Datetime, data$Sub_metering_2, type="l", col="red")
lines(data$Datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(1,1,1), col=c("black", "red","blue"), # gives the legend lines the correct color and width
       bty = "n") # no border around legend
# plot 4
plot(data$Datetime, data$Global_reactive_power, , type="l", main = "", 
     ylab="Global_reactive_power", xlab="datetime") 

dev.off()

