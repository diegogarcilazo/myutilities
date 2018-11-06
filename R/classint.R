#' Create vector with Interval Class from classIntervals functions
#' @param var numeric: variable to apply class intervals.
#' @param n int: number of intervals.
#' @param style chr: breaks style. chosen style: one of "fixed", "sd", "equal", "pretty", "quantile", "kmeans", "hclust", "bclust", "fisher", or "jenks". Default: "quantile".
#' @param labels: chr vector with labels for class.
#' @param include.lowest: logical, indicating if an equal to the lowest
#' @param brks: vector of the same length of n with breaks numbers. Work in the same way that argument breaks from cut function.
#'

classint <- function(var, n, style = 'quantile', labels = NULL, include.lowest = T, brks = NULL){
  
  if(is.null(brks)){
    
    ci_obj <- classInt::classIntervals(var, n = n,
                                       style = style);
    brks <- unique(ci_obj$brks);
    
  }else{
    stopifnot(length(brks)-1 == n);
    brks <- brks;
  }
  
  vect_class <- cut(var, brks, labels = labels, include.lowest = include.lowest);
  
  return(vect_class);
}
