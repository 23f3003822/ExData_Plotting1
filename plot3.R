png("plot3.png", 480, 480)



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

plot(data$Datetime, data$Sub_metering_1,
     type="l", ylab="Energy sub metering", xlab="")

lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1)

dev.off()
