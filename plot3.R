### PLOT-3 ###

## Load data
main.data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")

## "We will only be using data from the dates 2007-02-01 and 2007-02-02."  
sub.data <- main.data[main.data$Date %in% c("1/2/2007","2/2/2007"),]

## Get Date and Time correctly; attach sub.data to search path for easy use
sub.data <- transform(
    sub.data,
    Date = as.Date(Date, format = "%d/%m/%Y"),
    Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
	)
attach(sub.data)

## Generate diagram
plot (Time, Sub_metering_1,ylab="Energy sub metering",xlab="", type="n")

lines(Time, Sub_metering_1)
lines(Time, Sub_metering_2,col="red")
lines(Time, Sub_metering_3,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),cex=0.7, pt.cex=0.5)

## Rease object attachment
detach(sub.data)
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png,file="plot3.png", width=480,height=480)

dev.off()