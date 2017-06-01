library(dplyr)
library(plotly)

# 
BuildCompanySizeChart <- function(data, shared) {
  
  # making all blank data points say "NA" for future use 
  df <- read.csv(file = './data/mental-heath-in-tech-2016_20161114.csv', stringsAsFactors = FALSE, na.strings = c("", "NA"))
  
  #intitally getting desired data and renaming for eaiser use
  target.df <- df %>% 
    select_("How.many.employees.does.your.company.or.organization.have.", shared) %>% 
    na.omit() %>% 
    rename_(CompanySize = "How.many.employees.does.your.company.or.organization.have.", Response = shared) %>% 
    arrange(CompanySize) %>% 
    group_by(CompanySize)
  
  # filtering the "Maybe" responses
  maybe.data <- target.df %>% 
    filter(Response == 'Maybe') %>% 
    tally() %>% 
    rename(Maybe = n)
  
  # Filtering the "Yes" responses
  yes.data <- target.df %>% 
    filter(Response == 'Yes') %>% 
    tally() %>% 
    rename(Yes = n)
  
  # filtering the "No" responses 
  no.data <- target.df %>% 
    filter(Response == 'No') %>% 
    tally() %>% 
    rename(No = n)
  
  # combining all the data counts into single dataframe
  combined.data <- full_join(yes.data, no.data, by = "CompanySize") %>% 
    full_join(., maybe.data, by = "CompanySize") 
  
  # gathering the final data in the correct order
  final.data <- combined.data[c(1, 5, 3, 2, 4, 6),]
  test.data <- final.data$CompanySize
  
  # creating a bar chart that shows data based on response 
  p <- plot_ly(data = final.data, x = test.data, 
               y = ~Yes, name = "Yes",
               type = "bar") %>% 
    add_trace(y = ~No, name = "No") %>% 
    add_trace(y = ~Maybe, name = "Maybe") %>% 
    layout(yaxis = list(title = 'Count of Responses'),
           xaxis = list(title = '# Employees in Company'),
           barmode = "group",
           title = 'Company Size vs. Sharing Mental Health',
           margin = list(b = 60))
  
  return(p)
}


  

