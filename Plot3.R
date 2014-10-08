setwd("C:\\coursera\\ExData_Plotting1")

Dataset <- read.table("C:\\Coursera\\data\\household_power_consumption.txt", 
                      header = TRUE, sep=";", na.strings=c("?"))

ds <- subset(Dataset, Dataset$Date %in% c('1/2/2007','2/2/2007'))

dates <- as.Date(ds$Date, format = '%d/%m/%Y')
ds$Date = dates

ds$DateTime =  strptime(paste(ds$Date, ds$Time),format = '%Y-%m-%d %H:%M:%S')

plot(ds$DateTime,ds$Sub_metering_1, type = "n",main = "", 
     ylab = "Energy sub metering",xlab = "")
points(ds$DateTime, ds$Sub_metering_1,type = "l")
points(ds$DateTime, ds$Sub_metering_2,type = "l", col="red")
points(ds$DateTime, ds$Sub_metering_3,type = "l", col= "blue")
legend("topright", text.col = c("black", "red", "blue"), 
       legend = c("----- Sub_metering_1",
                  "----- Sub_metering_2",
                  "----- Sub_metering_3"))
dev.copy(png, file = "plot3.png", width =480, height=480)
dev.off()
