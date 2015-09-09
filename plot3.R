## Read in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na = "?")

## Parse dates and times and subset to between 2007-02-01 and 2007-02-02
data$timestamp <- paste(data[,1], data[,2], sep = " ")
data$timestamp <- as.POSIXct(data$timestamp, format = "%d/%m/%Y %H:%M:%S")
data <- data[data$timestamp >= "2007-02-01",]
data <- data[1:2880,]

## Plot histogram of global active power for this timeset
png("plot3.png")
plot(data$timestamp, data$Sub_metering_1, ylab = "Energy Sub metering", xlab = "", type = "n")
        lines(data$timestamp, data$Sub_metering_1,  lty = 1, col = "black")
        lines(data$timestamp, data$Sub_metering_2, lty = 1, col = "red")
        lines(data$timestamp, data$Sub_metering_3, lty = 1, col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()
