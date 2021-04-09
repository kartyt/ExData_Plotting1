library(data.table)

# Reading the data
dt<-fread("household_power_consumption.txt", na.strings='?')

# Subsetting the data
data <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

# Creating vector containing values for x-axis - Date and Time concatenated and converted to date format
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Opening png device
png("plot3.png", width=480, height=480, unit="px")

#Ploting chart
plot(datetime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"), lty=1)

# Closing device
dev.off()