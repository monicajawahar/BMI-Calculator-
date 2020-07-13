#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    titlePanel("BODY MASS Index Calculator"),
    
    sidebarLayout(
        sidebarPanel( 
            
            helpText("BMI Index is common measure for health, this application helps you find it out"),            
            br(),           
            numericInput("ing_weight_kg",label = h4("How much do you weight (KG)"),min = 40, max = 300,0), #, value = 70
            br(),
            numericInput("int_height_cm",label = h4("What is your height (CM)"),min = 50, max = 250,0), #,value = 170
            br(),
            
            br(),   
            actionButton("FindBMI", label = "Your BMI is")    
            
            
        ),
        mainPanel
        (
            tabsetPanel
            (
                tabPanel("Find out you BMI",
                         p(h4("Here are your current measures:")),
                         textOutput("current_height"),
                         textOutput("current_weight"),
                         br(),
                         p(h4("Your BMI is displayed below:")),
                         textOutput("BMI_result"),
                         p(h4("Your BMI classification is:")),
                         textOutput("status_indicator")
                         
                ),
                tabPanel(
                    "Documentation",
                    p(h4("Body Mass Index Application")),
                    br(),
                    helpText("This simple application calculates a person BMI based on current weight and height"),
                    p(h3("Why is BMI important?")),
                    helpText("BMI tells you if you weight is normal, underweight or overweight is a common measure used by doctor to have a parameter about a person health")
                )
                
                
            )
        )
    )
))
