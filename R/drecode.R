drecode_ <- function(x, y, varx, vary, field, name = 'lab')
{
  varx = lazyeval::lazy_eval(varx, x);
  vary = lazyeval::lazy_eval(vary, y);
  
  if(anyDuplicated(vary)>0){stop("Error: Duplicated in primary key")}
  warn_diff(varx, vary);
    m <- match(varx, vary);
    x[,name] <- y[m, field];
    row.names(x)<-NULL;
    return(x);
}


#' Recode throw traduction table. Check for inconsistency.
#' @param x data.frame with the field to recode.
#' @param y data.frame traduction table.
#' @param varx variable to recode.
#' @param vary: variable to link.
#' @param field: variable/s recoded.
#' @param name: name/s of field recoded. Default lab.
#' @return data.frame with \code{x} fields and recoded field with \code{name}.

drecode <- function(x, y,varx,vary,field,name = lab)
{
  varx = lazyeval::lazy(varx, x);
  vary = lazyeval::lazy(vary, y);
  field = deparse(substitute(field));
  name = deparse(substitute(name));
  df <-  drecode_(x, y, varx, vary, field, name);
  return(df);
}





