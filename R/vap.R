vap <- function(x, ...) UseMethod('vap',x)

#'Annual percent change
#' @param x: vector
#' @param y: vector
#' @param tests logical: if TRUE computes p-value for lineal model tests. See Details.
#' @details Lineal model tests: SW = residual normality by Shapiro Wilks. BP: Performs the Breusch-Pagan test against heteroskedasticity. HC: Harvey-Collier test for linearity. DW: Computes bootstrapped p-values for residual autocorrelations and generalized Durbin-Watson statistics.
#' @return vector. vap: annual percent change. lwr: lower IC 95%. upr: upper IC 95%.

vap.numeric<-function(x, y, tests = FALSE){
  stopifnot(is.numeric(x));
  y[is.infinite(y)]<-NA; #Transforma los Inf en NA
  y[y==0]<-NA; #Transforma los 0 en NA
  log(y)->logtasa; #Logaritmo
  datos<-data.frame(x,logtasa); #tabla de datos
  datos<-na.omit(datos); #Omite los NA de la tabla de datos
  lmdatos<-lm(logtasa~x,data=datos);#Aplica el modelo lineal
  es <- qt(0.975,lmdatos$df.residual)*summary(lmdatos)$coefficients[2,2];#ERROR ESTANDAR
  vap <- summary(lmdatos)$coefficients[2,1];
  vec <- c(vap = vap, es = es, lwr = vap-es, upr = vap + es);
  vaps <- round((1-exp(vec))*-100, 2);
  
  if(tests == T){
    shapiro <- stats::shapiro.test(residuals(lmdatos));
    bpagan <- lmtest::bptest(lmdatos);
    harv <- lmtest::harvtest(lmdatos);
    dw <- car::durbinWatsonTest(lmdatos);
    tests <- c(SW = as.numeric(formatC(shapiro$p.value,width = 2,digits = 2, format = 'f')),
               BP = as.numeric(formatC(bpagan$p.value, width = 2,digits = 2, format = 'f')),
               HC = as.numeric(formatC(harv$p.value, width = 2,digits = 2, format = 'f')),
               DW = as.numeric(formatC(dw$p, width = 2,digits = 2, format = 'f')))
    
    resultado <- c(vaps, tests);
  }else{
    resultado <- vaps;
  }
  return(resultado)
}


vap.df <- function (x, y, tests = FALSE) {
  vec2 <- vap(x,y, tests = tests);
  df <- as.data.frame(t(vec2[-2]));
  return(df)
}

vap_ <-function(df, x, y, tests = FALSE){
  x = lazyeval::lazy_eval(x, df);
  y = lazyeval::lazy_eval(y, df);
  vap.df(x,y, tests = tests)
}


#'Annual percent change
#'For use with do function from dplyr.
#'df %>% group_by(group) %>% do(vap(., year, rate))
#'Some problems with Inf values in y were observed.
#' @param df: data.frame with data.
#' @param x: year
#' @param y: rate
#' @param tests logical: if TRUE computes p-value for lineal model tests. See Details.
#' @details Lineal model tests: SW = residual normality by Shapiro Wilks. BP: Performs the Breusch-Pagan test against heteroskedasticity. HC: Harvey-Collier test for linearity. DW: Computes bootstrapped p-values for residual autocorrelations and generalized Durbin-Watson statistics.
#' @return data.frame. vap: annual percent change. lwr: lower IC 95\code{\%}. upr: upper IC 95\code{\%}.


vap.data.frame <- function(df, x, y, tests = F){
  stopifnot(is.data.frame(df));
  vap_(df, lazyeval::lazy(x), lazyeval::lazy(y), tests = tests);
}


vap_by_ <- function(df, by, x, y, tests = FALSE){
  by = lazyeval::lazy_eval(by, df);
  l <-do.call(rbind, by(df, by, function(n) vap(n[,x], n[,y], tests = tests)));
  df1 <- as.data.frame(l);
  df2 <- cbind(group = rownames(df1), df1);
  rownames(df2) <- NULL;
  return(df2)
}

vap_by <- function(df, by, x, y, tests = F) {
  by = lazyeval::lazy(by);
  x = deparse(substitute(x));
  y = deparse(substitute(y));
  vap_by_(df, by, x, y, tests = tests)
}