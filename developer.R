devtools::document()
devtools::use_testthat()
devtools::test()

#Ver como incorporar a drecode una lista (...) de columnas a agregar para poder meter varios campos de una sola tabla de traducción.
#Agregar en vap.df cuatro columnas además de vap lwr upr que sean el p de las pruebas de linealidad.
#
#Crear grillas automáticamente
load('R/sysdata.rda')
devtools::use_data(gedadesn16,gedadesn18,gedadesn17, 
                   my_filter_list, 
                   internal = T)

devtools::use_package('magrittr')
devtools::use_package('car')
devtools::use_package('lmtest')
devtools::use_package('lubridate')
devtools::use_package('ReporteRs')
devtools::use_package('foreign')


givesWarning <- function(expr){
  tryCatch(eval(expr),
           warning = function(cond) TRUE)
}