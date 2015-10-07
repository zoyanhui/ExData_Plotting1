# Read data
exdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')

# subset and pre-process
subexdata <- exdata[exdata$Date %in% c('1/2/2007', '2/2/2007'),]
subexdata$DateTime <- strptime(paste(subexdata$Date, subexdata$Time)
                               , format="%d/%m/%Y %H:%M:%S")

subexdata$Global_active_power <- as.numeric(as.character(subexdata$Global_active_power))
subexdata$Sub_metering_1 <- as.numeric(as.character(subexdata$Sub_metering_1))
subexdata$Sub_metering_2 <- as.numeric(as.character(subexdata$Sub_metering_2))
subexdata$Sub_metering_3 <- as.numeric(as.character(subexdata$Sub_metering_3))

# plot and save
with(subexdata, plot(DateTime, Sub_metering_1, type='n',
     ylab = "Energy sub metering", xlab=""))
with(subexdata, points(DateTime, Sub_metering_1, col="black", type="l"))
with(subexdata, points(DateTime, Sub_metering_2, col="red", type="l"))
with(subexdata, points(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright", lwd=1, col=c("black", "red", "blue"),
       text.width = strwidth("Sub_metering_1"),
       xjust = 1, yjust = 1, y.intersp = 0.6,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, filename="plot3.png", width=480, height=480, units="px")
dev.off()