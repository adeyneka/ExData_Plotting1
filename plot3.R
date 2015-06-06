library("sqldf")
## reading 2-day period in February, 2007
data <- read.csv.sql(file="./Data/household_power_consumption.txt", 
                     sep=";", header=TRUE, sql="select * from file where Date in ('1/2/2007','2/2/2007')", stringsAsFactors=FALSE,)
closeAllConnections()

## Converting dates
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <-  strptime(data$DateTime , "%d/%m/%Y %H:%M:%S")

## Plot 3
plot(data$DateTime,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()