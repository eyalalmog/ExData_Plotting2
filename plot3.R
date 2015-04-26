###setwd("C:\\R\\exploratory\\assign2")

library(ggplot2)

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

#### filter the data for fips=="24510"

subset_NEI  <- NEI[NEI$fips=="24510", ]

###aggregate By Year

TotalByYearAndType <- aggregate(Emissions ~ year + type, subset_NEI, sum)


png("plot3.png", width=640, height=480)

### create the initial plot

p <- ggplot(TotalByYearAndType, aes(year, Emissions, color = type))  ## add color for each type

### Add lines and decriptions

p <- p + geom_line() + xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions in Baltimore City By Type')

print(p)

dev.off()