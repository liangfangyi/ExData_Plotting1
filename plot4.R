rawdata<-read.table("household_power_consumption.txt",header = T, stringsAsFactors = F,sep = ";")
rawdata1<-rawdata[as.Date(rawdata$Date,format =  "%d/%m/%Y")>as.Date("2007-01-31"),]
rawdata2<-rawdata1[as.Date(rawdata1$Date,format =  "%d/%m/%Y")<as.Date("2007-02-03"),]
rawdata2$time<-strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")
attach(rawdata2)
par(mfrow = c(2,2))
plot(Global_active_power~as.POSIXct(time),type = "l",xlab = "",ylab = "Global active power")
plot(Voltage~as.POSIXct(time),type = "l",xlab = "datetime",ylab = "Voltage")
plot(Sub_metering_1~as.POSIXct(time),type = "l",xlab = "",ylab = "Energy sub metering")
lines(Sub_metering_2~as.POSIXct(time),type = "l",col = "red")
lines(Sub_metering_3~as.POSIXct(time),type = "l",col = "blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2,cex = 0.25)
plot(Global_reactive_power~as.POSIXct(time),type = "l",xlab = "datetime")
dev.copy(png,file = "plot4.png",width = 480, height = 480)
dev.off()