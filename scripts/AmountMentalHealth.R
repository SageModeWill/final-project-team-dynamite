library(dplyr)
library(shiny)
library(plotly)
library(stringr)


#Reads in csv
mental.health <- read.csv('./data/mental-heath-in-tech-2016_20161114.csv', stringsAsFactors = FALSE)


# Groups Gender data by yes's and freq
gender.data <- aggregate(rep(1, length(mental.health$What.is.your.gender.)),
                                by=list(mental.health$What.is.your.gender., mental.health$Do.you.currently.have.a.mental.health.disorder.), sum)

# Narrows dataset to where you work, and having a mental health disorder
work.places <- mental.health %>% 
  select(What.country.do.you.work.in., Do.you.currently.have.a.mental.health.disorder.)

# Groups dataset by country then counting the answers submitted on if they currently have a mental health disorder
work.places.by.country <-
  work.places %>% group_by(What.country.do.you.work.in.) %>% 
  count(Do.you.currently.have.a.mental.health.disorder.)

# Creates Bar chart for countries vs having a mental disorder
AmountMentalHealth <- function (country) {
  country.looking.for <- work.places.by.country %>% 
    filter(What.country.do.you.work.in. == country)
  
  p <- plot_ly(country.looking.for, x = ~Do.you.currently.have.a.mental.health.disorder.,
               y = ~n, type = 'bar', name = 'testing') %>%
    layout(title = country, yaxis = list(title = 'Number of People'), 
           xaxis = list(title = 'Do you currently have a mental health disorder?'), 
           barmode = 'group')
  
  return(p)
}
  