# load + subset
power_data <- read.table("household_power_consumption.txt",header = T,sep=";", na.strings = "?", dec = ".", stringsAsFactors = F)
names(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_data <- subset(power_data, power_data$Date =="1/2/2007" | power_data$Date =="2/2/2007")

time_date <- paste(subpower_data$Date, subpower_data$Time, sep="")
time <- as.POSIXct(strptime(time_date, "%d/%m/%Y%H:%M:%S"))

dev.copy(png, file = "plot4.png", height = 480, width = 480)
par(mfrow=c(2,2))

plot(time,as.numeric(subpower_data$Global_active_power),xlab="",ylab="Global Active Power", type = "l")
plot(time,as.numeric(subpower_data$Voltage), xlab="Datetime", ylab="Voltage", type="l")
plot(time, as.numeric(subpower_data$Sub_metering_1), xlab="", ylab="Energy sub metering", type = "l")
lines(time, as.numeric(subpower_data$Sub_metering_2), col="red", type="l")
lines(time, as.numeric(subpower_data$Sub_metering_3), col="blue", type="l")
legend("topright", legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd = 3, lty = 1)
plot(time, as.numeric(subpower_data$Global_reactive_power), xlab="Datetime", ylab="Global reactive power", type = "l")
dev.off()