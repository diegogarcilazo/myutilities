#' outersect: The opposite of R's intersect function.
#' Author: Tony Breyal example from http://www.r-bloggers.com/outersect-the-opposite-of-rs-intersect-function/.
#' 
#' @param x: vector to compare.
#' @param y: vector to compare.
#' @param ...: vectors to compare.
#' @return vector: Set of elements which are in either of the sets and not in their intersection.
#' 
outersect <- function(x, y, ...) {
  big.vec <- c(x, y, ...)
  duplicates <- big.vec[duplicated(big.vec)]
  setdiff(big.vec, unique(duplicates))
}