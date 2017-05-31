# ui.R
library(shiny)
library(plotly)

shinyUI(navbarPage("Mental Health in the Tech World",
  tabPanel('Overview',
           titlePanel('Where is our data coming from? '),
           sidebarLayout(
             sidebarPanel(
               selectInput(inputId = "map_type",
                           label = "World or America",
                           choices = c("World", "America"),
                           selected = "World")
             ),
             mainPanel(
                br(),
                h3("Project Description"),
                p("The data set we will be working with is OSMI Mental Health in Tech Survey 2016, 
                  which is from here www.kaggle.com/osmi/mental-health-in-tech-2016. The research was held by Osmi 
                  help organization, and to learn more about their research you can go here: https://osmihelp.org/research. 
                  Our target audience are the companies in tech, and employees who will work in teams with all kinds of 
                  people and it may affect them. "),
                br(),
                p("Our target audience will be able to look at our data and see how mental illnesses can affect an employee,
                  and allows companies to be aware if they should look into resources for help. Employee's working in tech 
                  will also be able to look at our data and see if having a person who has a mental disorder will affect 
                  their team or not. Another thing companies can use, is the question :
                  Are you likely to bring up a mental illness in an interview? Companies will see if they should expect 
                  people to lie, or expect people to be truthful with them if they ask. Companies can also ask the 
                  question on what country this could be a problem in, and maybe if it is such a problem in certain 
                  countries, they could all together fight against the issue there is. One other specific question we 
                  may target is even if there are resources the company provides, they may want to see if most employees 
                  do not know of the resources they get, and make sure they let everyone know in their own company 
                  if they think that is a problem there."),
                br()
            )
        )
  ),
  tabPanel('Health Disorders by Country',
           titlePanel(''),
           sidebarLayout(
             sidebarPanel(
               selectizeInput('State', label = 'Choose your country', choices = NULL, selected = NULL,
                              multiple = FALSE, options = NULL)
             ),
             mainPanel(
               plotlyOutput('countrybarchart'),
               br(),
               h2('Mental Health Has no Barriers in the World', align = 'center'),
               br(),
               p('Even in the tech field I feel that it is imperative to understand you will be around people who have
                 mental health disorders. No matter whether you are in the United States or in the United Kingdom people
                 do or feel like they may have a mental health disorder. The people side of technology needs those who
                 understand, and the companies do have to be aware that whether they would like to believe it or not,
                 they should use resources to help those with mental health disorders in their company.', align = 'Center')
             )
           )
  ),
  tabPanel('Documentation',
           titlePanel('Where is our data coming from? '),
           sidebarLayout(
             sidebarPanel(),
             mainPanel(h3("Team members"),
                       h4("  Ivan Mireles"),
                       h4("  Drew Gallardo"),
                       h4("  William Abuassi"),
                       h4("  Sitong Wu")
            )
          )
  )
))
  

