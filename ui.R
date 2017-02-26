library(shiny)

# Define UI for BMI application 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("New Body Mass Index (BMI) Calculator"),
  
  sidebarPanel( h4("Your Body Weight and Height"),
                numericInput('Weight','Input your weight in kilogram (kg)', 50, min = 10, max = 500, step = 0.01),
                numericInput('Height','Input your height in meter (m)', 1.60, min = 0.2, max =2.5, step= 0.01),
                submitButton('Calculate New BMI!'),
                br(),
                h4("Classification of BMI by WHO"),
                tags$div( tags$ul (tags$li('BMI < 18.5        : Underweight'),
                          tags$li('BMI [18.5 - 24.9]          : Normal Weight'),
                          tags$li('BMI [25.0 - 29.9]          : Overweight'),
                          tags$li('BMI >= 30.0                : Obese')))
              ),
    
  mainPanel(tabsetPanel(tabPanel("Results",

   h4('Your new BMI is:'), verbatimTextOutput("estimation"),
   h4('You are classified as'),verbatimTextOutput("category"),
   br(),
   h4('These results are based on your inputs'),
   p('Input Weight:'), verbatimTextOutput("inputweight"),
   p('Input Height:'), verbatimTextOutput("inputheight")
   ),
   
   tabPanel("About",
   br(),
   p('Users are required to input their height(m) and body weight(kg) to acquire the classification of their BMI scores.'),
   br(),
   p('This application is based on the revised BMI formula, proposed by a group of researchers at Oxford University in 2013, where'),
   p(strong(' BMI = 1.3 * weight(kg) / height(m) ^ 2.5 '))
   )))))
  