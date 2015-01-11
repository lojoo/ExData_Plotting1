setwd("C:/Users/Loko/Desktop/Coursera/EXPLORATORY")
Sys.setlocale("LC_TIME", "English")
Fiverows <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrow=5)
classes <- sapply(Fiverows, class)
data <- read.table("household_power_consumption.txt",sep=";",colClasses=classes,
skip=grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")), nrow=2880)
names(data) <- names(Fiverows)
data$DT <- paste(data$Date, data$Time)
data$DT <- strptime(data$DT, "%d/%m/%Y %H:%M:%S")

png(file="plot2.png")
with(data, plot(DT,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="n"))
lines(data$DT, data$Global_active_power)
dev.off()
