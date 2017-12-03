library(shiny)
library(HSAUR)
library(dplyr)
library(ggplot2)

#install.packages("ggsci")
library(ggsci)

source("scripts/chart1.R")
source("scripts/chart2.R")

# Define data based on input and turn into output plot using this server function
shinyServer(function(input, output) {
  
  YearRangeOfSalesPlot(input, output)
 RegionVsYear(input, output)
})