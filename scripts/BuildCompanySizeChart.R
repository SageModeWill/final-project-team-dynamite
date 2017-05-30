library(dplyr)
library(plotly)

df <- read.csv(file = './data/mental-heath-in-tech-2016_20161114.csv', stringsAsFactors = FALSE)


company.size.vs.mental <- df %>% 
  select(How.many.employees.does.your.company.or.organization.have.,
         Would.you.feel.comfortable.discussing.a.mental.health.disorder.with.your.coworkers.) %>% 
  arrange(How.many.employees.does.your.company.or.organization.have.) %>% 
  group_by(How.many.employees.does.your.company.or.organization.have.)

employee.vs.comfort.chart <- plot_ly(data = company.size.vs.mental, x = ~, y = eval(parse(text = y.equation)), 


  

