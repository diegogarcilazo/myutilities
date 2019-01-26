#' Do values in a string vector fall in specified range?
#' str_between is case insensitive by default.
#' @param x	 A string vector of values.
#' @param left,right Boundary values.
#' @param exclude vector string exclude values inside range.


str_between <- function(x, left, right, exclude = NULL){
  
  x <- toupper(x)
  
  (x >= toupper(left) & x <= toupper(right)) & !x%in%toupper(exclude)
  
}
