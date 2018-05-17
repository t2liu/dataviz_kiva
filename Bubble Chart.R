library(plotly)

Sys.setenv("plotly_username"="t2liu")
Sys.setenv("plotly_api_key"="lTbNwAyxLOCeOxmJCVtX")

data <- read.csv('/Users/ting2liu/msan622/dataviz_kiva/forBubblePlot3.csv', header=TRUE, sep=",")

f1 <- list(
  family = "Arial, sans-serif",
  size = 18,
  color = "lightgrey"
)

x_label <- list(
  title = "Average Loan Length",
  titlefont = f1
)

y_label <- list(
  title = "Average Loan Amount",
  titlefont = f1
)

pal <- c("red", "blue")

p <- data %>%
  plot_ly(
    x = ~avg_lender_count, 
    y = ~avg_loan_amount,
    size = ~size,
    color = ~gender_group,
    colors = pal,
    frame = ~year, 
    text = ~size,
    hoverinfo = "text",
    type = 'scatter',
    mode = 'markers'
  ) %>%
  layout(
    xaxis = x_label,
    yaxis = y_label
  )

chart_link = api_create(p, filename="animations-bubble")

chart_link
