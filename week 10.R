library(tidyverse)
library(ggplot2)
data <-read_csv("GaF Plant Height.csv")
select(data,'Rate','Unit','Rep','Height_cm')
High<-filter(data, Rate == 200)
Med<-filter(data, Rate == 150)
Low<-filter(data, Rate == 100)
Con<-filter(data,Rate==0)

#Write a function with a piece of code in your analysis that is used multiple times.#
rate_org <-function(Rate){
  filter(data, Rate == 200)
  filter(data, Rate == 150)
  filter(data, Rate == 100)
  filter(data,Rate==0)}
DAP_org<-function(DAP){
  filter(data, DAP == 42)
  filter(data, DAP == 35)
  filter(data,DAP==21)}
rate_org(data)
DAP_org(data)
#Loop over a repeated procedure.#
for (z in data) {
  z<-data%>%
    group_by(Rate,DAP)%>%
    summarise('Average Plant Height'= mean(Height_cm),
              StandardDeviationHeight = sd(Height_cm)) 
  print(z)
}

#Write an "if" statement to complete a task including a conditional"

data
Rate="150"
if(Rate=="150"){
  data%>%
    summarise('Average Plant Height'= mean(Height_cm),
              "Standard Deviation Height" = sd(Height_cm))}

