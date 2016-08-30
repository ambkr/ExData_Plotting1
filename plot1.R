downloaded_data <- "./household_power_consumption.txt"
complete_data <- read.table(downloaded_data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset_data <- complete_data[complete_data$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower <- as.numeric(subset_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()