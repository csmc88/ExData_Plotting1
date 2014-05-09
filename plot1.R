#Read Required Dataset
source('dataset.R')

#Required Special Labels
titleText <- 'Global Active Power'
xLabel    <- 'Global Active Power (kilowatts)'

#Initialize PNG Device & Setup Parameters
png('plot1.png', width = 480, height = 480)
par(bg = NA)


# ----- // GRAPH COMMANDS \\ -----
	#Base Graph Design #1
hist(dataset$gap, col = 'red', main = titleText, xlab = xLabel)
# ----- \\ GRAPH COMMANDS // -----


#Close PNG Device
dev.off()

