#' Return month from year and week
#' @param year: int year with format YYYY.
#' @param week: int week number.
#' @return month as integer.
epidates_yw2month <- function(year, week){
  first <- lubridate::ymd(paste0(year,"-01-1"))
  second <- lubridate::ymd(paste0(year,"-01-3"))
  wday_rest <- lubridate::wday(second)
  dateSum <- first%m+%days(week*7-3)
  dateFinal <- dateSum%m-%days(wday_rest)
  monthOfweek <- month(dateFinal)
  return(monthOfweek)
}

#' Return epi - week from date. Weeks start on sunday.
#' @param date: Date object
#' @return numeric: week number

epidates_date2week <- function(date)
{
  date1 <- as.Date(paste(lubridate::year(date - lubridate::wday(date-1) + 4),1,3, sep = '-'));
  epi_week <- trunc(as.numeric((date - date1 + (lubridate::wday(date1)+6))/7));
  return(epi_week)
}


epidates_date2week(as.Date('2016-05-03'))

