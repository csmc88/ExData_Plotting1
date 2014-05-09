#Read Required Dataset
source('dataset.R')

#Required Special Labels
g1_ylab <- 'Global Active Power'
g2_ylab <- 'Voltage'
g3_ylab <- 'Energy sub metering'
g4_ylab <- 'Global_reactive_power'
rxlab   <- 'datetime'
color   <- c('black','red','blue')
legends <- paste0('Sub_metering_',1:3)

#Initialize PNG Device & Setup Parameters
png('plot4.png', width = 480, height = 480)
par(mfrow = c(2,2), bg = NA)


# ----- // GRAPH COMMANDS \\ -----
	#Base Graph Design #1
with(dataset, plot(gap ~ timestamp, type = 'l', ylab = g1_ylab, xlab = ''))

	#Base Graph Design #2
with(dataset, plot(volt ~ timestamp, type = 'l', ylab = g2_ylab, xlab=rxlab))

	#Base Graph Design #3
with(dataset,  plot(sm1 ~ timestamp, type = 'n', ylab = g3_ylab, xlab = ''))
with(dataset, lines(sm1 ~ timestamp, col = color[1]))
with(dataset, lines(sm2 ~ timestamp, col = color[2]))
with(dataset, lines(sm3 ~ timestamp, col = color[3]))
legend('topright', legend = legends, col = color, lty = 'solid', bty = 'n')

	#Base Graph Design #4
with(dataset, plot(grp ~ timestamp, type = 'l', ylab = g4_ylab, xlab=rxlab, lwd = 1))
# ----- \\ GRAPH COMMANDS // -----


#Close PNG Device
dev.off()

