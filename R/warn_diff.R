warn_diff<- function(varx, vary){
  vary_name <- vary;
  varx_name <- varx;
  varx_u <- unique(varx)
  vary_u <- unique(vary)
  varx_diff <- setdiff(varx_u, vary_u);
  vary_diff <- setdiff(vary_u, varx_u);
  if(length(varx_diff)==0){message('No difference')}
  if(length(varx_diff)>0){
    warning(
      paste("Values: ",paste(varx_diff, collapse = ' ,'), " Not present in ", vary_name))}
  if(length(vary_diff)>0){
    warning(
      paste("Values: ",paste(vary_diff, collapse = ' ,')," Not present in ", varx_name))};
  list_warn <- list(varx_diff, vary_diff);
  names(list_warn) <- c(vary_name, varx_name);
  invisible(list_warn);
}

