# Valores que se usarán como "parámetros" (variables) del reporte

source("Scripts/CargarLibrerias.R", encoding = "UTF-8")
source("Scripts/Carga Datos.R", encoding = "UTF-8")
source("Scripts/Manejo de Datos.R",encoding = "UTF-8")

regiones <- levels(factor(resultados$CR))

for (i in regiones){
  dir.create(paste0('./Reportes/',i))
  aux <- resultados %>% 
    filter(CR == i)
  for(j in 1:nrow(aux)){
    com = as.character(aux[j,1])
    CR = i
    NC = as.character(aux[j,3])
    rmarkdown::render("ReportePorComuna.Rmd",
                      params = list(com = com,
                                    CR = CR,
                                    NC = NC),
                      output_file = paste0("Reportes/",i,"/Reporte_", aux[j,3], "_", format(Sys.Date(), "%d-%m-%Y"))
    )
  }
}

# Solo por ahora

DPA2018 <- DatafWeb %>% 
  inner_join(dataprincipal,by = c('CC' = 'comuna')) %>% 
  select(Comuna,CR.x,svg_code,pobrezahistórica2015) %>% 
  rename(CR = CR.x,indice = pobrezahistórica2015)

writexl(DPA2018,file = 'DPA2018_1.xlsx')
write_xlsx(DPA2018)

write.xlsx(resultados,file = 'Otros usos.xlsx')



i = '04'
j = 15
dir.create(paste0('./Reportes/',i))
aux <- resultados %>% 
  filter(CR == i)

com = as.character(aux[j,1])
CR = i
NC = as.character(aux[j,3])
rmarkdown::render("ReportePorComuna.Rmd",
                  params = list(com = com,
                                CR = CR,
                                NC = NC),
                  output_file = paste0("Reportes/",i,"/Reporte_", aux[j,3], "_", format(Sys.Date(), "%d-%m-%Y"))
)
