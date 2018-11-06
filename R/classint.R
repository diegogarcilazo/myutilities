#' Create vector with Interval Class from classIntervals functions
#' @param var numeric: variable to apply class intervals.
#' @param n int: number of intervals.
#' @param style chr: breaks style. chosen style: one of "fixed", "sd", "equal", "pretty", "quantile", "kmeans", "hclust", "bclust", "fisher", or "jenks". Default: "quantile".
#' @param labels: chr vector with labels for class.
#' @param include.lowest: logical, indicating if an equal to the lowest
#' @return factor. 

classint <- function(var, n, style = 'quantile', labels = NULL, include.lowest = T){
  
    ci_obj <- classInt::classIntervals(var, n = n,
                                       style = style);
    brks <- unique(ci_obj$brks);
    
    vect_class <- cut(var, brks, labels = labels, 
                      include.lowest = include.lowest);
  
  return(vect_class);
}
