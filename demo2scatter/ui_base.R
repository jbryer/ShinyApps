require(shiny)

# Define UI Scatterplot Graph View
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Bivariate Scatterplot"),
  sidebarPanel(
# put shiny user interface code here

    ),
  mainPanel(
    h3("Old Faithful Geyser Data Set"),
    h4("Eruption Duration (eruptions) vs Eruption Interval (waiting)"),
    plotOutput("scatter")
    
  )
))
