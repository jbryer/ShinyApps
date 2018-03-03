shinyUI(fluidPage(
  titlePanel("NYS Graduation Rates"),
  
  sidebarLayout(
    sidebarPanel(
    	selectInput(inputId = 'school',
    				label = 'School',
    				choices = unique(grad.schools$AGGREGATION_NAME))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
    	tabsetPanel(
    		tabPanel('Plot', plotOutput("gradPlot")),
    		tabPanel('Table', tableOutput('gradTable'))
    	)
    )
  )
))
