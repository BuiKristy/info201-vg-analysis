# Kristy Bui, Carolyn Lee, Sindhooja Mullapudi
# Section AC
# 11/19/17
# This UI.R file will be the layout for the webpage that displays the charts.

library(shiny)
library(plotly)

my.ui <- navbarPage(
  
  # title of application
  "Video Game Sales Analysis",
  
  tabPanel(
    "Percentage of Sales Per Genre in Given Timeframe",
    sidebarLayout(
      sidebarPanel(
        sliderInput("years",
                    "Range of years:",
                    min = 1980,
                    max = 2017,
                    value = c(1980, 2017),
                    sep = "")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotlyOutput("YearRangeOfSalesPlot", height = 700)
      )
    )
  ) ,
  
  tabPanel(
    "Total Video Game Sales by Publisher",
    sidebarLayout(
      sidebarPanel(
        selectInput("selected_year", label = h3("Select a year"), 
                    choices = 1980:2016, 
                    selected = 1980),
        
        radioButtons("selected_region", label = h3("Select a region"), 
                    choices = c("North America", "Europe", "Japan", "Global"),
                    selected = "North America")
      ),
      

    
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("RegionVsYear", width = 1300)
      )
    )
  ) 
)
  
  


shinyUI(my.ui)
