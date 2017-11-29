# Kristy Bui
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
        plotOutput("YearRangeOfSalesPlot")
      )
    )
  )
  
)

shinyUI(my.ui)
