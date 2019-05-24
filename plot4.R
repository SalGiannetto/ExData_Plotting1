#Loading input data
dataFull<-read.csv("household_power_consumption.txt", sep=";", header=T, 
                   stringsAsFactors = F, na.strings = "?", quote = '\"')
#converting date
dataFull$Date<as.Date(dataFull$Date,format="%d/%m/%Y")
# calculation of datetime filed
dataFull$datetime<-as.POSIXct(paste(dataFull$Date, dataFull$Time), format = "%d/%m/%Y %H:%M:%S")

# Filtering data in required range 
data_filtered<-subset(dataFull,(datetime >= "2007-02-01") & (datetime < "2007-02-03")) 

#############################################
#plot 4 -

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#creating graph
with(data_filtered, {
  #graph 4.1
  plot (Global_active_power~datetime,type="l",ylab="Global Active Power", xlab="")
  #graph 4.2
  plot (Voltage~datetime,type="l",ylab="Voltage", xlab="datetime")
  #graph 4.3
  plot (Sub_metering_1~datetime,type="l",ylab="Energy Sub metering", xlab="")
  lines(Sub_metering_2~datetime,col="red")
  lines(Sub_metering_3~datetime,col="blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #graph 4.1
  plot (Global_reactive_power~datetime,type="l",ylab="Global_reactive_power", xlab="")
  
})
#closing device
dev.off()