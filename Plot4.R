## Reading data from Data set
dataFile <- "E:/PrabhaAcademic/3rd Year 1st SEMESTER 2020/Coursera/cleaningData_Data ScienceCoursera/R_Prac/ExData_Plotting1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subM_1 <- as.numeric(subSetData$Sub_metering_1)
subM_2 <- as.numeric(subSetData$Sub_metering_2)
subM_3 <- as.numeric(subSetData$Sub_metering_3)

## Plotting Function
png("Plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# 1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#3
plot(datetime, subM_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subM_2, type="l", col="red")
lines(datetime, subM_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
