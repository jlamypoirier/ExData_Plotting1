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

#Open the png device to write to "plot3.png"
png("plot3.png",width = 504, height = 504,bg = "transparent")

#Plot the line for each of the three sub-meterings, then add a legend
plot(times,xlab=NA,small_dat$Sub_metering_1,
     ylab="Energy sub metering",type="l")
lines(times,small_dat$Sub_metering_2,col="red")
lines(times,small_dat$Sub_metering_3,col="blue")
legend("topright",names(small_dat)[7:9],
       col=c("black","red","blue"),lty=1)

#Close the png device
dev.off()
