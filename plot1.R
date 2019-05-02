library(data.table)
library(lubridate)

PowConsum <- fread(input = "household_power_consumption.txt")
PowConsum$Date <- as.Date(PowConsum$Date, format = "%d/%m/%Y")
PowConsumDay <- subset(PowConsum, Date >= "2007-02-01" & Date <= "2007-02-02")


PowConsumDay$Global_active_power <- as.numeric((PowConsumDay$Global_active_power))
png("plot1.png", width = 480, height = 480)
hist(PowConsumDay$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
