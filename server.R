library(shiny)
library(dplyr)
data("iris")
shinyServer(function(input, output) {
    
    myData <- reactive({
        if(input$chooseSpecies == "all"){
            iris
        }else{
            subset(iris, Species == input$chooseSpecies)
        }
    })

    model <- reactive({lm(Petal.Length ~ Sepal.Length, data = myData())})
    
    modelpred <- reactive({
        sepalInput <- input$sliderSepalLength
        predict(model(), newdata = data.frame(Sepal.Length = sepalInput))
    })
    
    output$plot <- renderPlot({
        sepalInput <- input$sliderSepalLength
        plot(iris$Sepal.Length, iris$Petal.Length, xlab = "sepal length",
             ylab = "petal length", bty = "n", pch = 16,
             xlim = c(3, 10), ylim = c(0, 10))
        if(input$showModel){
            abline(model(), col = "red", lwd = 2)
        }
        points(sepalInput, modelpred(), col = "red", pch = 16, cex = 2)
    })
    
    output$pred <- renderText({
        modelpred()
    })

})
