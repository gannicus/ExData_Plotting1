
plot3 <- function(){
    png("plot3.png", width=400, height=400)
    data<- read.table("household_power_consumption.txt",header = TRUE,sep = ";",
                    colClasses = c("character","character",rep("numeric",7)),na="?")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  dates <- as.Date(c("01/02/2007","02/02/2007"),format = "%d/%m/%Y")

  data <- subset(data , data$Date %in% dates)
  
  data$Time <- strptime( paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")

  with(data, plot(Time,Sub_metering_1,type="l",ylab = "Energy sub metering",xlab = ""))
  with(data, lines(Time,Sub_metering_2,type="l",col="red"))
  with(data, lines(Time,Sub_metering_3,type="l",col="blue"))
  legend("topright",col=c("black","red","blue"),
         legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,
         box.lwd=0)

  dev.off()
  
}