file<-"/home/archersagar/Desktop/R/household_power_consumption.txt"
data<-read.table(file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
subsetdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

DateTime<-strptime(paste(subsetdata$Date,subsetdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
GAP<-as.numeric(subsetdata$Global_active_power)
subMetering1<-as.numeric(subsetdata$Sub_metering_1)
subMetering2<-as.numeric(subsetdata$Sub_metering_2)
subMetering3<-as.numeric(subsetdata$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(DateTime, subMetering1, type="l", ylab="Energy Submetering",xlab="")
lines(DateTime, subMetering2, type="l",col="red")
lines(DateTime, subMetering3, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
dev.off()
