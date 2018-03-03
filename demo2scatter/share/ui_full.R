require(shiny)

# Define UI Scatterplot Graph View
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Bivariate Scatterplot"),
  sidebarPanel(
    helpText("Choose an alternative plot type and then press Update View"),
    radioButtons("xy", "Scatterplot type:",
                 list("Basic with points" = "base",
                      "Points plus 2D contours" = "contour",
                      "Rasterized 2D Density" = "raster1",
                      "Points plus Rasterized 2D Density" = "raster2",
                      "Points plus tiled 2D Density" = "tile")),
    submitButton("Update View"),
    br(),
    helpText("Note: These graphs are produced with the ggplot2 package in R")
  ),
  mainPanel(
    h3("Old Faithful Geyser Data Set"),
    h4("Eruption Duration (eruptions) vs Eruption Interval (waiting)"),
    plotOutput("scatter")
  )
))
