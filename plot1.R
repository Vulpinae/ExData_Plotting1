# set working directory
setwd("~/Coursera/04_Exploratory_Data_Analysis/Project1")

#read datafile
data<-read.csv("household_power_consumption.txt", sep=";", na.strings="?")

#subset on right dates
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

#make Datetime variable
data$Datetime = paste(data$Date, data$Time)
data$Datetime = strptime(data$Datetime, format = "%d/%m/%Y %H:%M:%S")

#Make histogram for Global Active Power
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylim= c(0,1200))
dev.off()
