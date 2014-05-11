#####################################################################################
### To execute this code, just type in your R console :: source("Rplot3.R")
###  household_power_consumption.txt should be in the same directory as the R code
#####################################################################################

# Read data and truck values from household_power_consumption.txt. Missing values (?) are replaced with NA . 
rawData<- read.table("household_power_consumption.txt", header= TRUE, sep=";", na.strings = c("?"))

# Convert the Date and Time variables
rawData$Time<- strptime ( paste(rawData$Date,rawData$Time), "%d/%m/%Y %H:%M:%S" )
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")

# From the dataset, extract only those dates are between 2007-02-01 and 2007-02-02
data <- subset (rawData, rawData$Date =='2007-02-01' | rawData$Date =='2007-02-02')

# Store the graphic output in a PNG bitmap  format
png(file = "plot3.png", bg = "transparent", width=480 , height =480)

# Plot Sub_metering_1 and add connected line segments for Sub_metering_2 and Sub_metering_3
with (data , plot (Time,Sub_metering_1, xlab= "", ylab ="Energy sub metering" , type ="l"))
with (data , lines (Time,Sub_metering_2, col = "red"))
with (data , lines (Time,Sub_metering_3, col = "blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=1)

# Turn off device driver (to flush output to PNG)
dev.off() 



