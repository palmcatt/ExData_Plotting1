### PLOT-2 ###

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
plot (Time, Global_active_power,ylab="Global Active Power (Kilowatts)",xlab="", type="n")
lines(Time, Global_active_power)

## Rease object attachment
detach(sub.data)
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png,file="plot2.png", width=480,height=480)

dev.off()