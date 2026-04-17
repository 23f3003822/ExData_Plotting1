png("plot4.png", 480, 480)


data <- read.table("household_power_consumption.txt",
                   header=TRUE,
                   sep=";",
                   na.strings="?",
                   stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

data$Datetime <- strptime(
  paste(data$Date, data$Time),
  format="%Y-%m-%d %H:%M:%S"
)


# data code here

par(mfrow=c(2,2))

plot(data$Datetime, data$Global_active_power,
     type="l", xlab="", ylab="Global Active Power")

plot(data$Datetime, data$Voltage,
     type="l", xlab="datetime", ylab="Voltage")

plot(data$Datetime, data$Sub_metering_1,
     type="l", xlab="", ylab="Energy sub metering")

lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       bty="n")

plot(data$Datetime, data$Global_reactive_power,
     type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()
