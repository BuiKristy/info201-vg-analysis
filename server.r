library(shiny)
library(HSAUR)
library(dplyr)
library(ggplot2)
library(ggsci)

source("scripts/chart1.R")
source("scripts/chart2.R")
source("scripts/chart3.R")

# Define data based on input and turn into output plot using this server function
shinyServer(function(input, output) {
  
  imageOutput("vgImage.jpg")
  YearRangeOfSalesPlot(input, output)
 RegionVsYear(input, output)
 GenrePlusRegion(input, output)
})