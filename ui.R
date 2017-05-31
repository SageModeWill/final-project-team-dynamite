# ui.R
library(shiny)
library(plotly)

shinyUI(navbarPage("Mental Health in the Tech World",
  
  tabPanel('Health Disorders Across the Globe',
           
           titlePanel('Choose your country'),
           
           sidebarLayout(
             
             sidebarPanel(
               
               selectizeInput('State', label = NULL, choices = NULL, selected = NULL, multiple = FALSE,
                              options = NULL)
             ),
           
            mainPanel(
             plotlyOutput('countrybarchart')
            )
          )
  )
))