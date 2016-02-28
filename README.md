# ShinyAppProject

A shiny application about PM2.5 emissions exploratory data analysis for the Coursera's course Developing Data Product.

The app is accesible in [PM2.5 Exploratory Analysis Shiny App](https://josvil.shinyapps.io/Shiny_App_Project/)

This data is processed for reduce it with the next code:

NEI <- readRDS("summarySCC_PM25.rds")
inTrain <- createDataPartition(y = NEI$Emissions, p=0.00345, list = F)
training <- NEI[inTrain, ]

write.table(training, "summarySCC_PM25_Sub.txt", row.names = FALSE, quote = FALSE)


The original data is obtained from [here](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip)

The county codes was obtained from [here](http://md.postcodebase.com/state_county)
