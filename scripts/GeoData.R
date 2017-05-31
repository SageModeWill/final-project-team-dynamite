library(dplyr)
library(plotly)
library(countrycode)

data.geo.america <- function(df){
  
  geo.america <- df %>% filter(What.US.state.or.territory.do.you.work.in. != "") %>% group_by(What.US.state.or.territory.do.you.work.in.) %>% summarise(n = n())
  
  geo.america <- geo.america %>% mutate(state = state.abb[match(geo.america$What.US.state.or.territory.do.you.work.in., state.name)]) %>% filter(state != "")
  
  geo.america$hover <- with(geo.america, paste("surveys from", What.US.state.or.territory.do.you.work.in., '<br>'))
  
  l <- list(color = toRGB("white"), width = 2)
  
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
  )
  
  p <- plot_geo(geo.america, locationmode = 'USA-states') %>%
    add_trace(
      z = ~n, text = ~hover, locations = ~state,
      color = ~n, colors = 'Purples'
    ) %>%
    colorbar(title = "Amount of Survey") %>%
    layout(
      title = 'American Map for the Data Source',
      geo = g
    )
  
  return(p)
}

data.geo.world <- function(df){
  geo.world <- df  %>% group_by(What.country.do.you.work.in.) %>% summarise(n = n())
  
  geo.world <- geo.world %>% mutate(code = countrycode(geo.world$What.country.do.you.work.in., "country.name", "iso3c" )) %>% filter(code != "")
  
  l <- list(color = toRGB("grey"), width = 0.5)
  
  g <- list(
    showframe = FALSE,
    showcoastlines = FALSE,
    projection = list(type = 'Mercator')
  )
  
  p <- plot_geo(geo.world) %>%
    add_trace(
      z = ~n, color = ~n, colors = 'Blues',
      text = ~What.country.do.you.work.in., locations = ~code, marker = list(line = l)
    ) %>%
    colorbar(title = 'Amount of Survey') %>%
    layout(
      title = 'World Map for the Data Source',
      geo = g
    )
  return(p)
}





