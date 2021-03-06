source("./Helpers.R")

getData()

df <- loadData()

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

df <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]

df$DateTime <- strptime(paste(df$Date, df$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(df$DateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()