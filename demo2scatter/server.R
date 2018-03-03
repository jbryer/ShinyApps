library(shiny)
library(datasets)
require(ggplot2)
# Define server logic required create and view the plot
shinyServer(function(input, output) {
  
  # use Old Faithful Data set
  data(faithful)
  
  output$scatter <- renderPlot({
    #create base graph entity wthout displaying anything
    pbase <- ggplot(faithful, aes(x=waiting,y=eruptions))
    #display the scatterplot with the data points
    if(input$xy == "base")
      print(pbase + geom_point())
    if(input$xy == "contour")
      print(pbase + geom_point() + stat_density2d(col="skyblue"))
    if(input$xy == "raster1")
      print(pbase 
            + stat_density2d(aes(fill=..density..), geom="raster",contour=FALSE))
    if(input$xy == "raster2")
      print(pbase 
            + stat_density2d(aes(fill=..density..), geom="raster",contour=FALSE)
            + geom_point(colour="gold",size=1))
    if(input$xy == "tile")
      print(pbase + geom_point() +
              stat_density2d(aes(alpha=..density..), geom="tile",contour=FALSE))
  },height=500,width=500)
  

})