library(shiny)
shinyServer(function(input, output){
  output$review <- renderText({
    paste(input$who,
          "thinks shiny is", input$rating)
  })
})
