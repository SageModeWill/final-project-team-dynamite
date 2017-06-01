# ui.R
library(shiny)
library(plotly)
library(shinythemes)

shinyUI(navbarPage("Mental Health in the Tech World",
                   theme = shinytheme("yeti"),
  tabPanel('Overview',
             mainPanel(
               img(src = "OSMI.png", width = 300, height = 300),
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
               h2("Data Insights", align = "center"),
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
            mainPanel(h3("Team members", align = 'center'),
                       h4("  Ivan Mireles", align = 'center'),
                       h4("  Drew Gallardo", align = 'center'),
                       h4("  William Abuassi", align = 'center'),
                       h4("  Sitong Wu", align = 'center')
          )
  )
))

