# Esto solo por ahora. Despues hay que cambiarlo
CodReg = CR

Resultados = resultados %>% 
  filter(CR == CodReg) %>% 
  mutate(Destacar = case_when(cod_comuna == com ~ 'Si',
                              TRUE ~ 'No'))


mapa_region <- Comunas_mapa %>% 
  filter(codregion == as.numeric(CodReg))

titulo = unique(mapa_region$Region)

# Fabiola aca debe hacer su magia 