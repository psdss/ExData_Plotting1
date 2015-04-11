## Coursera Exploratory Data Analysis
## Project 1/Plot 3

## Note, this R program assumes the data for the project has been downloaded
## per the instructions into the working directory.

## Step 1: Read the data set
plot3_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
            nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot3_data$Date <- as.Date(plot3_data$Date, format="%d/%m/%Y")

## Step 2: Extract the designated subset
plot3_subset <- subset(plot3_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(plot3_data)

## Step 3: Convert the date data to R date format
date_and_time <- paste(as.Date(plot3_subset$Date), plot3_subset$Time)
plot3_subset$Datetime <- as.POSIXct(date_and_time)

## Step 4: Generate the plot 
png("plot3.png", width=480, height=480)
plot(plot3_subset$Datetime, plot3_subset$Sub_metering_1, type="l", col='black',
     ylab="Energy sub metering", xlab="")
lines(plot3_subset$Datetime, plot3_subset$Sub_metering_2, col='red')
lines(plot3_subset$Datetime, plot3_subset$Sub_metering_3, col='blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Step 5: Close the graphics file
dev.off()