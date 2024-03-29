library(tidyverse)
library(ggplot2)
data <-read_csv("GaF Plant Height.csv")
select(data,'Rate','Unit','Rep','Height_cm')
High<-filter(data, Rate == 200)
Med<-filter(data, Rate == 150)
Low<-filter(data, Rate == 100)
DataMean<-data%>%
  group_by(Rate,DAP)%>%
  summarise('Average Plant Height'= mean(Height_cm))
DataSD<-data%>%
  group_by(Rate,DAP)%>%
  summarise('Standard Deviation of Plant Height'= sd(Height_cm))

ggplot(data = data) + 
  geom_point(mapping = aes(x= Rate, y=Unit,color=Unit))

ggplot(data=data) +
  geom_point(mapping=aes(x= Rate, y=Height_cm))

ggplot(data = DataMean) + 
  geom_point(mapping = aes(x=Rate,y=`Average Plant Height`,fill=`DAP`))+
  labs(x="Rate",y='Average Plant Height',Fill='Day')
theme_classic(base_size = 18, base_family = "Helvetica") +
  theme(axis.title = element_text(size = 20))

ggplot(DataMean,aes(x=DataMean$Rate,y=DataMean$`Average Plant Height`,fill=DAP))+
  geom_area()+
  labs(DataMean,x="Rate",y="Average Plant Height",
       fill="DAP")+
  theme_classic(base_size = 18, base_family = "Helvetica") +
  theme(axis.title = element_text(size = 20))

ggplot(data = DataSD) + 
  geom_point(mapping = aes(x=Rate,y=DataSD$`Standard Deviation of Plant Height`,fill=`DAP`))+
  labs(x="Rate",y="Standard Deviation of Plant Height",Fill='DAP')+
theme_classic(base_size = 18, base_family = "Helvetica") +
  theme(axis.title = element_text(size = 20))


ggplot(DataSD,aes(x=DataSD$Rate,y=DataSD$`Standard Deviation of Plant Height`,fill=DAP))+
  geom_area()+
  labs(DataMean,x="Rate",y="Standard Deviation of Plant Height",
       fill="DAP")+
  theme_classic(base_size = 18, base_family = "Helvetica") +
  theme(axis.title = element_text(size = 20))

ggplot(DataMean,aes(Rate))+
  geom_histogram(binwidth = 2)+
  scale_x_log10(limits=c(0,250))+
  facet_grid()+
  labs(x="Rate",y="Average Plant Height",)+
  theme_bw(base_size = 24, base_family = "Helvetica") +
  theme(axis.title = element_text(size = 36))
  
MeanFacet<- ggplot(DataMean,aes('Average Plant Height ','Rate'))+
  geom_point()+
  facet_grid(.~'DAP')

 

