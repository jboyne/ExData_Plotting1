#Unzip the dataset
unzip("exdata_data_household_power_consumption.zip")

#Read the dataset column names and create a 1 row dataset 
ColumnNames <- read.table("household_power_consumption.txt", header=FALSE, sep=";", nrows=1)

#Read thne dataset and filter only the rows needed 
PowerData <- read.table("household_power_consumption.txt", sep=";", na.strings=c("NA","?"), skip=66637, nrows=2880)

#Rename the subset PowerData with the names from columnNames dataset 
names(PowerData) <- as.character(unlist(ColumnNames[1,]))

# Create a new array for an actual date object
dates <- paste(PowerData$Date, PowerData$Time)
datetime <- strptime(dates, "%d/%m/%Y %H:%M:%S")

#Set the output to be a matrix with 2 columns 2 rows 
par(mfrow=c(2,2))

#SubPlot1  Global_active_power vs datetime 
plot(datetime, PowerData$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

#SubPlot2 Voltage vs datetime 
plot(datetime, PowerData$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

#SubPlot3  sub metering consumption vs datetime 
plot(datetime, PowerData$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(datetime, PowerData$Sub_metering_2, col = "red")
lines(datetime, PowerData$Sub_metering_3,col = "blue")
legend("topright",lty=1, bty = "n", col = c("black","red","blue"),cex=0.65, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#SubPlot4 Global_reactive_power vs datetime 
plot(datetime, PowerData$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

#Output the data to a PNG file in the working directory and close the connection to the graphic device   
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
