#' @description
#' Period between two dates with format
#' @param from <date>
#' @param to <date>
#' @return chr variable with format

periodFromDates <- function(from, to, format = '%2d years and %2d months'){
  
  per <- lubridate::as.period(lubridate::interval(from, to), unit = "year")
  
  sprintf(format, per@year, per@month)
}
