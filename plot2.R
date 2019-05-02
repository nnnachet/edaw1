library(data.table)
library(lubridate)

PowConsum <- fread(input = "household_power_consumption.txt")
PowConsum$Date <- as.Date(PowConsum$Date, format = "%d/%m/%Y")
PowConsumDay <- subset(PowConsum, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(PowConsumDay$Date), PowConsumDay$Time)
PowConsumDay$Datetime <- as.POSIXct(datetime)

png("plot2.png", width = 480, height = 480)

plot(PowConsumDay$Global_active_power ~ PowConsumDay$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()