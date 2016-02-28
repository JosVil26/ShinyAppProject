library(dplyr)
library(ggplot2)

NEI <- read.table("summarySCC_PM25_Sub.txt", header = T)

makePlot <- function(city, startYear, endYear) {
        new_city <- as.character(city)
        if (nchar(new_city) == 4) 
                new_city <- paste("0", new_city, sep = "")
        Comparison <- subset(NEI, fips == new_city & year >= startYear & 
                             year <= endYear)
        
        Emissions_Year <- Comparison %>% group_by(year, type) %>% 
                summarize(totalemission = sum(Emissions))

        pm25Plot <- ggplot(Emissions_Year, aes(year, totalemission)) + 
                geom_line(aes(col = type)) + geom_point(aes(col = type)) + 
                xlab("Year") + ylab("Total Emissions") +
                ggtitle("Emissions per Year classified by Type for city")
        return(pm25Plot)
}

shinyServer(
        function(input, output) {
                new_city <- function() {
                        x <- as.character(input$city)
                        if (nchar(x) == 4) 
                                x <- paste("0", x, sep = "")
                        return(x)
                }

                output$city <- renderText({new_city()})
                output$startYear <- renderPrint({input$startYear})
                output$endYear <- renderPrint({input$endYear})
                output$pm25Plot <- renderPlot({makePlot(input$city, 
                                                        input$startYear, 
                                                        input$endYear)})
        }
)
