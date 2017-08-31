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

## Plot
hist(data$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

## Save to png
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
