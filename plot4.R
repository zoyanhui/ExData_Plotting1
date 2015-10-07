# Read data
exdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')

# subset and pre-process
subexdata <- exdata[exdata$Date %in% c('1/2/2007', '2/2/2007'),]
subexdata$DateTime <- strptime(paste(subexdata$Date, subexdata$Time)
                               , format="%d/%m/%Y %H:%M:%S")

subexdata$Global_active_power <- as.numeric(as.character(subexdata$Global_active_power))
subexdata$Global_reactive_power <- as.numeric(as.character(subexdata$Global_reactive_power))
subexdata$Sub_metering_1 <- as.numeric(as.character(subexdata$Sub_metering_1))
subexdata$Sub_metering_2 <- as.numeric(as.character(subexdata$Sub_metering_2))
subexdata$Sub_metering_3 <- as.numeric(as.character(subexdata$Sub_metering_3))
subexdata$Voltage <- as.numeric(as.character(subexdata$Voltage))

# plot and save
par(mfrow = c(2,2), mar=c(4,5,3,1), oma = c(0, 0, 0, 0), cex.axis = 0.8)
## plot picture (1,1) 
plot(subexdata$DateTime, subexdata$Global_active_power, type='l',
     ylab = "Global Active Power", xlab="")

## plot picture (1,2) 
plot(subexdata$DateTime, subexdata$Voltage, type='l',
     ylab = "Voltage", xlab="datetime")

## plot picture (2,1)
with(subexdata, plot(DateTime, Sub_metering_1, type='n',
                     ylab = "Energy sub metering", xlab=""))
with(subexdata, points(DateTime, Sub_metering_1, col="black", type="l"))
with(subexdata, points(DateTime, Sub_metering_2, col="red", type="l"))
with(subexdata, points(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright", col=c("black", "red", "blue"),
       y.intersp = 0.6, lwd = 1, lty = 1,
       box.lwd = 0, cex=0.7,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot picture (2,2) 
plot(subexdata$DateTime, subexdata$Global_reactive_power, type='l',
     ylab = "Global_reactive_power", xlab="datetime")

## save to file
dev.copy(png, filename="plot4.png", width=480, height=480, units="px")
dev.off()