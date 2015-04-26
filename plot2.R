
###setwd("C:\\R\\exploratory\\assign2")


if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

#### filter the data for fips=="24510"

subset_NEI  <- NEI[NEI$fips=="24510", ]

###aggregate By Year

TotalEmissionByYear <- aggregate(Emissions ~ year, subset_NEI, sum)

png('plot2.png')

## create bar plot 
barplot(height=TotalEmissionByYear$Emissions, names.arg=TotalEmissionByYear$year, xlab="Year", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' Annual emissions in Baltimore City '))
dev.off()