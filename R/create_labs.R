#' Create labels from numeric intervals.
#' @param lower: int lower.
#' @param upper: int upper.
#' @param by: int every.
#' @param sep: char default "-".
#' @param above.char: char default "+".
#' @return character vector.

create_labs <- function(lower, upper, by, above.char, sep){
  c(paste(seq(lower, upper - by, by = by),
          seq(lower + by - 1, upper - 1, by = by),
          sep = sep),
    paste(upper, above.char, sep = ""))
}
