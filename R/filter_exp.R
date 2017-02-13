filter_exp_ <- function(x, cond, var_list){
  var_names <- sapply(var_list, as.name);
  cond2 <- lazyeval::interp(cond, .values = var_names);
  return(dplyr::filter_(x, .dots = cond2));
}

#' Filter expressions. Helpful for pre estableshing expressions from the package.
#' cie10 filter:
#' tb = tuberculosis.
#' fq = Cystic Fibrosis.
#' @param x: data.frame
#' @param cond: expression. Ex: ~codmuer%ilike%'M%%'. See my_filter_list for preestablished filters.
#' @param ...: variables names. Ex: codmuer = cie10.

filter_exp <- function(x, cond, ...){
  var_name = sapply(substitute(list(...))[-1], deparse);
  return(filter_cond_(x = x, cond = cond, var_list = var_name));
}

my_filter_list <- list(
  tb = ~(codmuer >= 'A150' & codmuer <= 'A19X') | codmuer == 'B200'| (codmuer >= 'B900'& codmuer <= 'B90X'),
  fq = ~ codmuer%ilike%'E84%%')