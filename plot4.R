library(data.table)
library(lubridate)

PowConsum <- fread(input = "household_power_consumption.txt")
PowConsum$Date <- as.Date(PowConsum$Date, format = "%d/%m/%Y")
PowConsumDay <- subset(PowConsum, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(PowConsumDay$Date), PowConsumDay$Time)
PowConsumDay$Datetime <- as.POSIXct(datetime)

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(PowConsumDay$Global_active_power ~ PowConsumDay$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot(PowConsumDay$Voltage ~ PowConsumDay$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")

plot(PowConsumDay$Datetime, PowConsumDay$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(PowConsumDay$Datetime, PowConsumDay$Sub_metering_2, col="red")
lines(PowConsumDay$Datetime, PowConsumDay$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1)

plot(PowConsumDay$Global_reactive_power ~ PowConsumDay$Datetime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()