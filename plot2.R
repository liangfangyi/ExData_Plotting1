rawdata<-read.table("household_power_consumption.txt",header = T, stringsAsFactors = F,sep = ";")
rawdata1<-rawdata[as.Date(rawdata$Date,format =  "%d/%m/%Y")>as.Date("2007-01-31"),]
rawdata2<-rawdata1[as.Date(rawdata1$Date,format =  "%d/%m/%Y")<as.Date("2007-02-03"),]
rawdata2$time<-strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")
with(rawdata2,plot(Global_active_power~as.POSIXct(time),type = "l",xlab = "",ylab = "Global_active_power(kilowatts)"))
dev.copy(png,file = "plot2.png",width = 480, height = 480)
dev.off()