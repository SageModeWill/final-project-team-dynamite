# ui.R
library(shiny)
library(plotly)
library(shinythemes)

shinyUI(navbarPage("Mental Health in the Tech World",
                   theme = shinytheme("yeti"),
  tabPanel('Overview',
             mainPanel(
               HTML('<left><img src="mhData.png" width="300"></left>'),
               br(),
                h3("Project Description"),
               p('The research was conducted by the OSMI help organization. To view a more about their research you can view the link below:'),
               p('www.kaggle.com/osmi/mental-health-in-tech-2016'),
               br(),
               p('This webpage will allow our target audience to more easily read data, and visualize the effects that mental illness
                  can have on employees. It is also helpful in allowing users to look into different resources for mental illness. This is particularly
                  important for managers when deciding what teams would be most apt in working together. Another concern that this program brings up,
                  however, is the fact that employer may be able to see mental disorders in applicants and make judgements before qualifying them for
                  their skills as opposed to their illnesses. They may also be able to categorize the different countries that alienate employees based 
                 off of their illnesses and find ways to counter these actions through their own work environments. One of the most prevalent questions, 
                 however, may involve asking employees if they are aware of all he services and resources that can be provided, given he situation where 
                 someone does have a mental illness that needs to be treated')
            )
         
  ),
  tabPanel('Data Source',
           titlePanel('Where is our data coming from? '),
           
           mainPanel(
             plotlyOutput('WorldMap'),
             plotlyOutput('AmericaMap')
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
  tabPanel('Treatments Effect on Work',
           titlePanel('How Important is Treatment?'),
           mainPanel(
             plotlyOutput('treatment'),
             br(),
             h2('Treatments is Beneficial to Work Efficiency', align = 'center'),
             p('According to the survey results, one can interpret the data to represent different scenarious involving 
               employees and mental health issues. This is imporant when looking at the data and drawing the following 
               conclusion: A worker who fails to receive the proper treatment for their health issues may be subject to 
               inadequate work performance. This is because the mental health issue is more than likely to become a 
               continuous/reoccuring problem for the individual if left untreated. The difference in receiving treatment,
               however, is that workers would actively be aware of their behaviors, and any minor issue that may occur 
               would be rare as opposed to being a day-to-day issue within the workplace.')
            )
  ),
  tabPanel('Documentation',
           titlePanel(''),
           #sidebarLayout(
            #sidebarPanel(),
            mainPanel(h2("Team Members", align = 'center'),
                       h4("  Ivan Mireles", align = 'center'),
                       h4("  Drew Gallardo", align = 'center'),
                       h4("  William Abuassi", align = 'center'),
                       h4("  Sitong Wu", align = 'center'),
                      br(),
                      HTML('<center><img src="OSMI.png" width="200"></center>'),
                      br(),
                      p('The research was conducted by the OSMI help organization. To view a more about their research you can view the link below:', align = 'center'),
                      HTML('<center><a href="https://www.kaggle.com/osmi/mental-health-in-tech-2016">Mental Health in Technology Field</a></center>')
                      
          )
  )
))

