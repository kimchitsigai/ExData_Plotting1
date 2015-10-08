plot2 <- function() {
  ## Read data
  df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", 
                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  df$Date <- as.Date(df$Date, format="%d/%m/%Y")
  
  ## Subset data between 01/02/2007 and 02/02/2007 included
  begin_date <- as.Date("1/2/2007", format="%d/%m/%Y")
  end_date <- as.Date("3/2/2007", format="%d/%m/%Y")
  df <- subset(df, df$Date >=  begin_date & df$Date < end_date)
  df$Date_Time <- strptime(paste(df$Date, df$Time, sep=" "), format="%Y-%m-%d %H:%M:%S", tz="")
  
  ## Plot the Global Active Power vs. datetime
  png(filename="plot2.png", width = 480, height = 480);
  plot(df$Date_Time, df$Global_active_power, 
       main="",
       xlab="",
       ylab="Global Active power (kilowatts)",
       type="l",
       lty="solid",
       col="black"
  )
  dev.off()
}