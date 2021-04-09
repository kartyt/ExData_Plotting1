library(data.table)

# Reading the data
dt<-fread("household_power_consumption.txt", na.strings='?')

# Subsetting the data
data <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

# Creating vector containing values for x-axis - Date and Time concatenated and converted to date format
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Creating vector containing values for y-axis - values from Global Avtive Power column
globalpower<-as.numeric(data$Global_active_power)

# Opening png device
png("plot2.png", width=480, height=480, unit="px")

# Plotting the line chart
plot(datetime,globalpower,type="l",ylab="Global Active Power (kilowatts)",xlab="")

# Closing device
dev.off()

