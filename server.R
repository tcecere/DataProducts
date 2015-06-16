##Server code reads in abridged NOAA storm data that just has fatalities and injuries,
##and then converts the date character string for comparison to user input.
##It then does a simple total of Fatalities and Injuries for the requested dates.

library(dplyr)
storm_data<-read.csv("smallstorm.csv", stringsAsFactors = FALSE)
storm_data$BGN_DATE<-as.Date(storm_data$BGN_DATE, format="%m/%d/%Y")

shinyServer(
     function(input, output) {
          output$mortality <- renderText({sum(storm_data$FATALITIES[storm_data$BGN_DATE > input$daterange[1] & storm_data$BGN_DATE < input$daterange[2]])})
          output$injuries <- renderText({sum(storm_data$INJURIES[storm_data$BGN_DATE > input$daterange[1] & storm_data$BGN_DATE < input$daterange[2]])})
          output$daterange <- renderPrint({
               ##Warn when date range is invalid
               if (input$daterange[1]>input$daterange[2]) "End date must come before Start Date"
               else input$daterange
          })
          
     }
)

