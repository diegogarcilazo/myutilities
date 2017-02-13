#' Age standardization of rates
#' @param df_ data.frame with data
#' @param by groups
#' @param age.group integer that means age group every 5 years. Ex. 1 to 16 or 1 to 18.
#' @param cases cases
#' @param pop population
#' @param standard standard population. Default world standard population. Colnames should be age.group and W.

adj_direct_ <- function(df_, by, age.group, cases, pop, standard = NULL){
  by = lazyeval::lazy_eval(by, df_);
  age.group = lazyeval::lazy_eval(age.group, df_);
  cases = lazyeval::lazy_eval(cases, df_);
  pop = lazyeval::lazy_eval(pop, df_);
  age.group = as.integer(age.group);
  age.group_u <- as.integer(unique(age.group));

if(!is.null(standard) & identical(colnames(standard), c('age.group','W'))){
      pesos = standard
    }else{
      stop('There is NO standard population table or colnames are different from age.group and W')
    }

  if(identical(age.group, pesos$age.group))>0) {
    stop(paste("age.group:",paste(setdiff(age.group, pesos$age.group), collapse = ' ,'), "Not presents in standard population"))};
  if(length(setdiff(pesos$age.group, age.group))>0) {
    stop(paste("age.group:",paste(setdiff(pesos$age.group, age.group), collapse = ' ,'),".Not presents in data table"))};

switch(deparse(age.group_u),
         '1:18' = {pesos <- myutilities::gedadesn18},
         '1:17' = {pesos <- myutilities::gedadesn17},
         '1:16' = {pesos <- myutilities::gedadesn16},
         {stop('Group age size is different from 1 to 18, 1 to 17 and 1 to 16.')})
  

  df_2 <- data.frame(by, age.group, cases, pop, stringsAsFactors = F);
  
  colnames(df_2) <- c('by', 'age.group', 'cases', 'pop');
  
  df_2 = merge(df_2, pesos, by = 'age.group')
  
  df_2$tasa <- df_2$cases * 100000 / df_2$pop;
  
  df_2$esperados <- df_2$tasa * df_2$W;
  
  df_a <- aggregate(esperados~by, data = df_2, sum);
  
  df_t <- merge(
    aggregate(cases~by, df_2, sum),
    aggregate(pop~by, df_2, sum),
    by = 'by'
  )
  
  df_t2 <- transform(df_t, tasa = cases * 100000 / pop)
  
  df_u <- merge(df_a, df_t2, by = 'by', all = T)
  
  df <-df_u[,c('by', 'cases','esperados')]
  
  colnames(df) <- c('group','observed','adj_rate')
  
  return(df)
}

adj_direct <- function(df_, by, age.group, cases, pop, standard = NULL){
  adj_direct_(df_,
              lazyeval::lazy(by),
              lazyeval::lazy(age.group),
              lazyeval::lazy(cases),
              lazyeval::lazy(pop), standard = standard)
}