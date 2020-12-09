#' Create palette Color Brewer from factor levels.
#' @param x factor or chr vector
#' @param palette chr: "Blues", "Reds", "Greens","Greys". Default: "Blues".
#' @return chr vector.
#' 

scale_brewer_pal <- function(x, palette = "Blues"){
  
  stopifnot(is.factor(x) | is.character(x))
  
  if(is.factor(x)){n <- length(levels(x))}
  
  if(is.character(x)){n <- length(levels(factor(x)))}
  
  RColorBrewer::brewer.pal(n, palette)
}




create_labs <- function(lower, upper, by, above.char, sep){
  c(paste(seq(lower, upper - by, by = by),
          seq(lower + by - 1, upper - 1, by = by),
          sep = sep),
    paste(upper, above.char, sep = " "))
}














