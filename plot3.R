# Load data
data.file <- "./data/household_power_consumption.txt"
data <- read.table(data.file, 
                   header=TRUE, 
                   sep=";", 
                   stringsAsFactors=FALSE, 
                   dec=".", 
                   colClasses = c("character", "character", rep("numeric",7)),
                   na.strings = "?")

# Narrow down to data required for plotting
working.data <- data[is.element(data$Date,c("1/2/2007","2/2/2007")) ,]
global.active.power <- working.data$Global_active_power
datetime <- strptime(paste(working.data$Date, working.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub.metering.1 <- working.data$Sub_metering_1
sub.metering.2 <- working.data$Sub_metering_2
sub.metering.3 <- working.data$Sub_metering_3

# Plot the data
png("plot3.png", width=480, height=480, bg = "transparent")
plot(datetime, sub.metering.1, type="l", xlab="", ylab="Energy Submetering", col="black")
lines(datetime, sub.metering.2, type="l", col="red")
lines(datetime, sub.metering.3, type="l", col="blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()