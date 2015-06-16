setwd("C:/Users/DLeddy/Documents/RepData")
fullstorm<-read.csv("./repdata-data-StormData.csv")  ## Took 90 seconds to read in
setwd("C:/Users/DLeddy/Documents/DataProducts")

library(dplyr);library(knitr)
storm<-select(fullstorm, c(BGN_DATE, STATE, EVTYPE, END_DATE, FATALITIES,INJURIES))

##Only 1/30 or so of the rows have any damage to  people.
##Eliminate rows with no damage and write back out smaller file: 
storm <- subset(storm, !(FATALITIES == 0 & INJURIES == 0))
storm$BGN_DATE<-as.character(storm$BGN_DATE)
storm$BGN_DATE<-as.Date(storm$BGN_DATE, format="%m/%d/%Y") ##as.Date(maxtable$BGN_DATE, format="%m/%d/%Y")
write.csv(storm, "smallstorm.csv")
