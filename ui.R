library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Correlation example plot"),
  sidebarPanel(
    h4("We use Galton data for illustration of the mean square error for different linear regression coefficients and intercepts."),
    h4("Guess at an intercept and a coefficient and see the resulting regression line and the recomputed mean squared error"),
    sliderInput('coef', 'Guess at the regression coefficient',value = 0.5, min = 0, max = 1, step = 0.05),
    numericInput('intercept', 'Guess at the regression intercept', 30, min=0, max=70, step=1),
    textOutput('newText'),
    h4("You can also show the optimal regression line by checking the checkbox."),
    checkboxInput('ideal', 'Show real regression line')
  ),
  mainPanel(
    plotOutput('newHist')
  )
))