library("sqldf")
## reading 2-day period in February, 2007
data <- read.csv.sql(file="./Data/household_power_consumption.txt", 
                       sep=";", header=TRUE, sql="select * from file where Date in ('1/2/2007','2/2/2007')", stringsAsFactors=FALSE,)
closeAllConnections()

## Converting dates
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <-  strptime(data$DateTime , "%d/%m/%Y %H:%M:%S")

## Plot 2
plot(data$DateTime,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()