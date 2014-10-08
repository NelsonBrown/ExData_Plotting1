setwd("C:\\coursera\\ExData_Plotting1")

Dataset <- read.table("C:\\Coursera\\data\\household_power_consumption.txt", 
                      header = TRUE, sep=";", na.strings=c("?"))

ds <- subset(Dataset, Dataset$Date %in% c('1/2/2007','2/2/2007'))

dates <- as.Date(ds$Date, format = '%d/%m/%Y')
ds$Date = dates

ds$DateTime =  strptime(paste(ds$Date, ds$Time),format = '%Y-%m-%d %H:%M:%S')

plot(ds$DateTime,ds$Global_active_power,main = "", type = "l",
     xlab="", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width =480, height=480)
dev.off()
