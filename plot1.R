rawdata<-read.table("household_power_consumption.txt",header = T, stringsAsFactors = F,sep = ";")
rawdata1<-rawdata[as.Date(rawdata$Date,format =  "%d/%m/%Y")>as.Date("2007-01-31"),]
rawdata2<-rawdata1[as.Date(rawdata1$Date,format =  "%d/%m/%Y")<as.Date("2007-02-03"),]
with(rawdata2,hist(as.numeric(Global_active_power),col = "red",xlab = "Global_active_power(kilowatts)",main = "Global Active Power"))
dev.copy(png,file = "plot1.png",width = 480, height = 480)
dev.off()