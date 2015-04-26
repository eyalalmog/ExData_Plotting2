#########

setwd("C:\\R\\exploratory")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#### get total emission by year


TotalEmissionByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')

barplot(height=TotalEmissionByYear$Emissions, names.arg=TotalEmissionByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' Annual emissions '))

dev.off()


