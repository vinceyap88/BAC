# server.R
# Blood Alcohol Concentration (BAC) Calculator

library(shiny)

BAC <- function(Weight, Gender, GenderFrac, Hours, Volumes, ABV ) {
    Volumes*ABV/100*5.14/(Weight*GenderFrac)-(0.015*Hours)
}

GenderFraction <- function(Gender) {
    ifelse(Gender=="female", 0.73, 0.66)
}

server <- function(input, output) {
    output$inputValueWeight <- renderPrint({input$Weight})
    output$inputValueGender <- renderPrint({input$Gender})
    output$inputValueGenderFrac <- renderPrint({GenderFraction(input$Gender)})
    output$inputValueHours <- renderPrint({input$Hours})
    output$inputValueVolumes <- renderPrint({input$Volumes})
    output$inputValueABV <- renderPrint({input$ABV})    
    output$BACCalculation <- renderPrint({BAC(input$Weight, input$Gender, GenderFraction(input$Gender), input$Hours, input$Volumes, input$ABV)})
}
