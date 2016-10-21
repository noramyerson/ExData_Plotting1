
rm(list=ls())
##Read in the file 
powerData <- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, 
                        header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, 
                        na.strings= "?")

## subset to dates needed using dplyr
subPD <- subset(powerData, (powerData$Date == "1/2/2007" | powerData$Date== "2/2/2007")) 

##Remove large powerData as it is no longer needed
rm(powerData)

##Convert Date from char to date and create DateTime variable
subPD$Date <- as.Date(subPD$Date, format = "%d/%m/%Y")
subPD$DateTime <- as.POSIXct(paste(subPD$Date, subPD$Time))

##Create Plot 2 as a png NOTE: Default settings are 480x480
png("plot2.png")
plot(subPD$DateTime, subPD$Global_active_power, type="l", 
     ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()