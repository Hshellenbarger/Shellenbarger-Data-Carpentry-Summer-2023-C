library(tidyverse)
library(ggplot2)
data <-read_csv("GaF Plant Height.csv")
select(data,'Rate','Unit','Rep','Height_cm')
Data2 <- data %>%
  group_by(Rate, DAP) %>%
  summarise(APH = mean(Height_cm),
            SDPH = sd(Height_cm)) %>%
  arrange(DAP)
Two_way_ANOVA_Mean<- aov(APH~Rate*DAP, data = Data2) 
Two_way_AVONA_SD<- aov(SDPH~Rate*DAP, data = Data2)
summary(Two_way_ANOVA_Mean)
summary(Two_way_AVONA_SD)
interaction.plot(Data2$Rate,
                 factor(Data2$DAP),
                 Data2$APH,
                 xlab = "Rate N lbs./per acre",
                 ylab = "Average Plant Height (cm)",trace.label = "DAP",
                 col = c("orange2","darkgreen","blue4"))

interaction.plot(Data2$Rate,
                 factor(Data2$DAP),
                 Data2$SDPH,
                 xlab="Rate N lbs./per acre",
                 ylab ="Standard Deviation of Plant Height(cm) ", trace.label = "DAP",
                 col = c("orange2","darkgreen","blue4"))