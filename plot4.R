plot4 <- function() {
  ## Read data
  df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")
  
  ## Subset data between 01/02/2007 and 02/02/2007 included
  begin_date <- as.Date("1/2/2007", format="%d/%m/%Y")
  end_date <- as.Date("3/2/2007", format="%d/%m/%Y")
  df <- subset(df, df$Date >=  begin_date & df$Date < end_date)
  df$Date_Time <- strptime(paste(df$Date, df$Time, sep=" "), format="%Y-%m-%d %H:%M:%S", tz="")
  
  png(filename="plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2))

  with(df, {
  ## Plot Global Active Power vs. Datetime
  plot(df$Date_Time, df$Global_active_power, 
       main="",
       xlab="",
       ylab="Global Active Power",
       type="l",
       lty="solid",
       col="black")
  ## Plot Voltage vs. Datetime
  plot(df$Date_Time, df$Voltage, 
       main="",
       xlab="",
       ylab="Voltage",
       type="l",
       lty="solid",
       col="black")
  ## Plot Sub metering 1, 2 and 3 vs. Datetime
  plot(df$Date_Time, df$Sub_metering_1, 
       main="",
       xlab="",
       ylab="Energy sub metering",
       type="l",
       lty="solid",
       col="black")
  lines(df$Date_Time, df$Sub_metering_2, 
        col="red")
  lines(df$Date_Time, df$Sub_metering_3, 
        col="blue")
  legend("topright", 
         lty = c(1,1), 
         col = c("black", "red", "blue"), 
         bty="n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  ## Plot Global Reactive Power vs. Datetime
  plot(df$Date_Time, df$Global_reactive_power, 
       main="",
       xlab="datetime",
       ylab="Global Active Power",
       type="l",
       lty="solid",
       col="black")
  } )
  dev.off()
}