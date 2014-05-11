# Load
data = read.table("./household_power_consumption.txt", sep=";", na.string="?", stringsAsFactors=FALSE,header=TRUE)

# Subset
data = data[(data$Date=="1/2/2007" | data$Date =="2/2/2007"), ]

#Create Plot1
png(filename = "Plot1.png", width = 480, height = 480, bg="transparent")
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()
