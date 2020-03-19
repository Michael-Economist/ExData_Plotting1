# Plot 4


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

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))


plot(ds$Global_active_power ~ ds$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(ds$Voltage ~ ds$Datetime, type = "l", ylab = "Voltage (volt)", xlab = "")

plot(ds$Sub_metering_1 ~ ds$Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(ds$Datetime, ds$Sub_metering_2, col="red")
lines(ds$Datetime, ds$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(ds$Global_reactive_power ~ ds$Datetime, type = "l", ylab = "Global Reactive Power (kilowatts)", xlab = "")


dev.off()

