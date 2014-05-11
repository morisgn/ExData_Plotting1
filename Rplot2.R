#####################################################################################
### To execute this code, just type in your R console :: source("Rplot2.R")
###  household_power_consumption.txt should be in the same directory as the R code
#####################################################################################
###  If you want to see the same label as mine on the x axis, you may want to set your LC_TIME to English.
### To set yout local time to another language, say French below is how you can do it.
###      Sys.setlocale("LC_TIME", "fr")     # Solaris: details are OS-dependent
###      Sys.setlocale("LC_TIME", "fr_FR.utf8")   #  Linux 
###      Sys.setlocale("LC_TIME", "fr_FR")  # Mac OS X, in UTF-8
###      Sys.setlocale("LC_TIME", "French") # Windows
###      source : http://stat.ethz.ch/R-manual/R-devel/library/base/html/locales.html

# Read data and truck values from household_power_consumption.txt. Missing values (?) are replaced with NA . 
rawData<- read.table("household_power_consumption.txt", header= TRUE, sep=";", na.strings = c("?"))

# Convert the Date and Time variables
rawData$Time<- strptime ( paste(rawData$Date,rawData$Time), "%d/%m/%Y %H:%M:%S" )
rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")

# From the dataset, extract only those dates are between 2007-02-01 and 2007-02-02
data <- subset (rawData, rawData$Date =='2007-02-01' | rawData$Date =='2007-02-02')

# Store the graphic output in a PNG bitmap  format
png(file = "plot2.png", bg = "transparent", width=480 , height =480)

# Plot the Global_active_power using line
plot (data$Time,data$Global_active_power,xlab= "", ylab ="Global Active Power (kilowatts)" , type ="l")

# Turn off device driver (to flush output to PNG)
dev.off() 

          
          
        
          
          
          