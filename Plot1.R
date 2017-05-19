library(lubridate)

#Debug
nr=-1

#Load data
dat=read.csv("household_power_consumption.txt",nrows=nr,sep=";",
             stringsAsFactors=FALSE)

#Subset to the dates 2007-02-01 and 2007-02-02
dates=dmy(dat$Date)
small_dat=dat[dates>=ymd("2007-02-01")&dates<=ymd("2007-02-02"),]

#Open the png device to write to "plot1.png"
png("plot1.png",width = 504, height = 504,bg = "transparent")

#Draw the histogram
hist(as.numeric(small_dat$Global_active_power),col="red",
     xlab="Global Active Power (kilowatts)",main="Global Active Power")

#Close the png device
dev.off()

