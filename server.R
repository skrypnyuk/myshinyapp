library(UsingR)
data(galton)

shinyServer(
  function(input, output) {
    output$newHist <- renderPlot({
      plot(galton$parent, galton$child, xlab='parent height', ylab='child height', col=rgb(0,0,0,alpha=0.3),main='Parent hight vs child hight')
      coef <- input$coef
      intercept<-input$intercept
      lines(c(min(galton$parent), max(galton$parent)), c(intercept+coef*min(galton$parent), intercept+coef*max(galton$parent)),col="red",lwd=5)
    
      ideal<-input$ideal
      idealcoef<-lm(galton$child~galton$parent)$coef[2]
      idealintercept<-lm(galton$child~galton$parent)$coef[1]  
      if (ideal) lines(c(min(galton$parent), max(galton$parent)), c(idealintercept+idealcoef*min(galton$parent), idealintercept+idealcoef*max(galton$parent)),col="green",lwd=5)
      
      mse <- mean((galton$child - intercept+coef*galton$parent)^2)
    })
    output$newText<-renderText({paste("Mean square error = ", round(mean((galton$child - input$intercept-input$coef*galton$parent)^2), 2))})
  }
)