# server.R
library(dplyr)
library(shiny)
library(rsconnect)

df <- read.csv(file = './data/mental-heath-in-tech-2016_20161114.csv', stringsAsFactors = FALSE) %>% as.data.frame()

source('./scripts/AmountMentalHealth.r')
source('./scripts/GeoData.r')

shinyServer(function(input, output, session) { 
  
  updateSelectizeInput(session, 'State', choices = mental.health$What.country.do.you.work.in., server = TRUE,
                       selected = 'United States of America')
  
  output$countrybarchart <- renderPlotly({
    return(AmountMentalHealth(input$State))
  })
  
  output$AmericaMap <- renderPlotly({
        return(data.geo.america(df))
  })
  
  output$WorldMap <- renderPlotly({
    return(data.geo.world(df))
  })
  
})
