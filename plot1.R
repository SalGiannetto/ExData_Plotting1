#settingup working DIR
setwd("/Users/T3quila/Desktop/Coursera/Exploratory_Analysis")


#Loading input data
dataFull<-read.csv("household_power_consumption.txt", sep=";", header=T, 
                   stringsAsFactors = F, na.strings = "?", quote = '\"')
#converting date
dataFull$Date<as.Date(dataFull$Date,format="%d/%m/%Y")
# Filtering data in required range 
data_filtered<-subset(dataFull,(Date >= "2007-02-01") & (datetime < "2007-02-03")) 

#####################################################################
#plot 1 - opening device
png("plot1.png", width=480, height=480)
#creating histogram
hist(data_filtered$Global_active_power, main = "Global Active Power",xlab = "Global Acitve Power (kilowatts)",
     ylab = "Frequency",col = "red")
#closing device
dev.off()
#####################################