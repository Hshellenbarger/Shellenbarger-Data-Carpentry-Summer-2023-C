library(tidyverse)
data <-read_csv("GaF Plant Height.csv")
select(data,'Rate','Unit','Rep','Height_cm')
High<-filter(data, Rate == 200)
Med<-filter(data, Rate == 150)
Low<-filter(data, Rate == 100)
DataMean<-data%>%
  group_by(Rate)%>%
  summarise('Average Plant Height'= mean(Height_cm))
DataSD<-data%>%
  group_by(Rate)%>%
  summarise('Standard Deviation of Plant Height'= sd(Height_cm))

Assignment 4 graph
By Treatment
ggplot(data = data) + 
  geom_point(mapping = aes(x= Rate, y=Unit))
Rate by Plant Height
ggplot(data=data) +
  geom_point(mapping=aes(x= Rate, y=Height_cm))

Assignment 5 graphs

ggplot(data = DataMean) + 
  geom_point(mapping = aes(x=DataMean$Rate,y=`Average Plant Height`,color=Rate))

ggplot(data = DataSD) + 
  geom_point(mapping = aes(x=DataMean$Rate, y=`Standard Deviation of Plant Height`,color=Rate))




  

