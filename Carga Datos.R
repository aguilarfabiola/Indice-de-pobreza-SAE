#------------------------ Datos Encuesta Casen 2017----------------------------#
#Exportar datos Casen (SPSS)

#Librerías

#Selección de variables de interés
#folio          : Folio del hogar
#region         : Región
#provincia      : Provincia
#comuna         : Comuna
#zona           : Zona
#expr           : Factor de expansión regional
#expc           : Factor de expansión comunal
#tot_per        : Total de personas
#sexo           : sexo
#edad           : Edad
#ecivil         : Estado civil
#e6a            : ¿Cuál fue el nivel más alto educacional?
#o4             : ¿Ha trabajado alguna vez?
#o9a            : Ocupación u oficio
#o28            : Se encuentra afiliado a algún sistema de previsión
#o29            : ¿Cotizó durante el mes anterior en algún sistema de previsión?
#s12            : ¿A qué sistema de previsión pertenece?
#r3             : ¿Pertenece a algún pueblo indígena?
#r8f            : ¿Alguna vez tuvo falta de alimento por dinero?
#v1             : ¿Qué tipo de vivienda tiene?
#ytot           : Ingreso total
#ytoth          : Ingreso total de la vivienda
#ytotcor        : Ingreso total corregido
#ydes           : Seguro de desempleo o cesantía
#ydesh          : Seguro de desempleo o cesantía
#pobreza        : Situación de pobreza
#esc            : Escolaridad
#educ           : Nivel educacional
#calglobviv     : Calidad global de la vivienda
#hacinamiento   : Hacinamiento
#hh_d_rez       : Hogar carente de rezago escolar
#hh_d_esc       : Hogar carente de escolaridad
#hh_d_prevs     : Hogar carente de adscripsicón a sistema de salud
#hh_d_act       : Hogar carente en ocupación
#hh_d_cot       : Hogar carente en seguridad social
#hh_d_jub       : Hogar carente en jubilación
#hh_d_habitab   : Hogar carente en habitabilidad
#hh_d_hacina    : Hogar carente en hacinamiento
#hh_d_servbas   : Hogar carente servicios básicos


Casen_2017 <- read_sav("/Users/fabi/Desktop/CONSULTORÍA II/Ultimo/Casen 2017.sav")

pobreza2015 <- read_excel("/Users/fabi/Desktop/CONSULTORÍA II/Ultimo/pobreza2015.xlsx", 
                          skip = 2)

DPA2018 <- read_excel("/Users/fabi/Desktop/CONSULTORÍA II/Ultimo/DPA2018 (1).xls", 
                      skip = 1)

Casen_2017 <- Casen_2017 %>% 
  dplyr::select(folio, region, provincia, comuna, zona, expr,expc, tot_per,sexo, edad, ecivil, e6a,
         o4, o9a, o28, o29, s12, r3, r8f, v1, ytot, ytoth, ytotcor, ydes, ydesh, pobreza, esc, 
         educ, calglobviv, hacinamiento, hh_d_rez, hh_d_esc, hh_d_prevs, hh_d_act, hh_d_cot, 
         hh_d_jub, hh_d_habitab, hh_d_hacina, hh_d_servbas) %>% 
  mutate(comuna = as.numeric(comuna))


DPA2018 <- DPA2018 %>% 
  dplyr::select(`Nombre Comuna`,`Código Comuna desde 2018`,`Nombre Región desde 2018`,`Código Región desde 2018`) %>% 
  rename(NC = `Nombre Comuna`, Region = `Nombre Región desde 2018`,comuna = `Código Comuna desde 2018`, CR = `Código Región desde 2018`) %>% 
  filter(Region != 'Ignorada') %>% 
  mutate(comuna = as.numeric(comuna))



#REGIÓN: 1 = Región de Tarapacá
#        2 = Región de Antofagasta
#        3 = Región de Atacama
#        4 = Región de Coquimbo
#        5 = Región de Valparaíso
#        6 = Región de Bernardo O'Higgins
#        7 = Región de Maule
#        8 = Región de Biobío
#        9 = Región de La Araucanía
#       10 = Región de los Lagos
#       11 = Región de Aysén
#       12 = Región de Magallanes y Antártica Chilena
#       13 = Región Metropolitana
#       14 = Región de Los Ríos
#       15 = Región de Arica y Parinacota
#       16 = Región de Ñuble


