devtools::document()
# usethis::use_package_doc()
# usethis::use_testthat()
devtools::test()
devtools::install_github("diegogarcilazo/myutilities")

#Agregar en vap.df cuatro columnas adem?s de vap lwr upr que sean el p de las pruebas de linealidad.
usethis::use_data(stn, internal = T)
devtools::use_package('magrittr')
devtools::use_package('lmtest')
usethis::use_package('clock')
usethis::use_package('tidyr')

