# server.R
library(dplyr)
library(shiny)
library(rsconnect)

df <- read.csv(file = './data/mental-heath-in-tech-2016_20161114.csv', stringsAsFactors = FALSE) %>% as.data.frame()

source('./scripts/AmountMentalHealth.r')

shinyServer(function(input, output, session) { 
  
  updateSelectizeInput(session, 'State', choices = mental.health$What.country.do.you.live.in., server = TRUE)
  
  output$countrybarchart <- renderPlotly({
    return(AmountMentalHealth(input$State))
  })
})
