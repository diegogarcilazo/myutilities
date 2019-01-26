devtools::document()
devtools::use_testthat()
devtools::test()
devtools::install_github("diegogarcilazo/myutilities")

#Agregar en vap.df cuatro columnas además de vap lwr upr que sean el p de las pruebas de linealidad.


devtools::use_data(internal = T)
devtools::use_package('magrittr')
devtools::use_package('lmtest')
usethis::use_package('RColorBrewer')


givesWarning <- function(expr){
  tryCatch(eval(expr),
           warning = function(cond) TRUE)
}



# import export json
my_list = list(a, b, dft)


write(jsonlite::toJSON(my_list, pretty = T), 'my_json.json')


readlines <- readLines(file('my_json.json'), warn = FALSE)
parse <- jsonlite::fromJSON(readlines)


library(tidyverse)

#valuey
year <- 136
var <- rlang::sym("mass")
birth_ <- if_else(starwars$mass == 136 | is.na(starwars$mass), T,F)
filter(starwars, birth_)


#namey
new_var <- "myname"
summarise(starwars, !!new_var := sum(!!var, na.rm = T))