#PROVINICIA:  11 =  Iquique
#             14 = Tamarugal
#             21 = Antofagasta
#             22 = El Loa
#             23 = Tocopilla
#             31 = Copiapó
#             32 = Chañaral
#             33 = Huasco
#             41 = Elqui
#             42 = Choapa
#             43 = Limarí
#             51 = Valparaíso
#             53 = Los Andes
#             54 = Petorca
#             55 = Quillota
#             56 = San Antonio
#             57 = San Felipe de Aconcagua
#             58 = Marga Marga
#             61 = Cachapoal
#             62 = Cardenal Caro
#             63 = Colchagua
#             71 = Talca
#             72 = Cauquenes
#             73 = Curicó
#             74 = Linares
#             81 = Concepción
#             82 = Arauco
#             83 = Biobío
#             84 = Ñuble
#             91 = Cautín
#             92 = Malleco
#            101 = Llanquihue
#            102 = Chiloé
#            103 = Osorno
#            111 = Coyhaique
#            112 = Aysén
#            113 = Capitan Prat
#            114 = General Carrera
#            121 = Magallanes
#            123 = Tierra del Fuego
#            124 = Última Esperanza
#            131 = Santiago
#            132 = Cordillera
#            133 = Chacabuco
#            134 = Maipo
#            135 = Melipilla
#            136 = Talagante
#            141 = Valdivia
#            142 = Ranco
#            151 = Arica
#            152 = Parinacota
#            161 = Diguillin
#            162 = Itata
#            163 = punilla

#COMUNAS

#ZONA:  1 = Urbano
#       2 = Rural


#SEXO:   1 = Honbre
#        2 = Mujer


#ECIVIL:   1 = Casado
#          2 = Conviviente sin unión civil
#          3 = Conviviente con unión civil
#          4 = Anulado
#          5 = Separado
#          6 = Divorciado
#          7 = Vuido
#          8 = Soltero
#          9 = No responde


#NIVEL EDUCACIONAL (E6A):   1 = Nunca asistío
#                           2 = Sala cuna
#                           3 = Jardín Infantil
#                           4 = Pre Kinder / Kinder
#                           5 = Educación especial
#                           6 = Primaria
#                           7 = Educación básica
#                           8 = Humanidades
#                           9 = Educación media científico-humanista
#                          10 = Educación media técnioc profesional
#                          11 = Técnica, comercial, industrial
#                          12 = Técnico nivel superior incompleto (1 a 3 años)
#                          13 = Técnico nivel superior completo (1 a 3 años)
#                          14 = Profesional incompleto
#                          15 = Profesional completo
#                          16 = Post grado incompleto
#                          17 = Post grado completo
#                          99 = No responde



#HA TRABAJO ALGUNA VEZ (O4):    1 = Sí
#                               2 = No
#                               9 = No responde


#COTIZO EL MES PASADO EN ALGÚN SIST PREVISIONAL (029)
#                     1 = Sí, AFP
#                     2 = Sí, AFP
#                     3 = Sí, IPS ex INP
#                     4 = Sí, Caja de previsión de la defensa nacional
#                     5 = Sí, Dirección de previsión de carabineros
#                     6 = Sí, otra
#                     7 = No está cotizado




#SISTEMA DE PREVISIÓN QUE PERTENECE (S12):   1 = Fonasa grupo A
#                                            2 = Fonasa grupo B
#                                            3 = Fonasa grupo C
#                                            4 = Fonasa grupo D
#                                            5 = Fonasa no sabe grupo
#                                            6 = FF.AA y de Orden
#                                            7 = ISAPRE
#                                            8 = Ninguno
#                                            9 = Otro sistema
#                                           99 = No sabe



#PERTENECE A PUEBLOS INDÍGENAS(R3):   1 = Aimara
#                                     2 = Rapa-Nui
#                                     3 = Quechua
#                                     4 = Mapuche
#                                     5 = Atacameño
#                                     6 = Collas
#                                     7 = Kawashkar
#                                     8 = Yagán
#                                     9 = Diaguita
#                                    10 = No pertenece a ninguno
#                                    99 = No responde / no sabe


