#' Function for compare vectors with a easy view. Shows elements present, absent and outer.
#' @param c_to_compare Vector to compare elements.
#' @param c_standard Vector with standard elements.

compare_c <- function(c_to_compare, c_standard){

  c_to_compare <- sort(c_to_compare)
  
  c_standard <- sort(c_standard)
  
  c_logic <- c_standard%in%c_to_compare
  
  c_logic2 <- c_to_compare%in%c_standard
  
  c_outer <- c_to_compare[!c_logic2]
  
  c_explain <- ifelse(c_logic, 'OK', '!!!NOT PRESENT!!!')
  
  c_absent <- c_standard[!c_logic]
  
  cat('====================================\n')  
  cat('     Required elements n = ');cat(length(c_standard),'\n')
  cat('====================================\n')
  
  walk2(c_standard, c_explain, 
        ~ cat(.x,.y, sep = ' = ') %>% cat(sep = '\n'))
  
  cat('====================================\n')  
  cat('     Outer elements n = ');cat(length(c_outer),'\n')
  cat('====================================\n')
  
  cat(c_outer, sep = '\n')
  
  cat('====================================\n')  
  cat('     Absent elements n = ');cat(length(c_absent),'\n')
  cat('====================================\n')
  
  
  if(length(c_absent) != 0){
    cat('\n')
    cat('rename(\n\n')
    cat(paste0(c_absent,' = ___ ,'), sep = '\n')
    cat('\n)')}
  
  invisible(list(absent_cols = c_absent, outer_cols = c_outer))
}
