getData <- function()
{
  if(!file.exists("data"))
  {
    print("Creating Directory")
    dir.create("data")
  }
  
  if(!file.exists("./data/household_power_consumption.txt"))
  {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    print("Downloading file...")
    download.file(fileUrl, destfile = "./data/household_power_consumption.zip")
    
    print("Unzipping file..")
    unzip("./data/household_power_consumption.zip", exdir = "data")
  }
  
  
}


loadData <- function()
{
  fn <- "./data/household_power_consumption.txt"
  print("Loading data...")
  d <- read.table(fn, header = TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
  
  return(d)
}