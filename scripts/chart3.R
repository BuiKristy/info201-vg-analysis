#Sindhooja Mullapudi
#Section AC
#12/02/17
#This table gives an output of the top ten video games plus all the details 
#of those games that come when given the genre and region 

GenrePlusRegion <- function(input, output)
{
  dt_filter <- reactive({
    if(input$SelectLocation=="North America"){  
      raw.data %>%
        select(Rank,Name,Platform,Publisher,NA_Sales) %>% 
        filter(raw.data$Genre == input$SelectGenre) %>% top_n(10)
    } else if(input$SelectLocation=="Global"){
      
      raw.data %>%
        select(Rank,Name,Platform,Publisher,Global_Sales) %>% 
        filter(raw.data$Genre == input$SelectGenre) %>% top_n(10)
    }
    else if (input$SelectLocation=="Europe"){
      
      raw.data %>%
        select(Rank,Name,Platform,Publisher,EU_Sales) %>% 
        filter(raw.data$Genre == input$SelectGenre) %>% top_n(10)
    }
    else if (input$SelectLocation=="Japan"){
      
      raw.data %>%
        select(Rank,Name,Platform,Publisher,JP_Sales) %>% 
        filter(raw.data$Genre == input$SelectGenre) %>% top_n(10)
    }
    else if (input$SelectLocation=="Other"){
      
      raw.data %>%
        select(Rank,Name,Platform,Publisher,Other_Sales) %>% 
        filter(raw.data$Genre == input$SelectGenre) %>% top_n(10)
    }
  }
  )
  # Show the values in an HTML table ----
  output$table <- renderTable({
    dt_filter()
  })
}