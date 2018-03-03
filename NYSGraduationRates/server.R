shinyServer(function(input, output) {
   
  output$gradPlot <- renderPlot({
  	school <- grad.schools[grad.schools$AGGREGATION_NAME == input$school,]
  	
  	ggplot(school, aes(x = SUBGROUP_NAME, y = GradRate)) + 
  		geom_bar(stat = 'identity') + 
  		coord_flip() + ylim(c(0,100)) +
  		xlab('') + ylab('Graduation Rate')
  })
  
  output$gradTable <- renderTable({
  	school <- grad.schools[grad.schools$AGGREGATION_NAME == input$school,]
  	school[,c('SUBGROUP_NAME', 'GradRate')]
  })
})
