#' Calculate age from dates.
#' @param from first date. Date object
#' @param to second date. Default as.Date(today()).
#' @param units years, months, days or hours. Default years.
#' @param floor ... Default FALSE.

age_fdates <- function(from, to = as.Date(lubridate::today()), units = "years", floor = FALSE) 
  {
  stopifnot(lubridate::is.Date(from));
  stopifnot(lubridate::is.Date(to));
  calc = lubridate::interval(from, to) / lubridate::duration(num = 1, units = units)
  if (floor) calc = as.integer(floor(calc))
  return(as.integer(trunc(calc)))
}
