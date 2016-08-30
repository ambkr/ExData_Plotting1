downloaded_data <- "./household_power_consumption.txt"
complete_data <- read.table(downloaded_data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset_data <- complete_data[complete_data$Date %in% c("1/2/2007","2/2/2007") ,]

plot3 <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subset_data$Global_active_power)
sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(plot3, sub_metering_1, type="l", ylab="Energy sub metering", xlab=" ")
lines(plot3, sub_metering_2, type="l", col="red")
lines(plot3, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("BLACK", "RED", "BLUE"))
dev.off()