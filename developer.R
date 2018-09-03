devtools::document()
devtools::use_testthat()
devtools::test()
devtools::install_github("diegogarcilazo/myutilities")

#Ver como incorporar a drecode una lista (...) de columnas a agregar para poder meter varios campos de una sola tabla de traducción.
#Agregar en vap.df cuatro columnas además de vap lwr upr que sean el p de las pruebas de linealidad.
#
#Crear grillas automáticamente

devtools::use_data(internal = T)
devtools::use_package('magrittr')
devtools::use_package('lmtest')
devtools::use_package('lubridate')


givesWarning <- function(expr){
  tryCatch(eval(expr),
           warning = function(cond) TRUE)
}


# import export json
my_list = list(a, b, dft)


write(jsonlite::toJSON(my_list, pretty = T), 'my_json.json')


readlines <- readLines(file('my_json.json'), warn = FALSE)
parse <- jsonlite::fromJSON(readlines)




library(rlang)
library(magrittr)

df <- data.frame(a = 1:3, b = letters[1:3])


a = c(10, 5, 3)


f <- function(x){paste0("mean(",deparse(x),")") %>% parse(text = .)}

f(a) %>% 
  eval()



call("print", list(a))
