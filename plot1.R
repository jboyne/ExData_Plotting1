#Unzip the dataset
unzip("exdata_data_household_power_consumption.zip")

#Read the dataset column names and create a 1 row dataset 
ColumnNames <- read.table("household_power_consumption.txt", header=FALSE, sep=";", nrows=1)

#Read thne dataset and filter only the rows needed 
PowerData <- read.table("household_power_consumption.txt", sep=";", na.strings=c("NA","?"), skip=66637, nrows=2880)

#Rename the subset PowerData with the names from columnNames dataset 
names(PowerData) <- as.character(unlist(ColumnNames[1,]))

#Set the mfrow to be 1 row 1 column (Single plot)
par(mfrow=c(1,1))
#create an histogram for the Global_Active_Power 
hist(PowerData$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Output the data to a PNG file in the working directory and close the connection to the graphic device   
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
