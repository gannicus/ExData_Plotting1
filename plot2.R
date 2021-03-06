
plot2 <- function(){
  png("plot2.png", width=400, height=400)
  data<- read.table("household_power_consumption.txt",header = TRUE,sep = ";",
                    colClasses = c("character","character",rep("numeric",7)),na="?")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  dates <- as.Date(c("01/02/2007","02/02/2007"),format = "%d/%m/%Y")  
  
  data <- subset(data , data$Date %in% dates)
  
  
  data$Time <- strptime( paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")
  
  with(data, plot(Time,Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)"))
  
  dev.off()
}
