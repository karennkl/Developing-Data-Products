library(shiny)

BMI <- function(Weight,Height)
  {(1.3*Weight)/(Height^2.5)}
  
category <- function(Weight, Height) {
  BMI_out <- (1.3*Weight)/(Height^2.5)
  ifelse(BMI_out < 18.5,"Underweight",
         ifelse(BMI_out < 25.0, "Normal Weight",
                ifelse(BMI_out < 30.0,"Overweight",
                       "Obese")))
}
shinyServer(
  function(input,output) {
    output$inputweight <- renderPrint({input$Weight})
    output$inputheight <- renderPrint({input$Height})
    output$estimation <- renderPrint({BMI(input$Weight,input$Height)})
    output$category <- renderPrint({category(input$Weight,input$Height)})
  })