library(data.table)
library(dplyr)

# Reading the data
dt<-fread("household_power_consumption.txt", na.strings='?')

# Subsetting the data
data <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

# Subsetting vector from data frame and changing its format
globalpower<-as.numeric(data$Global_active_power)

# Opening png device
png("plot1.png", width=480, height=480, unit="px")

# Ploting the histogram
plot1<-hist(globalpower, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

# Closing device
dev.off()

