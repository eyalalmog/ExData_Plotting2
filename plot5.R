###setwd("C:\\R\\exploratory\\assign2")

library(ggplot2)

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# Combine both sets into one using SCC as a key . This join takes a while to complete...

NEI_SCC <- merge(NEI, SCC, by="SCC")

## subset the data based on fips=="24510" . The type for motor vehicle source is ON-ROAD

subset_NEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]

### aggregate the data by Year

TotalFromMotorsByYear <- aggregate(Emissions ~ year, subset_NEI, sum)

png("plot5.png", width=640, height=480)
p <- ggplot(TotalFromMotorsByYear, aes(factor(year), Emissions))

p <- p + geom_bar(stat="identity") +   xlab("year") +   ylab(expression('Total PM'[2.5]*" Emissions")) +   ggtitle('Total Emissions from motor vehicle in Baltimore City, Maryland ')

print(p)

dev.off()

