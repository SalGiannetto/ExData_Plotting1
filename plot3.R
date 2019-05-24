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
#plot 3 -

png("plot3.png", width=480, height=480)
#creating graph
with(data_filtered, {
  plot (Sub_metering_1~datetime,type="l",ylab="Energy Sub metering", xlab="")
  lines(Sub_metering_2~datetime,col="red")
  lines(Sub_metering_3~datetime,col="blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#closing device
dev.off()