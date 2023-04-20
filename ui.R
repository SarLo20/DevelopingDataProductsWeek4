library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict petal length from sepal length"),
    sidebarLayout(
        sidebarPanel(
            h2("Documentation"),
            h5("With this app you can predict the petal length from the sepal length.
               The R dataset 'iris' with a linear regression model are used.
               Use the slider to choose a certain sepal length. 
               Within the drop down menu you can choose which species are
               considered for the model (options: all, setosa, versicolor, virginica).
               To see the result press the 'Submit' button."),
            h2("User input"),
            sliderInput("sliderSepalLength", "Choose the sepal length", 4, 9, value = 6, step = 0.1),
            selectInput("chooseSpecies", "Choose species", choices = c("all",
                                                                       "setosa", 
                                                                       "versicolor", 
                                                                       "virginica")),
            checkboxInput("showModel", "Show/Hide Model", value = TRUE),
            submitButton("Submit"),
        ),
        mainPanel(
            plotOutput("plot"),
            h3("Predicted petal length from sepal length"),
            textOutput("pred"),
        )
    )
))