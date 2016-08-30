downloaded_data <- "./household_power_consumption.txt"
complete_data <- read.table(downloaded_data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset_data <- complete_data[complete_data$Date %in% c("1/2/2007","2/2/2007") ,]

plot4 <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subset_data$Global_active_power)
GlobalReactivePower <- as.numeric(subset_data$Global_reactive_power)
Voltage <- as.numeric(subset_data$Voltage)
sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(plot4, GlobalActivePower, type="l", xlab=" ", ylab="Global Active Power", cex=0.2)
plot(plot4, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(plot4, sub_metering_1, type="l", ylab="Energy sub metering", xlab=" ")
lines(plot4, sub_metering_2, type="l", col="red")
lines(plot4, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1.5, col=c("BLACK", "RED", "BLUE"), bty="o")
plot(plot4, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()