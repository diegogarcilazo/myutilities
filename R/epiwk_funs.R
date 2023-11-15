#' Funciones para trabajar con semanas epidemiológicas
require(clock)


#' @description
#' This function returns the first day of the week in date data type 
#' when the year and week are entered in integer format.
#' @param year <int> year
#' @param week <int> week
#' @return <date> first day of the week

epiwk_asDate <- function(year, week){
  year_week_day(year, week, day = 1) |> 
    invalid_resolve(invalid = "next") |> 
    as.Date()
}

#' Function epiwk_int
#' @description
#' This function returns a vector with the dates of the week in date data type 
#' when the year and week are entered in integer format.
#' @param year <int> year
#' @param week <int> week
#' @return <date> vector day of the week

epiwk_int <- function(year, weeks) {
  first_date <- epiwk_asDate(
    year = as.numeric(year), 
    week = as.numeric(weeks))
  vec_days <- first_date + 0L:6L # add weekdays with names
  names(vec_days) <- weekdays(vec_days, abbreviate = T)
  return(vec_days)
}



#' @description
#' This function returns a calendar 
#' @param year <int> year
#' @return <tibble> tibble

epiwk_calendar <- function(year) {
  map(1:53, \(x) epiwk_int(year, x)) |> 
  bind_rows() |> 
    mutate(
      week = pick(1)[[1]] |> epiweek(),
      year_end = pick(7)[[1]] |> year(),
      year_start = pick(1)[[1]] |> year(),
      across(1:7, \(x) format(x, "%d %b"))
    ) |> 
    relocate(week, year_start, .before = 1)
  }

#' @description
#' This function returns a calendar 
#' @param year <int> year
#' @return <tibble> tibble
#' 
epiwk_dates <- function(year){
  map(1:53, \(x) epiwk_int(year, x)) |> 
    bind_rows() |> 
    mutate(week = pick(7)[[1]] |> epiweek()) |> 
    tidyr::pivot_longer(-week) |> 
    rename(wday = name, date = value)
}
