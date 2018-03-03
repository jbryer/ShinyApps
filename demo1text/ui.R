library(shiny)
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Simple Shiny Demo: Text"),
  
  # Sidebar with controls 
  # one control for first word (enter text in text box)
  # one control for last phrase (select the input)
  sidebarPanel(
  textInput("who", "Reviewed by", "none of us"),
  selectInput("rating", "Rating",
              c("Hard", "Easy", "Lame", "The Coolest Thing Ever!"))
  ),
  
  # Main Panel setup prints the text output from server.R
  mainPanel(
  h3(textOutput("review"))
  )
  ))

