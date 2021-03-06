rm(list=ls())

# we assume that the data has been downloaded, unzipped and in the same folder (current working directory)
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data_cropped1 <- data[(data$Date=="2007-02-01"),]
data_cropped2 <- data[(data$Date=="2007-02-02"),]
data_cropped <- rbind(data_cropped1, data_cropped2)

% get the time for the plots
time <- strptime(paste(data_cropped$Date, data_cropped$Time), format = "%Y-%m-%d %H:%M:%S")

# plotting
png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(data_cropped$Global_active_power)), main=paste("Global Active Power"), col="red", xlab = "Global Active Power (kilowatts)")
dev.off()
