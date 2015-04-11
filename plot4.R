## Coursera Exploratory Data Analysis
## Project 1/Plot 4

## Note, this R program assumes the data for the project has been downloaded
## per the instructions into the working directory.

## Step 1: Read the data set
plot4_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot4_data$Date <- as.Date(plot4_data$Date, format="%d/%m/%Y")

## Step 2: Extract the designated subset
plot4_subset <- subset(plot4_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(plot4_data)

## Step 3: Convert the date data to R date format
date_and_time <- paste(as.Date(plot4_subset$Date), plot4_subset$Time)
plot4_subset$Datetime <- as.POSIXct(date_and_time)

## Step 4: Generate the plot 
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(plot4_subset$Datetime, plot4_subset$Global_active_power, type="l", 
     ylab="Global Active Power", xlab="", col='black')
plot(plot4_subset$Datetime, plot4_subset$Voltage, type="l", 
     ylab="Voltage", xlab="datetime", col='black')
plot(plot4_subset$Datetime, plot4_subset$Sub_metering_1, type="l", 
     ylab="Energy sub metering", xlab="")
lines(plot4_subset$Datetime, plot4_subset$Sub_metering_2,col='Red')
lines(plot4_subset$Datetime, plot4_subset$Sub_metering_3,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(plot4_subset$Datetime, plot4_subset$Global_reactive_power, type="l", 
     ylab="Global_reactive_power",xlab="datetime", col='black')

## Step 5: Close the graphics file
dev.off()