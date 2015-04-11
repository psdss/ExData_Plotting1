## Coursera Exploratory Data Analysis
## Project 1/Plot 2

## Note, this R program assumes the data for the project has been downloaded
## per the instructions into the working directory.

## Step 1: Read the data set
plot2_data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
            nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
plot2_data$Date <- as.Date(plot2_data$Date, format="%d/%m/%Y")

## Step 2: Extract the designated subset
plot2_subset <- subset(plot2_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(plot2_data)

## Step 3: Convert the date data to R date format
date_and_time <- paste(as.Date(plot2_subset$Date), plot2_subset$Time)
plot2_subset$Datetime <- as.POSIXct(date_and_time)

## Step 4: Generate the plot 
png("plot2.png", width=480, height=480)
plot(plot2_subset$Global_active_power~plot2_subset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="", col='black')

## Step 5: Close the graphics file
dev.off()