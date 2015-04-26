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

# grep all lines with short name equal coal

coalRecords <- grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE)

#And filter the Dataset

CoalNEI_SCC <- NEI_SCC[coalRecords, ]

#### aggregate the coal subset by year

CoalTotalByYear <- aggregate(Emissions ~ year, CoalNEI_SCC, sum)



png("plot4.png", width=640, height=480)

p <- ggplot(CoalTotalByYear, aes(factor(year), Emissions))

p <- p + geom_bar(stat="identity") +   xlab("Year") + ylab(expression('Total PM'[2.5]*" Emissions")) +   ggtitle(' Total USA emissions from coal combustion-related sources')
print(p)
dev.off()


