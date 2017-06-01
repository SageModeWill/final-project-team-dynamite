library(plotly)
library(dplyr)

# Takes in the data frame of survey results
CreatePlot <- function(df){
  
# Gets the count of each response and adds them up into a dataframe 
survey_effective <- df %>% 
  select(If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.being.treated.effectively.) %>% 
  group_by(If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.being.treated.effectively.) %>% 
  summarize(num = n())

# Adds up the responses of the second question and tallies them up into a dataframe
survey_not_effective <- df %>% 
  select(If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.NOT.being.treated.effectively.) %>% 
  group_by(If.you.have.a.mental.health.issue..do.you.feel.that.it.interferes.with.your.work.when.NOT.being.treated.effectively.) %>% 
  summarize(numtwo = n())

# Renames the responses for the dataframe in order to join 
names(survey_effective)[1] = 'responses'
names(survey_not_effective)[1] = 'responses'

# created a new dataframe of the joined results
results <- full_join(survey_effective, survey_not_effective, by = 'responses')

# Create a plotly chart using the joined dataframe of the respones vs the mental treatment, and returns it
chart <- plot_ly(data = results, x = ~responses, y = ~num, type = 'bar', name = 'Do you feel your mental health issue interferes with work when being treated effectively') %>% 
  add_trace(y = ~numtwo, name = 'Do you feel your mental health issue interferes with work when not being treated effectively') %>% 
  layout(xaxis = list(title = 'Responses'), yaxis = list(title = 'Number of responses'), title = 'If Mental Issue is Treated Effectively Does It Interfere With Work?')

return(chart)
}



