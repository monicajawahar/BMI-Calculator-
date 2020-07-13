#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    values <- reactiveValues()
    
    observe({
        input$FindBMI
        values$bmi <- isolate({
            
            input$ing_weight_kg/(input$int_height_cm/100 * input$int_height_cm/100)
            
            
            
        })
    })
    
    
    
    # Display your current values
    output$current_height <- renderText({
        input$FindBMI
        paste("Current Height in CM :", isolate(input$int_height_cm))
    })
    
    output$current_weight <- renderText({
        input$FindBMI
        paste("Current Weight in KG : ", isolate(input$ing_weight_kg))
    })
    
    
    output$status_indicator <- renderText({
        
        
        if(input$FindBMI == 0) ""
        else {
            
            if (values$bmi < 18.5)
            {
                values$status_indicator = "Underweight"
                
            }
            
            else if (values$bmi < 24.9)
            {
                values$status_indicator="Normal weight"
            }
            else if (values$bmi < 29.9)
            {
                values$status_indicator="Overweight"
            }
            else
            {
                values$status_indicator="Obesity"
            }
            
            
            paste("Classification according to BMI: ", values$status_indicator)
        }
    })
    
    
    # Display your BMI
    
    output$BMI_result <- renderText({
        if(input$FindBMI == 0) ""
        else
            paste("Your current BMI is:", values$bmi)
    })
    
    
    
    
    
    
})
