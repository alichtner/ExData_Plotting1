## Read in data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na = "?")

## Parse dates and times and subset to between 2007-02-01 and 2007-02-02
data$timestamp <- paste(data[,1], data[,2], sep = " ")
data$timestamp <- as.POSIXct(data$timestamp, format = "%d/%m/%Y %H:%M:%S")
data <- data[data$timestamp >= "2007-02-01",]
data <- data[1:2880,]

## Plot histogram of global active power for this timeset
png("plot1.png")
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
