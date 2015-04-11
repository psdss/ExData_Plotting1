## Coursera Exploratory Data Analysis
## Project 1/Plot 1

## Note, this R program assumes the data for the project has been downloaded
## per the instructions into the working directory.

## Step 1: Read the data set
plot1_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot1_data$Date <- as.Date(plot1_data$Date, format="%d/%m/%Y")

## Step 2: Extract the designated subset
plot1_subset <- subset(plot1_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(plot1_data)

## Step 3: Convert the date data to R date format
date_and_time <- paste(as.Date(plot1_subset$Date), plot1_subset$Time)
plot1_subset$Datetime <- as.POSIXct(date_and_time)

## Step 4: Generate the plot 
png("plot1.png", width=480, height=480)
hist(plot1_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Step 5: Close the graphics file
dev.off()