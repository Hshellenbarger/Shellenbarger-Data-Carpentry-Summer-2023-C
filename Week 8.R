library(tidyverse)
library(ggplot2)
data <-read_csv("GaF Plant Height.csv")
select(data,'Rate','Unit','Rep','Height_cm')
High<-filter(data, Rate == 200)
Med<-filter(data, Rate == 150)
Low<-filter(data, Rate == 100)
DataMean<-data%>%
  group_by(Rate,DAP)%>%
  summarise('Average Plant Height'= mean(Height_cm))%>%
  arrange(DAP)
DataSD<-data%>%
  group_by(Rate,DAP)%>%
  summarise('Standard Deviation of Plant Height'= sd(Height_cm))%>%
  arrange(DAP)

DataMean%>%
  aov(`Average Plant Height`~Rate,data=.)%>%
  summary()

DataSD%>%
  aov(`Standard Deviation of Plant Height`~Rate,data=.)%>%
  summary()

DataMean%>%
  lm(`Average Plant Height`~Rate,data=.)%>%
  summary()
mod1<-DataMean%>%
  lm(`Average Plant Height`~Rate,data=.)
summary(mod1)

DataSD%>%
  lm(`Standard Deviation of Plant Height`~Rate,data=.)%>%
  summary()

mod2<-DataSD%>%
  lm(`Standard Deviation of Plant Height`~Rate,data=.)
summary(mod2)

  
