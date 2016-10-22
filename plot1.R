source("./Helpers.R")

getData()
df <- loadData()

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

df <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]
df$DateTime <- strptime(paste(df$Date, df$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")


png("plot1.png", width=480, height=480)
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red" )

dev.off()