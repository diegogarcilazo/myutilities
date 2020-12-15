#' function to categorize ages
#' From http://www.r-bloggers.com/r-function-of-the-day-cut
#' @param x: Vector with age as numeric.
#' @param lower: int lower age
#' @param upper: int upper age
#' @param by: int every 
#' @param sep: char default "-".
#' @param above.char: default "+".
#' @param style: 1 = '50 - 54', 2 = '50', 3 = '11'.

age_cat <- function(x, lower = 0, upper, by = 10, sep = "-", above.char = "+", 
                    style = 1) {
  
labs <- switch(style,
    'one' = {create_labs(lower = lower, upper = upper, by = by, above.char = above.char, sep = sep)},
    'two' = {seq(lower, upper, by)},
    'three' = {1:length(seq(lower, upper, by))});
  
  result <- cut(floor(x), breaks = c(seq(lower, upper, by = by), Inf),
      right = FALSE, labels = labs);
  
  return(result)
}
