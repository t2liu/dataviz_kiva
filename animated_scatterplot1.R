library(plotly)
library(gapminder)

Sys.setenv("plotly_username"="ktollas")
Sys.setenv("plotly_api_key"="ksy115MKXGWMl1vjEx4h")

data <- read.csv('/Users/ting2liu/msan622/loans_final.csv', header=TRUE, sep=",")

p <- data %>%
  plot_ly(
    x = ~size, 
    y = ~mean, 
    color = ~gender_group, 
    frame = ~year, 
    text = ~sector,
    hoverinfo = "text",
    type = 'scatter',
    mode = 'markers'
  ) %>%
  layout(
    xaxis = list(
      type = "log"
    )
  )

chart_link = api_create(p, filename="animations-scatter1")

chart_link
