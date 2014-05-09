#Read Required Dataset
source('dataset.R')

#Required Special Labels
yLabel <- 'Global Active Power (kilowatts)'

#Initialize PNG Device & Setup Parameters
png('plot2.png', width = 480, height = 480)
par(bg = NA)


# ----- // GRAPH COMMANDS \\ -----
	#Base Graph Design #1
with(dataset, plot(gap ~ timestamp, type = 'l', ylab = yLabel, xlab = ''))
# ----- \\ GRAPH COMMANDS // -----


#Close PNG Device
dev.off()

