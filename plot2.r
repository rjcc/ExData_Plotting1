setwd("~/Dropbox/@Next/AI/JH_EDA/HW1")
library(readr)
household_power_consumption <- read_delim("household_power_consumption.txt",
";", escape_double = FALSE, locale = locale(date_format = "%d/%m/%Y"),
na = "NA", trim_ws = TRUE)
names(household_power_consumption)<-tolower(names(household_power_consumption))
library(dplyr)
hh_subdata<-filter(household_power_consumption, date>="2007-02-01" & date<="2007-02-02")
rm (household_power_consumption)

hh_subdata$datetime <- as.POSIXct(paste(hh_subdata$date, hh_subdata$time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(1,1))
plot(hh_subdata$datetime,as.numeric(hh_subdata$global_active_power)*2/1000,type="l", xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
