## Douglas Wygaal
## Exploratory Data Analysis
## Week 1, Project 1
## 14 July 2019


## read the file to load the given dataset
givenData = "exdata_data_household_power_consumption/household_power_consumption.txt"
df<-read.table(givenData, header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

## format the Date column into a date object
df$Date <-as.Date(df$Date, format = "%d/%m/%Y")
## take a look at the data
head(df)
## create a new column and format to a DateTime object
df$DateTime <- paste(df$Date, df$Time, sep = " ")
df$DateTime <- strptime(df$DateTime, format="%Y-%m-%d %H:%M:%S")
## take a look at the DateTime data
head(df$DateTime)

## create a subset of the date range that we will be using
dfRange <- subset(df, Date >= as.Date("2007-02-01") & Date < as.Date("2007-02-03"))

## take a look at the date range data
head(dfRange)

## create plot 2
png(file = "plot2.png", width = 480, height = 480)
with(dfRange, plot(DateTime, Global_active_power, 
                    type="l", 
                    xlab = "", 
                    ylab = "Global Active Power (kilowatts)"))
dev.off()
 
