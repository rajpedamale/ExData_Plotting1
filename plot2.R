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

# Plot the data
png("plot2.png", width=480, height=480, bg="transparent")
plot(datetime, 
     global.active.power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()