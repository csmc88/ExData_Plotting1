#Library Load
library(data.table)

LoadData <- function(fname){
	#Read Only Date/Time Columns
	dataset <- fread(fname, na.strings = '?', select = c(1,2))

	#Define Range of Interest
	extract <- dataset$Date %in% c('1/2/2007','2/2/2007')
	skips <- min((1:length(extract))[extract])
	nrows <- sum(extract)

	#Convert Date/Time to POSIX for Required Range
	timestamp <- dataset[extract, paste(Date,Time)]
	timestamp <- as.POSIXct(timestamp, format='%d/%m/%Y %H:%M:%S', tz='UTC')

	#Extract Only Required Set of Columns and Rows
	dataset <- fread(fname, na.strings='?', select=3:9, nrows=nrows, skip=skips)

	#Rename Columns
	columns <- c('gap','grp','volt','gint','sm1','sm2','sm3')
	setnames(dataset,names(dataset),columns)

	#Bind Results
	dataset <- cbind(timestamp = timestamp,dataset)

	return(dataset)
}

dataset <- LoadData('household_power_consumption.txt')