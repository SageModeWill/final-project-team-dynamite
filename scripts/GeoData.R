library(dplyr)
library(plotly)

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
      title = 'Where is our data comming from ?',
      geo = g
    )
  
  return(p)
}




