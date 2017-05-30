# ui.R
library(shiny)
library(plotly)

shinyUI(fluidPage(
  
  titlePanel("Mental Health in the Tech World"),
  
  tabPanel('Company Size vs. Comfort of Sharing',
           
           titlePanel('What is this'),
           
           sidebarLayout(
             
             sidebarPanel(
               
               selectInput(''))
             ),
           
           mainPanel(
             plotlyOutput('companySize')
           )
    )
  
  
  
))