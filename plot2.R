downloaded_data <- "./household_power_consumption.txt"
complete_data <- read.table(downloaded_data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset_data <- complete_data[complete_data$Date %in% c("1/2/2007","2/2/2007") ,]

plot2 <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subset_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(plot2, GlobalActivePower, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()