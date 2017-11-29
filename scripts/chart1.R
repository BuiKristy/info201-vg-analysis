# Kristy Bui
# Section AC
# 11/19/17
# This chart1.R file creates a graph that displays the percentage of sales for each genre of video game
# in a given year range. 

raw.data <- read.csv("data/vgsales.csv")

# Change N/A years to NA in order to remove them
raw.data$Year[raw.data$Year == "N/A"] <- NA
raw.data <- raw.data[complete.cases(raw.data[,"Year"]),]

# Games shouldn't be accounted for during or after this year
raw.data <- filter(raw.data, as.numeric(as.character(Year)) < 2017) 

# Plot the YearRangeOfSalesPlot Plot which generates a graph that looks at percentages of sales 
# based on genre in a given time period
YearRangeOfSalesPlot = function(input, output) {
  output$YearRangeOfSalesPlot <- renderPlot({
    # filters the data based on given years
    chart.data <- raw.data %>% filter(as.numeric(input$years[1]) <= as.numeric(as.character(Year)) &
                                        as.numeric(as.character(Year)) < as.numeric(input$years[2]))
    
    # this data summarizes the number of all sales in a given year
    summed.data <- chart.data %>% group_by(Year, Genre) %>% summarize(Sum = sum(Global_Sales)) %>% mutate(Percentage = Sum / sum(Sum))
    
    # Generate the line plot
    ggplot(summed.data, aes(x=Year, y=Percentage, group=Genre)) + geom_point(aes(color=Genre)) + geom_line(aes(color=Genre))
  })
}