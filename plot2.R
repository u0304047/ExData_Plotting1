install.packages("sqldf")
library(sqldf)
closeAllConnections()
household <- read.csv.sql('household_power_consumption.txt', sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = TRUE, sep =";")
dateTime<- as.POSIXlt(paste(as.Date(household$Date, format="%d/%m/%Y"), household$Time, sep=" "))
plot(dateTime, household$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")