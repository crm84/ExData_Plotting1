
source("./Helpers.R")

getData()

df <- loadData()


df <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 



png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, df$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(datetime, df$Sub_metering_2, type="l", col="red")
lines(datetime, df$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty = "n")

plot(datetime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()