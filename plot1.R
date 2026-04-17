png("plot1.png", 480, 480)


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

hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()
