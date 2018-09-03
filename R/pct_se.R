#'Standard Error from percentege. 
#'@param pct: percentage.
#'@param n: length.
#'@param alpha: alpha error.

pct_se <- function(pct, n, alpha = 0.05){
  
  z <- qnorm(1 - alpha / 2)
  
  ee <- z * sqrt(pct * (100 - pct) / n)
  
  return(ee)
}


