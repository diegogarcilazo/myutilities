#' Return month from year and week
#' @param year: int year with format YYYY.
#' @param week: int week number.
#' @return month as integer.

epidates_yw2month <- function(year, week){
  
  stopifnot(is.integer(year))
  stopifnot(is.integer(week))

  first <- lubridate::ymd(paste0(year,"-01-1"))
  second <- lubridate::ymd(paste0(year,"-01-3"))
  wday_rest <- lubridate::wday(second)
  dateSum <- lubridate::`%m+%`(first, lubridate::days(week*7-3))
  dateFinal <- lubridate::`%m-%`(dateSum, lubridate::days(wday_rest))
  monthOfweek <- lubridate::month(dateFinal)
  
  return(monthOfweek)
}

#' Return epi - week from date. Weeks start on sunday.
#' @param date: Date object
#' @return numeric: week number

epidates_date2week <- function(date)
{
  stopifnot(lubridate::is.Date(date))
  
  year <- lubridate::year(date - lubridate::wday(date-1) + 4)
  date1 <- as.Date(paste(year , 1, 3, sep = '-'));
  week <- (date - date1 + (lubridate::wday(date1) + 6)) / 7
  epi_week <- trunc(as.numeric((week)));
  
  return(epi_week)
}
