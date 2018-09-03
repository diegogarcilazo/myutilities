#' Remove accents.
#' @param x character.
#' @param id a single string with transform identifier, see stringi::stri_trans_list.

rm_acc <- function(x, id) {stringi::stri_trans_general(x, id = "Latin-ASCII")}


