# must have the shiny library as this is core to functionality
library(shiny)
# the datasets library is required for producing the necessary data for charts
library(datasets)

# Define server logic required to summarize and view the selected
shinyServer(function(input, output) {
    
    # plotExpression function generates the histogram plot
    # based upon the selected x attribute at the time of selection
    plotExpression <- reactive({
        xData <- switch(input$xVar,
                    "mpg"=mtcars$mpg
                    , "cyl"=mtcars$cyl
                    , "disp"=mtcars$disp
                    , "hp"=mtcars$hp
                    , "drat"=mtcars$drat
                    , "wt"=mtcars$wt
                    , "qsec"=mtcars$qsec
                    , "vs"=mtcars$vs
                    , "am"=mtcars$am
                    , "gear"=mtcars$gear
                    , "carb"=mtcars$carb
                    )
        
        hist(x=xData, xlab=input$xVar)
    })
    
    # The output$caption is computed based on a reactive expression
    # that returns the selected x attribute appended to explicit text
    output$caption <- renderText({
        paste("Histogram of mtcars: ", input$xVar, sep=" ")
    })
    
    # The output$plot is a supplied via a function: plotExpression
    output$plot <- renderPlot({
        expr <- plotExpression()
    })
})
