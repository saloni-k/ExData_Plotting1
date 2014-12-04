EDA_EPC<-read.table("household_power_consumption.txt",sep=";",header=TRUE, 
                    stringsAsFactors = FALSE, na.strings = c("?",""),
                    colClasses=c("character", "character", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric", 
                                 "numeric"))

epc_subset<- EDA_EPC[EDA_EPC$Date %in% c("1/2/2007","2/2/2007"),]

epc_subset$datetime<-paste(epc_subset$Date," ",epc_subset$Time)

epc_subset$datetime<-strptime(epc_subset$datetime, format = "%d/%m/%Y %H:%M:%S")
attach(epc_subset)

#plot 3.

png(file="plot3.png")
plot(datetime, Sub_metering_1,type="l",xlab="",
     ylab="Energy sub metering")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, col=c("black","red","blue"))
dev.off()