#ALGUNA VEZ SE QUEDO SIN ALIMENTO POR FALTA DE DINERA(R8F):
#              1 = Sí
#              2 = No
#              9 = No responde



#TIPO DE VIVIENDA (V1):   1 = Casa aislada (no pareada)
#                         2 = Casa pareada por un lado
#                         3 = Casa pareada por ambos lados
#                         4 = Departamento en edificio con elevador
#                         5 = Departamento en edificio sin elevador
#                         6 = Pieza en casa antigua
#                         7 = Mediagua
#                         8 = Vivienda tradicional indígena
#                         9 = Rancho o choza
#                        10 = Vivienda precaria de materiales reutilizados
#                        99 = No sabe / no responde


#NIVEL EDUCACIONAL (EDUC):   0 = Sin educación formal
#                            1 = Básica incompleta
#                            2 = Básica Completa
#                            3 = M. Hum. Incompleta
#                            4 = M. tec. prof. incompleta
#                            5 = M. hum. completa
#                            6 = M. tec. completa
#                            7 = Técnico nivel superior incompleta
#                            8 = Técnico nivel superior completa
#                            9 = Profesional incompleto
#                           10 = Post grado incompleto
#                           11 = Profesional completo
#                           12 = Post grado completo
#                           99 = NS/NR



#CALIDAD GLOBAL DE LA VIVIENDA(CALGLOVIV):  1 = Aceptable
#                                           2 = Recuperable
#                                           3 = Irrecuperable
#                                           9 = Sin dato



#HACINAMIENTO: 1 = Sin hacinamiento (2,49 y menos)
#              2 = Hacinamiento medio bajo (2,5 a 3,49)
#              3 = Hacinamiento medio alto (3,5 a 4,9)
#              4 = Hacinamiento crítico (5 y más)
#              9 = NS/NR

################################################################################

#PROPORCIÓN DE MUJERES POR COMUNA

data <- Casen_2017 %>% 
  group_by(comuna, sexo) %>% 
  summarise(n = n()) %>% 
  mutate(propm = n*100/sum(n)) %>%
  filter(sexo == 2) %>% 
  dplyr::select(comuna, propm)

#AÑOS DE ESCOLARIDAD PROMEDIO POR COMUNA

data2 <- Casen_2017 %>% 
  group_by(comuna) %>%
  summarise(promedioesc = mean(esc, na.rm = TRUE)) %>%
  dplyr::select(comuna, promedioesc)


#PORCENTAJE DE POBLACIÓN PERTENECIENTE A UN PUEBLO INDÍGENA POR COMUNA
data3 <- Casen_2017 %>% 
  group_by(comuna, r3) %>% 
  summarise(n = n()) %>% 
  mutate(propindigena = n*100/sum(n)) %>% 
  dplyr::select(-n) %>% 
  spread(key = r3, value = propindigena, fill = 0) %>%
  mutate(proprealindigena = `1`+ `2`+`3`+`4`+`5`+`6`+`7`+`8`+`9`) %>% 
  rename('Aimara'=`1`, 'Rapa-nui'=`2`, 'Quechua'=`3`, 'Mapuche'=`4`, 
         'Atacameño'=`5`, 'Collas'=`6`, 'Alacalufes'=`7`, 'Yagán'=`8`,
         'Diaguita'=`9`, 'No pertenece'=`10`,'NS/NR'=`99`) %>% 
  dplyr::select(comuna,proprealindigena)

#PORCENTAJE DE POBLACIÓN PERTENECIENTE A ISAPRE POR COMUNA
data4 <- Casen_2017 %>% 
  group_by(comuna, s12) %>% 
  summarise(n = n()) %>% 
  mutate(propisapre = n*100/sum(n)) %>%
  dplyr::select(-n) %>% 
  spread(key = s12, value = propisapre, fill=0) %>%
  dplyr::select(comuna, `7`) %>% 
  rename('Isapre'=`7`)


