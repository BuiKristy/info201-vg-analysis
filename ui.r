# Kristy Bui, Carolyn Lee, Sindhooja Mullapudi
# Section AC
# 11/19/17
# This UI.R file will be the layout for the webpage that displays the charts.

library("shiny")
library("plotly")
library("HSAUR")
library("ggsci")


my.ui <- navbarPage(
  
  # title of application
  "Video Game Sales Analysis",
  tabPanel(
    "Summary of our Analysis",
    sidebarLayout(
      sidebarPanel(
        imageOutput("vgImage.jpg")
        
      ),
      mainPanel(
        br("We are working with sales data of more than 16,500 video games with over 100,000 sold copies over the last few years. 
            We accessed this data from Kaggle. The data collected was published over a year ago."),
        br("Our target audience is video game reviewers, video game players, and video game enthusiasts. 
           But for our data we are focusing on video game reviewers. 
           They may want to know which video game companies or genres have done better than other over the years, 
           which platform was used the most to play the games, or which part of the world did better in sales depending on the game."),
        p(strong("The three specific questions we decided to do analysis on and show visually were:")),
        p(em("What are all the details of the video game given a particular rank?
           What are the percent of sales for each genre of video game in a given year?
           What are the total number of video game sales by each publisher in the given year and region?")),
        br("For each question, there are tables and graphs represeting the analysis in the proceeding tabs.")
        
      )
    )
    
  ),
  
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
                    selected = 2016),
        
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
