EDA_EPC<-read.table("household_power_consumption.txt",sep=";",header=TRUE, 
                    stringsAsFactors = FALSE, na.strings = c("?",""),
                    colClasses=c("character", "character", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric", 
                                 "numeric"))

epc_subset<- EDA_EPC[EDA_EPC$Date %in% c("1/2/2007","2/2/2007"),]

epc_subset$datetime<-paste(epc_subset$Date," ",epc_subset$Time)

epc_subset$datetime<-strptime(epc_subset$datetime, format = "%d/%m/%Y %H:%M:%S")
attach(epc_subset)

#plot 2.

plot(datetime, Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()
