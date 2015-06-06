library("sqldf")
## reading 2-day period in February, 2007
data <- read.csv.sql(file="./Data/household_power_consumption.txt", 
                     sep=";", header=TRUE, sql="select * from file where Date in ('1/2/2007','2/2/2007')", stringsAsFactors=FALSE,)
closeAllConnections()

## Converting dates
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <-  strptime(data$DateTime , "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

## Plot 1
plot(data$DateTime,data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
## Plot 2
plot(data$DateTime,data$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Plot 3
plot(data$DateTime,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

## Plot 4
plot(data$DateTime,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", )

## Saving to file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()