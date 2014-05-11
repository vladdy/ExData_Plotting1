# Load
data = read.table("./household_power_consumption.txt", sep=";", na.string="?", stringsAsFactors=FALSE,header=TRUE)

# Subset
data = data[(data$Date=="1/2/2007" | data$Date =="2/2/2007"), ]

# Prepare
data$Date_time <- as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %T"))

# Create Plot4
png(filename = "Plot4.png", width = 480, height = 480, bg="transparent")
par(mfrow=c(2,2))
plot(data$Date_time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data$Date_time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data$Date_time, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(data$Date_time, data$Sub_metering_2, type="l", col="red")
lines(data$Date_time, data$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty="n")
plot(data$Date_time,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()