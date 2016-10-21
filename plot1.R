##Assumes document is in Working Directory and user has data.table and dplyrpackage
library(data.table)
library(dplyr)

##Read in the file and convert date to Date type of Data
powerData <- fread("household_power_consumption.txt",na.strings = "?")
powerData[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

## subset to dates needed using dplyr
subPD <- filter(powerData, DateTime >= as.Date("2007-02-01"), 
                    DateTime < as.Date("2007-02-03"))

##remove large original set to free up space
rm(powerData)

##Create Plot 1 as a png NOTE: Default settings are 480x480
png('plot1.png')
hist(subPD$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()