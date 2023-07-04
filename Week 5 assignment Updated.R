library(tidyverse)
data <-read_csv("GaF Plant Height 6-14 35dap.csv")
select(data,'Rate','Unit','Rep','Height_cm')
High<-filter(data, Rate == 200)
Med<-filter(data, Rate == 150)
Low<-filter(data, Rate == 100)
data%>%
  group_by(Rate)%>%
  summarise('Average Plant Height'= mean(Height_cm),'Standard Deviation of Plant Height'= sd(Height_cm))
