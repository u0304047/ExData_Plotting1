install.packages("sqldf")
library(sqldf)
closeAllConnections()
household <- read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = TRUE, sep =";")
dateTime<- as.POSIXlt(paste(as.Date(household$Date, format="%d/%m/%Y"), household$Time, sep=" "))
with(household,{
  plot(dateTime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
  lines(dateTime,Sub_metering_1,type="l",col="black")
  lines(dateTime,Sub_metering_2,type="l",col="red")
  lines(dateTime,Sub_metering_3,type="l",col="blue")
  })
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  