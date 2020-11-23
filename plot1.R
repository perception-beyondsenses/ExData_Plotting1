library(readxl)
library(dplyr)
library(lubridate)

setwd("D:/JH-data-science-specialization/EDA/")

main_df <- read.csv2("household_power_consumption.txt",stringsAsFactors = FALSE,sep = ";")
main_df$Date <- as.Date(main_df$Date,"%d/%m/%Y")

df <- main_df %>% filter(between(Date,as.Date("2007-02-01"),as.Date("2007-02-02")))
df$Global_active_power <- as.numeric(df$Global_active_power)
df$DateTime <- strptime(paste(df$Date,df$Time),"%Y-%m-%d %H:%M:%S")

# Plot1
png("plot1.png",width = 480, height = 480)
hist(df$Global_active_power, xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power")
dev.off()

