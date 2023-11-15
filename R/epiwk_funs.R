#' Funciones para trabajar con semanas epidemiológicas


#' This function returns the first day of the week in date data type 
#' when the year and week are entered in integer format.
#' @param year <int> year
#' @param week <int> week
#' @return <date> first day of the week

epiwk_asDate <- function(year, week){
  clock::year_week_day(year, week, day = 1) |> 
    clock::invalid_resolve(invalid = "next") |> 
    as.Date()
}

#' This function returns a vector with the dates of the week in date data type 
#' when the year and week are entered in integer format.
#' @param year <int> year
#' @param week <int> week
#' @return <date> vector day of the week

epiwk_int <- function(year, weeks) {
  first_date <- myutilities::epiwk_asDate(
    year = as.numeric(year), 
    week = as.numeric(weeks))
  vec_days <- first_date + 0L:6L # add weekdays with names
  names(vec_days) <- clock::weekdays(vec_days, abbreviate = T)
  return(vec_days)
}



#' This function returns a calendar 
#' @param year <int> year
#' @return <tibble> tibble

epiwk_calendar <- function(year) {
  purrr::map(1:53, \(x) myutilities::epiwk_int(year, x)) |> 
  dplyr::bind_rows() |> 
    dplyr::mutate(
      week = pick(1)[[1]] |> epiweek(),
      year_end = pick(7)[[1]] |> year(),
      year_start = pick(1)[[1]] |> year(),
      dplyr::across(1:7, \(x) format(x, "%d %b"))
    ) |> 
    dplyr::relocate(week, year_start, .before = 1)
  }

#' This function returns a calendar 
#' @param year <int> year
#' @return <tibble> tibble
#' 
epiwk_dates <- function(year){
  purrr::map(1:53, \(x) myutilities::epiwk_int(year, x)) |> 
    dplyr::bind_rows() |> 
    dplyr::mutate(week = pick(7)[[1]] |> lubridate::epiweek()) |> 
    tidyr::pivot_longer(-week) |> 
    dplyr::rename(wday = name, date = value)
}
