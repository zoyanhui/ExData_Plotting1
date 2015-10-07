# Read data
exdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')

# subset and pre-process
subexdata <- exdata[exdata$Date %in% c('1/2/2007', '2/2/2007'),]
subexdata$DateTime <- strptime(paste(subexdata$Date, subexdata$Time)
                               , format="%d/%m/%Y %H:%M:%S")

subexdata$Global_active_power <- as.numeric(as.character(subexdata$Global_active_power))

# plot and save
plot(subexdata$DateTime, subexdata$Global_active_power, type='l',
     ylab = "Global Active Power (kilowatts)", xlab="")
dev.copy(png, filename="plot2.png", width=480, height=480, units="px")
dev.off()