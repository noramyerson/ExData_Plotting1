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

##create plot PNG 
png("plot4.png")
par(mfcol=c(2,2))

##Plot1
plot(subPD$DateTime, subPD$Global_active_power, type="l", ylab= "Global Active Power", xlab="")

##plot 2
plot(subPD$DateTime, subPD$Sub_metering_1, type="l", 
     ylab= "Energy sub metering", xlab="")
lines(subPD$DateTime, subPD$Sub_metering_2,type = "l", col = "red")
lines(subPD$DateTime, subPD$Sub_metering_3,type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty = 'n')
##plot 3
plot(subPD$DateTime, subPD$Voltage, type = "l", ylab = "Voltage",xlab= "datetime")

##plot 4
plot(subPD$DateTime, subPD$Global_reactive_power, type = "l", xlab= "datetime")
dev.off()



