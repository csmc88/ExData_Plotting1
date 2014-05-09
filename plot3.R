#Read Required Dataset
source('dataset.R')

#Required Special Labels
yLabel  <- 'Energy sub metering'
color   <- c('black','red','blue')
legends <- paste0('Sub_metering_',1:3)

#Initialize PNG Device & Setup Parameters
png('plot3.png', width = 480, height = 480)
par(bg = NA)


# ----- // GRAPH COMMANDS \\ -----
	#Base Graphic Design
with(dataset,  plot(sm1 ~ timestamp, type = 'n', ylab = yLabel, xlab = ''))
with(dataset, lines(sm1 ~ timestamp, col = color[1]))
with(dataset, lines(sm2 ~ timestamp, col = color[2]))
with(dataset, lines(sm3 ~ timestamp, col = color[3]))
legend('topright', legend = legends, col = color, lty = 'solid')
# ----- \\ GRAPH COMMANDS // -----


#Close PNG Device
dev.off()

