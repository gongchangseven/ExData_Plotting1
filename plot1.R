
#get data 
data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?",stringsAsFactors=FALSE,colClasses=c(rep("character",2),rep("numeric",7)))
inx <- grep("^1/2/2007|^2/2/2007",data$Date)
data <- data[inx,]

#create png
png(filename="plot1.png",width = 480, height = 480)
hist(data$Global_active_power,col="red",breaks = 12,main="Global Active Power",xlab="Global Active Powe(kilowatts)")
dev.off()