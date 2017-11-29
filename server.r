library(shiny)
library(HSAUR)
library(dplyr)
library(ggplot2)

source("scripts/chart1.R")

# Define data based on input and turn into output plot using this server function
shinyServer(function(input, output) {
  
  YearRangeOfSalesPlot(input, output)
})