#ESTADO DE HACINAMIENTO POR COMUNA
data5 <- Casen_2017 %>% 
  group_by(comuna, hacinamiento) %>% 
  summarise(n = n()) %>% 
  mutate(estadohacinamiento = n*100/sum(n)) %>% 
  #filter(hacinamiento<=9) %>%
  dplyr::select(-n) %>% 
  spread(key = hacinamiento, value = estadohacinamiento, fill = 0) %>% 
  rename('Sin hacinamiento'=`1`, 'Hacinamiento medio bajo'=`2`, 'Hacinamiento
         medio alto' = `3`, 'Hacinamiento crítico'=`4`, 'NS/NR'=`9`)


#CARENCIA DE ESCOLARIDAD POR COMUNA
data6 <- Casen_2017 %>% 
  group_by(comuna, hh_d_esc) %>%
  summarise(n = n()) %>% 
  mutate(carenteesc = n*100/sum(n)) %>% 
  dplyr::select(-n) %>% 
  spread(key = hh_d_esc, value = carenteesc, fill = 0) %>% 
  rename('No carencia escolaridad'=`0`, 'Carencia escolaridad'=`1`) %>% 
  dplyr::select(comuna, `Carencia escolaridad`)


#CARENCIA DE SERVICIOS BÁSICOS POR COMUNA
data7 <- Casen_2017 %>% 
  group_by(comuna, hh_d_servbas) %>%
  summarise(n = n()) %>% 
  mutate(carenteservbas = n*100/sum(n)) %>% 
  dplyr::select(-n) %>% 
  spread(key = hh_d_servbas, value = carenteservbas, fill = 0) %>% 
  rename('No carencia servicios básicos'=`0`, 'Carencia servicios básicos'=`1`) %>% 
  dplyr::select(comuna, `Carencia servicios básicos`)

#REMUNERACIÓN PROMEDIO DE AFILIADOS A AFC Y AFP POR COMUNA
data8 <- Casen_2017 %>%
  mutate(ydesh = ifelse(ydesh>0, 'AFC', 'No AFC')) %>% 
  group_by(comuna, ydesh, o28) %>% 
  summarise(remuneracionAFCyAFP = mean(ytoth)) %>% 
  arrange(comuna) %>% 
  group_by(comuna) %>% 
  filter(ydesh == 'AFC', o28 == 1) %>%
  dplyr::select(comuna, remuneracionAFCyAFP)



#PORCENTAJE DE AFILIADOS A AFC Y AFP CON REMUNERACIÓN INFERIOR AL SALARIO
#MÍNIMO POR COMUNA
data9 <- Casen_2017 %>% 
  mutate(ytoth = ifelse(ytoth < 365667, 'Menor al salario mínimo', 'Mayor al 
                        salario mínimo'), ydesh = ifelse (ydesh>0, 'AFC', 'No AFC'))%>%  
  group_by(comuna, ytoth, ydesh, o28) %>%
  summarise(n = n()) %>%
  arrange(comuna) %>% 
  group_by(comuna) %>%
  mutate(AFCyAFPconsalariominimo= n*100/sum(n)) %>% 
  filter(ytoth=='Menor al salario mínimo', ydesh == 'AFC', o28 == 1) %>% 
  dplyr::select(comuna, AFCyAFPconsalariominimo)



#COBERTURA DE AFILIADOS A AFC Y AFP RESPECTO DEL TOTAL DE OCUPADOS A NIVEL
#COMUNAL
data10 <- Casen_2017 %>%
  mutate(ydesh = ifelse (ydesh>0, 'AFC', 'No AFC')) %>%
  group_by(comuna, ydesh, o28) %>%
  summarise(n = n()) %>%
  arrange(comuna) %>% 
  group_by(comuna) %>%
  mutate(AFCyAFPdeltotaldeocupados= n*100/sum(n)) %>%
  filter(ydesh == 'AFC', o28 == 1) %>% 
  dplyr::select(comuna, AFCyAFPdeltotaldeocupados)
  




#REMUNERACIÓN PROMEDIO DE LOS AFILIADOS AL SEGURO DE CESANTÍA X COBERTURA A 
#NIVEL COMUNAL
data11 <- Casen_2017 %>%
  mutate(ydesh = ifelse(ydesh>0, 'AFC', 'No AFC')) %>% 
  group_by(comuna, ydesh) %>% 
  summarise(remuneracionpromediodeAFC = mean(ytoth)) %>% 
  filter(ydesh == 'AFC') %>% 
  dplyr::select(comuna, remuneracionpromediodeAFC)




#COBERTURA DE AFILIADOS RESPECTO DEL TOTAL DE OCUPADOS A NIVEL COMUNAL AFP
data12 <- Casen_2017 %>%
  group_by(comuna, o28) %>%
  summarise(n = n()) %>%
  arrange(comuna) %>% 
  group_by(comuna) %>%
  mutate(coberturaAFPdeltotal= n*100/sum(n)) %>%
  filter(o28 == 1) %>% 
  dplyr::select(comuna, coberturaAFPdeltotal)


#COBERTURA DE AFILIADOS RESPECTO DEL TOTAL DE OCUPADOS A NIVEL COMUNAL AFC
data13 <- Casen_2017 %>%
  mutate(ydesh = ifelse (ydesh>0, 'AFC', 'No AFC')) %>%
  group_by(comuna, ydesh) %>%
  summarise(n = n()) %>%
  arrange(comuna) %>% 
  group_by(comuna) %>%
  mutate(coberturaAFCdeltotal= n*100/sum(n)) %>%
  filter(ydesh == 'AFC') %>% 
  dplyr::select(comuna, coberturaAFCdeltotal)




#POBREZA HISTÓRICA (2015) POR COMUNA
pobreza <- pobreza2015 %>%
  dplyr::select(Código, `Nombre comuna`, `Porcentaje de personas en situación de pobreza por ingresos 2015`) %>% 
  rename(comuna = Código, pobrezahistórica2015 = `Porcentaje de personas en situación de pobreza por ingresos 2015`) %>% 
  mutate(comuna = as.numeric(comuna))

nobs <- Casen_2017 %>%
  mutate(comuna = as.character(comuna)) %>% 
  group_by(comuna) %>% 
  summarise(n = n()) %>% 
  rename(nobs = n) %>% 
  mutate(comuna = as.numeric(comuna))

#DATA FINAL
dataprincipal <- pobreza %>%
  full_join(data2, by='comuna') %>% 
  full_join(data3, by='comuna') %>% 
  full_join(data4, by='comuna') %>% 
  full_join(data5, by='comuna') %>% 
  full_join(data6, by='comuna') %>% 
  full_join(data7, by='comuna') %>% 
  full_join(data8, by='comuna') %>% 
  full_join(data9, by='comuna') %>% 
  full_join(data10, by='comuna') %>% 
  full_join(data11, by='comuna') %>% 
  full_join(data12, by='comuna') %>% 
  full_join(data13, by='comuna') %>% 
  #mutate(comuna = as.numeric(comuna)) %>% 
  inner_join(DPA2018,by = 'comuna') %>% 
  dplyr::select(!`Nombre comuna`) %>% 
  #mutate(comuna = as.character(comuna)) %>% 
  full_join(nobs,by = 'comuna')
  #mutate(comuna = as.numeric(comuna))

datosED <- Casen_2017 %>% 
  mutate(pobre = case_when(pobreza == 3 ~ 0, TRUE ~ 1))

dataprincipal[is.na(dataprincipal)] <- 0

X <- dataprincipal %>% 
  filter(nobs != 0) %>% 
  dplyr::select(-comuna, -pobrezahistórica2015, -NC, -Region, -CR, -nobs, -`NS/NR`, -`Sin hacinamiento`) 

rm(data,data10,data2,data3,data4,data5,data6,data7,data8,data9,data11,data12,
   data13,pobreza,pobreza2015,nobs,DPA2018)
gc()

DatafWeb <- read_excel("Datos/DPA2018_svg.xlsx")
DatafWeb <- DatafWeb %>% 
  mutate(CC = as.numeric(CC))

DatafWeb <- as.data.frame(DatafWeb)

Comunas_mapa <- st_read("Datos/comunas.shp")

