##UI asks for a date range, shows selected range and total number of Fatalities and Injuries
##for given range. If range is invalid (end date before start date) it gives a warning.

shinyUI(
     pageWithSidebar(
          # Application title
          headerPanel("Total Deaths and Injuries from NOAA Severe Weather Database"),
          
               sidebarPanel(
               h4("Enter a Date range and hit SUBMIT to see the total Fatalities and Injuries"),
               dateRangeInput("daterange", "Date range:", startview = "year",
               start = "1950-01-01",
               end   = "1950-01-01",
               max = "2011-12-31",
               min = "1950-01-01"),
               submitButton('Submit')
          ),
          mainPanel(
               h3('Mortality and Injuries'),
               h4('For the dates '),
               verbatimTextOutput("daterange"),
               h4('Total Mortality:  '),
               verbatimTextOutput("mortality"),
               h4('Total Injuries:  '),
               verbatimTextOutput("injuries")
          )
     )
)