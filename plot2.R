#get data 
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?",stringsAsFactors=FALSE,colClasses=c(rep("character",2),rep("numeric",7)))
inx <- grep("^1/2/2007|^2/2/2007",data$Date)
data <- data[inx,]

# tansform data type
data$datetime <- paste(data$Date,data$Time)
data <- transform(data, datetime = strptime(datetime,"%d/%m/%Y %H:%M:%S"))

#create png
png(filename="plot2.png",width = 480, height = 480)
plot(data$datetime,data$Global_active_power,type="l",xlab = "",ylab = "Global Active Powe(kilowatts)")
dev.off()