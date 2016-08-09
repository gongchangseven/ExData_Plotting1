#get data 
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?",stringsAsFactors=FALSE,colClasses=c(rep("character",2),rep("numeric",7)))
inx <- grep("^1/2/2007|^2/2/2007",data$Date)
data <- data[inx,]

# tansform data type
data$datetime <- paste(data$Date,data$Time)
data <- transform(data, datetime = strptime(datetime,"%d/%m/%Y %H:%M:%S"))

#create png
png(filename="plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(data$datetime,data$Global_active_power,type="l",xlab = "",ylab = "Global Active Powe")

plot(data$datetime,data$Voltage,type="l",xlab = "datetime",ylab = "Voltage")

plot(data$datetime,data$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering")
lines(data$datetime,data$Sub_metering_2,col="red")
lines(data$datetime,data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty = 1,legend=c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'),bty="n")

plot(data$datetime,data$Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()