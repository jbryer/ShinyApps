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
    print(pbase + geom_point())
    
  })

})