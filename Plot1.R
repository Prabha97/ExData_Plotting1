## Reading data from Data set
dataFile <- "E:/PrabhaAcademic/3rd Year 1st SEMESTER 2020/Coursera/cleaningData_Data ScienceCoursera/R_Prac/ExData_Plotting1/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting 
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Basic plot function
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
