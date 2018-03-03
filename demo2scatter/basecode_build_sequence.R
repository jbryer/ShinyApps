#Base code for scatterplot
# now do the same series of ggplot 2 scatterplots using the old faithful data set
require(ggplot2)
data(faithful)
#create base graph entity wthout displaying anything
pbase <- ggplot(faithful, aes(x=eruptions,y=waiting))
#display the scatterplot with the data points
win.graph()
pbase + geom_point()
# add a 2D density using contour lines
win.graph()
pbase + geom_point() + stat_density2d(col="skyblue")
# or map the height of the density curve to a color progression using rasterization
win.graph()
pbase + geom_point() +
  stat_density2d(aes(fill=..density..), geom="raster",contour=FALSE)
# or map the height of the density curve to a color progression using rasterization plus points
win.graph()
pbase +
  stat_density2d(aes(fill=..density..), geom="raster",contour=FALSE) +
  geom_point(colour="gold",size=1)
# or, do it with points and map density a different way
win.graph()
pbase + geom_point() +
  stat_density2d(aes(alpha=..density..), geom="tile",contour=FALSE)

	  
##############################################################################
#  code sections to use in four steps to "building" the app
##############################################################################
#1. Draw the base scatterplot and render its display in the ui.R mainPanel
#   In server.R:
# use Old Faithful Data set
data(faithful)

output$scatter <- renderPlot({
  #create base graph entity wthout displaying anything
  pbase <- ggplot(faithful, aes(x=waiting,y=eruptions))
  #display the scatterplot with the data points
  print(pbase + geom_point())
  
})

# in ui.R mainPanel section:
h3("Old Faithful Geyser Data Set"),
h4("Eruption Duration (eruptions) vs Eruption Interval (waiting)"),
plotOutput("scatter")
##############################################################################  
#2.  Now contemplate a user interface for choosing among scatterplot types
# use radio buttons to structure this control
# in ui.R sidebarPanel:
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


##############################################################################
#3.  Now change the renderPlot do react to input changes in the radiobuttons and
#    draw the selected plots
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
})
  
##############################################################################
# 4.  Change aspect ratio of figures using height and width controls in renderPlot

,height=500,width=500


