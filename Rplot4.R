#####################################################################################
### To execute this code, just type in your R console :: source("Rplot4.R")
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
png(file = "plot4.png", bg = "transparent", width=480 , height =480)

# Four plots arranged in 2 rows and 2 columns - Plotting along rows first
par(mfrow = c(2,2))
# Plot Sub_metering_1 and add connected line segments for Sub_metering_2 and Sub_metering_3
with (data , {
        # First plot : Global_active_power located in row 1 and column 1 
        plot (Time,Global_active_power,xlab= "", ylab ="Global Active Power" , type ="l")
        
        # Second plot : Voltage located in row 1 and column 2 
        plot (Time,Voltage, xlab= "datetime", ylab ="Voltage" , type ="l")
        
        # Third plot : Sub_metering_1, Sub_metering_2 and Sub_metering_1 located in row 2 and column 1
        plot (Time,Sub_metering_1, xlab= "", ylab ="Energy sub metering" , type ="l")
        lines (Time,Sub_metering_2, col = "red")
        lines (Time,Sub_metering_3, col = "blue")
        # bty : to remove the box around the legend, lty : to use line, cex : to fix the legend size
        legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
               lwd=1.5, cex=0.9, bty="n")
        
        # Fouth plot : Global_reactive_power located in row 2 and column 2
        plot (Time,Global_reactive_power, xlab= "datetime", ylab ="Global_reactive_power" , type ="l")
})
# Turn off device driver (to flush output to PNG)
dev.off() 




