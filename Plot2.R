library(lubridate)

#Debug
nr=-1

#Load data
dat=read.csv("household_power_consumption.txt",nrows=nr,sep=";",
             stringsAsFactors=FALSE)

#Subset to the dates 2007-02-01 and 2007-02-02
dates=dmy(dat$Date)
small_dat=dat[dates>=ymd("2007-02-01")&dates<=ymd("2007-02-02"),]

#Extract the exact time for each data point
times=hms(small_dat$Time)+dmy(small_dat$Date)

#Open the png device to write to "plot2.png"
png("plot2.png",width = 504, height = 504,bg = "transparent")

#Draw the plot
plot(times,xlab=NA,small_dat$Global_active_power,
     ylab="Global Active Power (kilowatts)",type="l")

#Close the png device
dev.off()

