# Carolyn Lee
# Section AC
# 12/02/17
# This chart1.R file creates a bar graph that displays the total number of video game sales (in millions of copies) by 
# each publisher in a given year and region.

RegionVsYear <- function(input, output) {
  #sorts data by year and publisher and sums up each publisher's sales for each given year
  publisher.data <- raw.data %>%
    group_by(Year, Publisher) %>%
    summarise(
      sum.global = sum(Global_Sales),
      sum.NA = sum(NA_Sales),
      sum.EU = sum(EU_Sales),
      sum.JP = sum(JP_Sales)
    )
  
  output$RegionVsYear <- renderPlot({
    #selects data for a particular region based on user's input selection
    if(input$selected_region == "North America") {
      selected.data <- publisher.data %>% select(Year, Publisher, sum.NA)
    } else if (input$selected_region == "Europe") {
      selected.data <- publisher.data %>% select(Year, Publisher, sum.EU)
    }  else if (input$selected_region == "Japan") {
      selected.data <- publisher.data %>% select(Year, Publisher, sum.JP)
    }  else {
      selected.data <- publisher.data %>% select(Year, Publisher, sum.global)
    }
    
    #selects data for a particular year based on user's input selection
    selected.data <- selected.data %>% filter(Year == input$selected_year)
    #selects data for a particular year based on user's input selection
    selected.data <- selected.data %>%
      filter(Year == input$selected_year) %>%
      arrange(desc(Publisher))
    
    
    
    #creates the bar graph from the selected data
    
    plot1 <- ggplot(data = selected.data, aes(x=Publisher, y=unlist(selected.data[,3]), fill=Publisher)) +
      geom_bar(stat = "identity") + coord_flip() +
      theme(legend.position="none") +
      ylab("Sales in millions of copies") + ggtitle(paste0("Total Video Game Sales by Publisher (",
                                                           input$selected_region, ", ", input$selected_year, ")"))
    
    
    return(plot1)
    
    
  })
  
}