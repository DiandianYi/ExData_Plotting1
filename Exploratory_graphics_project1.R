#Load the necessary package
library(data.table)

#Load the data. Before this you should download the data, put it in the working directory, and you'd better to decompress it in advance.
getwd()
setwd("C:/Users/Diandian/Documents/self_education/Working-directory")
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE,sep=";")
data$Date <- as.Date(strptime(data$Date,"%d/%m/%Y"))
data$Time <- as.ITime(strptime(data$Time,"%H:%M:%S"))
data_project1 <- data[data$Date=="2007-02-01"|data$Date=="2007-02-02",]
rm(data)
data_project1[,c(3:9)]<- lapply(data_project1[,c(3:9)], function(x) as.numeric(as.character(x)))

#plot1
png("plot1.png",width=480,height=480)
with(data_project1, hist(Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power"))
dev.off()

#plot2
png("plot2.png",width=480,height=480)
with(data_project1, plot(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Global_active_power,type = "l",xlab = " ", ylab = "Global Active Power (kilowatts)"))
dev.off()

#plot3
png("plot3.png",width=480,height=480)
with(data_project1, plot(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Sub_metering_1,type = "l",xlab = " ", ylab = "Energy sub metering"))
with(data_project1,lines(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Sub_metering_2, col="red"))
with(data_project1,lines(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Sub_metering_3, col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1)
dev.off()

#plot4
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(data_project1, plot(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Global_active_power,type = "l",xlab = " ", ylab = "Global Active Power (kilowatts)"))
with(data_project1, plot(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Voltage,type = "l",xlab = "datetime", ylab = "Voltage"))
with(data_project1, plot(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Sub_metering_1,type = "l",xlab = " ", ylab = "Energy sub metering"))
with(data_project1,lines(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Sub_metering_2, col="red"))
with(data_project1,lines(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Sub_metering_3, col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1,bty = "n")
with(data_project1, plot(as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"), Global_reactive_power,type = "l",xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()