
file<-"/home/archersagar/Desktop/R/household_power_consumption.txt"
data<-read.table(file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
subsetdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

DateTime<-strptime(paste(subsetdata$Date,subsetdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
GAP<-as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(DateTime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()