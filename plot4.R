setwd("C:/Users/Loko/Desktop/Coursera/EXPLORATORY")
Sys.setlocale("LC_TIME", "English")
Fiverows <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrow=5)
classes <- sapply(Fiverows, class)
data <- read.table("household_power_consumption.txt",sep=";",colClasses=classes,
skip=grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")), nrow=2880)
names(data) <- names(Fiverows)
data$DT <- paste(data$Date, data$Time)
data$DT <- strptime(data$DT, "%d/%m/%Y %H:%M:%S")

png(file="plot4.png")
par(mfrow=c(2,2))
with(data, plot(DT,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n"))
lines(data$DT, data$Global_active_power)

with(data, plot(DT,Voltage,xlab="",ylab="datetime",type="n"))
with(data, lines(DT,Voltage))

with(data,plot(DT,Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
with(data,lines(DT,Sub_metering_1))
with(data,lines(DT,Sub_metering_2,col="red"))
with(data,lines(DT,Sub_metering_3, col="blue"))
legend("topright",lwd=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.9)

with(data, plot(DT,Global_reactive_power,xlab="datetime",type="n"))
with(data, lines(DT,Global_reactive_power))
dev.off()

