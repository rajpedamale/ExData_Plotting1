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
global.reactive.power <- working.data$Global_reactive_power
datetime <- strptime(paste(working.data$Date, working.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub.metering.1 <- working.data$Sub_metering_1
sub.metering.2 <- working.data$Sub_metering_2
sub.metering.3 <- working.data$Sub_metering_3
voltage <- working.data$Voltage

# Plot the data
png("plot4.png", width=480, height=480, bg = "transparent")
par(mfrow = c(2, 2)) 

# Top Left
plot(datetime, 
     global.active.power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power")

# Top Right
plot(datetime, 
     voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

# Bottom Left
plot(datetime, sub.metering.1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, sub.metering.2, type="l", col="red")
lines(datetime, sub.metering.3, type="l", col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd=1, 
       col=c("black", "red", "blue"),
       bty="n",
       cex = 0.95)

# Bottom Right
plot(datetime, 
     global.reactive.power, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()