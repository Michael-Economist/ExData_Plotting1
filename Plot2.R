# Plot 2


#### importing and processing data

temp <- read.delim("household_power_consumption.txt", sep=';')

# (2) subset 
str(temp)
temp$Date = as.Date(temp$Date, "%d/%m/%Y")

ds <- filter(temp, Date >= '2007-02-01' & Date <= '2007-02-02')
rm(temp)

# (3) save for future use

datetime <- paste(as.Date(ds$Date), ds$Time)
ds$Datetime <- as.POSIXct(datetime)

ds$Global_active_power <- as.numeric(ds$Global_active_power)
ds$Global_reactive_power <- as.numeric(ds$Global_reactive_power)
ds$Voltage <- as.numeric(ds$Voltage)
ds$Global_intensity <- as.numeric(ds$Global_intensity)
ds$Sub_metering_1 <- as.numeric(ds$Sub_metering_1)
ds$Sub_metering_2 <- as.numeric(ds$Sub_metering_2)
ds$Sub_metering_3 <- as.numeric(ds$Sub_metering_3)



##### Creating the chart

png("plot2.png", width=480, height=480)

plot(ds$Global_active_power~ds$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
