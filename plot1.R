library("sqldf")
## reading 2-day period in February, 2007
data <- read.csv.sql(file="./Data/household_power_consumption.txt", 
                     sep=";", header=TRUE, sql="select * from file where Date in ('1/2/2007','2/2/2007')", stringsAsFactors=FALSE,)
closeAllConnections()

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()