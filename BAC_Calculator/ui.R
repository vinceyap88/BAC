# ui.R
# Blood Alcohol Concentration (BAC) Calculator

library(shiny)

pageWithSidebar(
  # Application title
  headerPanel("Blood Alcohol Concentration (BAC) Calculator"),
  sidebarPanel(
    numericInput('Weight', 'Body weight (pounds)', 55, min = 10, max = 300, step = 1
    ),
    radioButtons("Gender", "Gender",
                 c("Female" = "female",
                   "Male" = "male")),
    numericInput('Hours', 'Hours consuming drink(hours)', 2, min = 1, max = 48, step = 1),
    numericInput('Volumes', 'Volume of the drink(ounces)', 20, min = 1, max = 100, step = 1),
    numericInput('ABV', '% Alcohol By Volume(ABV)', 10, min = 1, max = 100, step = 1
    ),
    h4("Tips to use this application"),
    p("Please enter the respective body weight, gender, hours consuming drink, volume of the drink and % alcohol by volume."),
    p("The entered values and the calculated result will be immediately shown in the main panel.")      
  ),
  mainPanel(
    p("These BAC estimates are provided for educational purposes only. BAC is the concetration of alcohol in a person's blood. The formula of the BAC calculation is:"),
    p("Volume of the Drink x Alcohol By Volume x 5.14/(Body Weight * Gender Fractoin) - Average Alcohol Elimination Rate * Hours consuming drink"),
    p("Where Average Alcohol Elimination Rate = 0.015 and 5.14 is a mathematical conversion factor(.823x100/16) used to convert liquid ounces to reqular weighted ounces, with the 100 used to convert the final value to percentage, and lastly 16 is used to convert lbs to ounces. "),
    h3('Results of BAC Calculation'),
    h4('You entered Weight (pound)'),
    verbatimTextOutput("inputValueWeight"),
    h4('You entered Gender (female/male)'),
    verbatimTextOutput("inputValueGender"),
    h4('The Gender Fraction'),
    verbatimTextOutput("inputValueGenderFrac"),
    h4('You entered Hours Consuming Drink (hours)'),
    verbatimTextOutput("inputValueHours"),
    h4('You entered Volumes of the Drink(ounces)'),
    verbatimTextOutput("inputValueVolumes"),
    h4('You entered Alcohol By Volume(%)'),
    verbatimTextOutput("inputValueABV"),
    h4('BAC Result = (Volume*ABV*5.14/(Weight*Gender Fraction)-(0.015*Hours)) :'),
    verbatimTextOutput("BACCalculation")
  )
)


