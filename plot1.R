# Read data
exdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')

# subset and pre-process
subexdata <- exdata[exdata$Date %in% c('1/2/2007', '2/2/2007'),]
subexdata$DateTime <- strptime(paste(subexdata$Date, subexdata$Time)
                              , format="%d/%m/%Y %H:%M:%S")

subexdata$Global_active_power <- as.numeric(as.character(subexdata$Global_active_power))

# plot and save
hist(subexdata$Global_active_power, col="red",
     xlab = "Global Active Power (kilowatts)",  ylab = "Frequency",
     main= 'Global Active Power')
dev.copy(png, filename="plot1.png", width=480, height=480, units="px")
dev.off()