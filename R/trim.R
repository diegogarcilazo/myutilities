#Funcion que quita los espacios adelantes y atras de una palabra
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
