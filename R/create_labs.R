#' Create labels from numeric intervals.
#' @param lower: int lower.
#' @param upper: int upper.
#' @param by: int every.
#' @param sep: char default "-".
#' @param above.char: char default "+".
#' @return character vector.

create_labs <- function(lower, upper, by, above.char, sep){
  a <- seq(lower, upper - by, by = by)
  c(stringr::str_glue("{a}{sep}{a + (by - 1)}"), 
    stringr::str_glue("{upper}{above.char}"))
}
