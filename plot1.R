# load + subset
power_data <- read.table("household_power_consumption.txt",header = T, skip=1,sep=";", na.strings = "?")
names(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower_data <- subset(power_data, power_data$Date =="2/1/2007" | power_data$Date =="2/2/2007")

dev.copy(png, file = "plot1.png", height = 480, width = 480)

hist(subpower_data$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)", ylab = "Frequency")

dev.off()
