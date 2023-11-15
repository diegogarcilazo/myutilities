#' Function str between family

str_between_factory <- function(fns){
  function(x, left, right) {
    eval(call(fns, x, glue::glue('(?<={left})(.*)(?={right})')))
  }
}

#' Extract characters between left and right arguments
#' @param x character vector to pass
#' @param left character from left
#' @param right character to right
#' @return character between left and right

str_extract_between <- str_between_factory("str_extract")


#' Show characters between left and right arguments
#' @param x character vector to pass
#' @param left character from left
#' @param right character to right
#' @return Show character between left and right

str_view_between <- str_between_factory("str_view")


#' Remove characters between left and right arguments
#' @param x character vector to pass
#' @param left character from left
#' @param right character to right
#' @return Remove characters between left and right
 
str_remove_between <- str_between_factory("str_remove")

