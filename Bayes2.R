# Start a shiny app
library(shiny)

# Define UI for application that draws a histogram
ui <- pageWithSidebar(
   
   # Application title
   headerPanel("Bayes' Theorem 2.0"),
   # Authors and title
   titlePanel("Nora Krebs and Rebecca Amberger"),
   #Date
   titlePanel("26/11/2018"),
   
   # Task discription
   pre("Magician Michelle says that she can predict large megathrust earthquakes. well, at least 95% of the time. 
Assume that these earthquakes occur with a probability of 10^(???5). How likely will Michelle cause a false alarm with her next prediction?"),
   
   # Sidebar with a slider input for number of Prediction Rate 
   sidebarLayout(
      sidebarPanel(
         sliderInput("Prediction Rate",
                     "Prediction Rate [%]:",
                     min = 0,
                     max = 100,
                     value = 95)
      ),
      
        # Show a plot of the generated distribution
     mainPanel(
       plotOutput("distPlot")
     )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate "Prediction Rate" based on input$"Prediction Rate" from ui.R
      x    <- faithful[, 2] 
      "Prediction Rate" <- seq(min(x), max(x), length.out = input$"Prediction Rate" + 1)
      
      # draw the histogram with the specified number of "Prediction Rate"
      hist(x, breaks = "Prediction Rate", col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

