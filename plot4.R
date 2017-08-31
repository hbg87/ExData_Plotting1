## Download and unzip the dataset (if necessary)
if (!file.exists("household_power_consumption.txt")){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, "household_power_consumption.zip")
  unzip("household_power_consumption.zip") 
}

## Load required table
full <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset data from required dates
data <- subset(full, Date  == "1/2/2007" | Date == "2/2/2007")

## Convert the Date and Time variables to Date/Time classes
data$DateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

## Create 2, 2 grid
par(mfrow=c(2,2))

## Plot 1
with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## Plot 2
with(data, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

## Plot 3
with(data, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(data, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))

  ## Add legend to Plot 3
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n", cex = 0.7)

## Plot 4
with(data, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

## Save to png
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()