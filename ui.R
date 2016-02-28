library(shiny)

shinyUI(pageWithSidebar(
        headerPanel('PM2.5 Emissions Exploratory Analysis'),
        sidebarPanel(
                selectInput('city', 'Choose the city', choices = 
                                    c('Baltimore' = 24510, 
                                      'Los Angeles' = 06037, 
                                      'Washington' = 24043)),
                sliderInput('startYear', 'Choose the starting year', 
                            min = 1999, max = 2008, value = 1999),
                sliderInput('endYear', 'Choose the ending year', 
                            min = 1999, max = 2008, value = 2008)
        ),
        mainPanel(
                p('This shiny app will show you the Total PM2.5 Emissions for a 
                  period of years grouped by type of sources. Load the data take a 
                  minutes, please wait.'),
                h4('The city FIPS you chose:'),
                verbatimTextOutput('city'),
                h4('The starting year you chose:'),
                verbatimTextOutput('startYear'),
                h4('The ending year you chose:'),
                verbatimTextOutput('endYear'),
                h4('The total PM2.5 emissions in the selected year period'),
                plotOutput('pm25Plot'),
                h2('Documentation'),
                p('In this app you only need to choose some cities and a period 
                  of years to create a plot with the total emissions of PM2.5'),
                p('Fine particulate matter (PM2.5) is an ambient air pollutant 
                  for which there is strong evidence that it is harmful to 
                  human health. In the United States, the Environmental 
                  Protection Agency (EPA) is tasked with setting national 
                  ambient air quality standards for fine PM and for tracking 
                  the emissions of this pollutant into the atmosphere. 
                  Approximatly every 3 years, the EPA releases its database on 
                  emissions of PM2.5. This database is known as the National 
                  Emissions Inventory (NEI). You can read more information 
                  about the NEI at the EPA National Emissions Inventory web 
                  site.'),
                p('I use a little partition of the real data')
        )
))
