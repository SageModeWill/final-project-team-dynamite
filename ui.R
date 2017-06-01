# ui.R
library(shiny)
library(plotly)
library(shinythemes)
library(rsconnect)

# Usern interface of shiny app, and loading in page theme
shinyUI(navbarPage("Mental Health in the Tech World",
                   theme = shinytheme("yeti"),
                   
  # One tab of the user interface                 
  tabPanel('Overview',
             mainPanel(
               h1(strong("2016 Mental Health Tech Survey")),
               br(),
               img(src = "Openup.png", height = 300, width = 500),
               br(),
               br(),
               p('In 2016, Open Sourcing Mental Illness conducted a poll on 1433 individuals in states and countries
                  in order to study the mental health in the tech world.'),
               br(),
               p('This webpage will allow our target audience like companies to easily read and visualize 
                 the data on mental health. We hope our data will allow companies to see the importance of good
                 treatment, and how people with some type of mental health issue may react to different reactions like
                 talking to a co-worker or supervisor about their problems. More importantly however, we hope companies
                 realize there is always more to be done to allow those with mental health issues to thrive in work,
                 and not be afraid no matter the size of the company.')
            )
  ),
  
  # The second tab of the user interface 
  tabPanel('Data Source',
           titlePanel('Where is our data coming from? '),
           mainPanel(
             plotlyOutput('WorldMap'),
             plotlyOutput('AmericaMap')
           )
  ),
  
  # The third tab of the user interface
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
  
  # The fourth tab of the user interface
  tabPanel('Company Size and Comfort of Sharing',
           titlePanel(""),
           sidebarLayout(
             sidebarPanel(
               selectInput(inputId = "status",
                           label = "Person Shared To",
                           choices = list("Coworkers" = 'Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers.', 
                                          "Supervisor" = 'Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.direct.supervisor.s..'),
                           selected = 'Coworkers')
             ),
             mainPanel(
               plotlyOutput('companySizeComparisons'),
               h2(strong("Data Insights"), align = "center"),
               h4("Coworkers"),
               p("When we look at the chart in regards to how comfortable employees are in sharing their mental health
                 with fellow coworkers, in almost every case employees are very relunctant to share that personal 
                 information. It seems that most people are unsure of what they would do, with the answer of", 
                 span("MAYBE", style = "color:green"), "being the most common followed closely behind", 
                 span("NO", style = "color:red"), ". There seems to be constant stigma from fellow workers that may 
                 discourage sharing something so personal that they may not think is work related."),
               br(),
               h4("Supervisors"),
               p("Looking at the second chart in regards to how comfortable employees are in sharing their mental health 
                 with supervisors, people are suprisingly more comfortable in sharing that information. In companies of 
                 all sizes execpt over 1000, the most popular response was", span("YES", style = "color:blue"), ". This 
                 shows that employees, in general, seem to trust their supervisors even in the larger company sizes. This 
                 goes to show that leadership and trust are important/integrated parts in many companies, even when the 
                 data shows that trust within coworkers may not be as strong.")
             )
             )
  ),
  
  # The fifth tab of the user i
  tabPanel('Treatments Effect on Work',
           titlePanel('How Important is Treatment?'),
           mainPanel(
             plotlyOutput('treatment'),
             br(),
             h2('Good Treatment is Beneficial to Work Efficiency', align = 'center'),
             p('According to the survey results, one can interpret the data to represent different scenarious involving 
               employees and mental health issues. This is imporant when looking at the data and drawing the following 
               conclusion: A worker who fails to receive the proper treatment for their health issues may be subject to 
               inadequate work performance. This is because the mental health issue is more than likely to become a 
               continuous/reoccuring problem for the individual if left untreated. The difference in receiving treatment,
               however, is that workers would actively be aware of their behaviors, and any minor issue that may occur 
               would be rare as opposed to being a day-to-day issue within the workplace.')
            )
  ),
  
  # The sixth tab of the user interface
  tabPanel('Documentation',
           titlePanel(''),
           #sidebarLayout(
            #sidebarPanel(),
            mainPanel(h2("Team Members", align = 'center'),
                       h4("  Ivan Mireles", align = 'center'),
                       h4("  Drew Gallardo", align = 'center'),
                       h4("  William Abuassi", align = 'center'),
                       h4("  Sitong Wu", align = 'center'),
                      HTML('<center><img src="OSMI.png" width="200"></center>'),
                      br(),
                      p('The research was conducted by the OSMI help organization. To view a more about their research
                        you can view the link below:', align = 'center'),
                      HTML('<center><a href="https://www.kaggle.com/osmi/mental-health-in-tech-2016">Mental Health in Technology Field</a></center>'),
                      br(),
                      p('To view our source code on Github click the link below', align = 'center'),
                      HTML('<center><a href="https://github.com/SageModeWill/final-project-team-dynamite/">Team Dynamite</a></center>')
          )
  )
))

