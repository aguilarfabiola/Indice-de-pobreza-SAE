res <- Resultados %>% 
  ggplot(aes(x = fct_reorder(paste0(NC," (",round(eblup*100,1),"%)"),eblup),y = eblup,fill = Destacar,label = "I"))+
  geom_col(color = "black")+
  geom_errorbar(aes(ymin = eblup-SD,ymax = eblup+SD),width = .2, position = position_dodge(.9))+
  coord_flip()+
  geom_text(size = 3)+
  scale_fill_manual(values = c("Si" = "red", "No" = "Blue"))+
  theme(panel.background = element_rect(fill = NA),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.x = element_blank(),
        text = element_text(family = "Calibri"))
res 


res2 <- Resultados %>% 
  ggplot(aes(x = fct_reorder(paste0(NC," (",nobs,")"),nobs),y = eblup,fill = Destacar)) +
  geom_bar(stat = "identity",color = "black",position = position_dodge())+
  geom_errorbar(aes(ymin = eblup-SD,ymax = eblup+SD),width = .2, position = position_dodge(.9))+
  coord_flip()+
  scale_fill_manual(values = c("Si" = "red", "No" = "Blue"))+
  theme(panel.background = element_rect(fill = NA),
        legend.position = "none",
        plot.title = element_text(hjust = 0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.x = element_blank(),
        text = element_text(family = "Calibri"))


res2
