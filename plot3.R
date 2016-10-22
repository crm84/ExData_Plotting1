source("./Helpers.R")

getData()

df <- loadData()

df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png", width=480, height=480)

plot(datetime, df$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(datetime, df$Sub_metering_2, type="l", col="red")
lines(datetime, df$Sub_metering_3, type="l", col="blue")

legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()