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

birth_year <- starwars$mass == 136

filter(starwars, birth_year)

#namey
new_var <- "myname"

summarise(starwars, !!new_var := sum(!!var, na.rm = T))


t <- starwars %>% mutate(
  l = height - mass
)

t %>% mutate(
  f = map2(if_else(is.na(mass), 1, mass), ~ rep(0,.x))) %>% 
  select(l, f, mass)

