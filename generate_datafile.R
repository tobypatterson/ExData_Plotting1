####
# 
# Author: Toby Patterson
# File: generate_datafile.R
# Date: 7 August 2014
# 
# Generates and outputs the project datafile, project1_datafile.Rda .
#
# Presumes the file household_power_consumption.txt exists in the same directory.
# Original datafile can be downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip .
#
####

power = read.table(
  file='household_power_consumption.txt',
  sep=';',
  header=T,
  colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
  na.strings=c("NA", "?")
  #,nrows=10000
)

## Convert dates and subset for range 
date_format = "%d/%m/%Y"
power$DateTime = strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")
power$Date = as.Date(power$Date, date_format)
data = subset(
  power,
  Date >= as.Date('01/02/2007', date_format) & Date < as.Date('03/02/2007', date_format)
)

save(data,file='project1_datafile.Rda')