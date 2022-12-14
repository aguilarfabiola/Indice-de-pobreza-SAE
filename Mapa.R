mapa <- mapa_region %>% 
  ggplot()+
  geom_sf(aes(fill = eblup))+
  labs(title = paste0('Indice de pobreza: ',titulo),
       caption = 'Estimacion SAE',
       x = 'Longitud',
       y = 'Latitud')

mapa
