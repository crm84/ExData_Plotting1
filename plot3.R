source("./Helpers.R")

getData()

df <- loadData()

subdf <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subdf$Date, subdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png", width=480, height=480)

plot(datetime, subdf$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(datetime, subdf$Sub_metering_2, type="l", col="red")
lines(datetime, subdf$Sub_metering_3, type="l", col="blue")

legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()