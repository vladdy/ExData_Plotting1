# Load
data = read.table("./household_power_consumption.txt", sep=";", na.string="?", stringsAsFactors=FALSE,header=TRUE)

# Subset
data = data[(data$Date=="1/2/2007" | data$Date =="2/2/2007"), ]

# Prepare
data$Date_time <- as.POSIXct(strptime(paste(data$Date,data$Time), "%d/%m/%Y %T"))

# Create Plot2
png(filename = "Plot2.png", width = 480, height = 480, bg="transparent")
plot(data$Date_time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()