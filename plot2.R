#settingup working DIR
setwd("/Users/T3quila/Desktop/Coursera/Exploratory_Analysis")


#Loading input data
dataFull<-read.csv("household_power_consumption.txt", sep=";", header=T, 
                   stringsAsFactors = F, na.strings = "?", quote = '\"')
#converting date
dataFull$Date<as.Date(dataFull$Date,format="%d/%m/%Y")
# calculation of datetime filed
dataFull$datetime<-as.POSIXct(paste(dataFull$Date, dataFull$Time), format = "%d/%m/%Y %H:%M:%S")

# Filtering data in required range 
data_filtered<-subset(dataFull,(datetime >= "2007-02-01") & (datetime < "2007-02-03")) 

#####################################################################
#plot 2 - opening device
png("plot2.png", width=480, height=480)
#creating graph
with(data_filtered, {
  plot (Global_active_power~datetime,type="l",ylab="Global Active Power (kilowatts)", xlab="")
})
#closing device
dev.off()
#####################################