# server.R
library(dplyr)
library(shiny)
library(rsconnect)
library(plotly)

df <- read.csv(file = './data/mental-heath-in-tech-2016_20161114.csv', stringsAsFactors = FALSE)

source('./scripts/AmountMentalHealth.R')
source('./scripts/GeoData.R')
source('./scripts/SurveyChart.R')
source('./scripts/BuildCompanySizeChart.R')

shinyServer(function(input, output, session) { 
  
  updateSelectizeInput(session, 'State', choices = df$What.country.do.you.work.in., server = TRUE,
                       selected = 'United States of America')
  
  output$countrybarchart <- renderPlotly({
    return(AmountMentalHealth(input$State))
  })
  
  # Render the plotly bar company size
  output$companySizeComparisons <- renderPlotly({
    return(BuildCompanySizeChart(df, input$status))
  })
  
  output$AmericaMap <- renderPlotly({
        return(data.geo.america(df))
  })
  
  output$WorldMap <- renderPlotly({
    return(data.geo.world(df))
  })
  
  # Renders a plotly plot of the treatment script
  output$treatment <- renderPlotly({
    return(CreatePlot(df))
  })
  
})
  
