# must have the shiny library as this is core to functionality
library(shiny)

# Define UI for plot viewer
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Simple Histogram Demo"),
    
    # Sidebar with controls to provide an x attribute selection
    # based upon the columns from the mtcars dataset
    sidebarLayout(
        sidebarPanel(
            helpText("The Shiny App will display a histogram using the mtcars dataset.
You may select any attribute from the mtcars dataset for producing the histogram. 
The minimally formatted plot shall update automatically upon selection of the attribute."),
            br(),
            selectInput("xVar", "Select attribute to plot as Histogram",
                         choices = colnames(mtcars))
        ),
        
        
        # Show the caption with selected x attribute
        # and the plot based upon selected x attribute
        mainPanel(
            h3(textOutput("caption", container = span)),
            
            plotOutput("plot")
        )
    )
))
