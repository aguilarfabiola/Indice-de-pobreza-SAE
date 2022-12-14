provdirect <- direct(y = datosED$pobre,
                     dom = datosED$comuna,
                     replace = TRUE)

eblup <- eblupFH(provdirect$Direct ~ as.matrix(X), vardir = provdirect$SD^2)

resultados <- data.frame(provdirect$Domain,provdirect$Direct,eblup$eblup,provdirect$SD)

resultados <- resultados %>% 
  rename(Domain = 'provdirect.Domain',
         Direct = 'provdirect.Direct',
         eblup = 'eblup.eblup',
         SD = 'provdirect.SD')

resultados <- dataprincipal %>% 
  full_join(resultados, by = c('comuna' = 'Domain'))%>% 
  dplyr::select(comuna,CR,NC,nobs,eblup,SD) %>% 
  rename(cod_comuna = 'comuna')

Comunas_mapa <- Comunas_mapa %>% 
  inner_join(resultados,by = 'cod_comuna')

rm(eblup,provdirect)
