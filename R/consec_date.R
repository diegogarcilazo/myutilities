#' This function iterates through values using a sliding window, 
#' applying a condition and evaluate it to each sub-window 
#' then return the first date of the windows that match condition

#' @param date date. i-ndex date.
#' @param value numeric. Count values.
#' @param x numeric. condition that is more than x value.
#' @param .after The number of values after the current element of .i to include 
#' in the sliding window. Set to Inf to select all elements after the 
#' current element. Negative values are allowed, which allows you 
#' to "look backwards".
#' @return date.

consec_date <- function(date, value, x, .after = 7){
  
  stopifnot(all(!is.na(value)))
  stopifnot(lubridate::is.Date(date))
  stopifnot(is.numeric(value))
  stopifnot(length(date) == length(value))
  
  f <- substitute(~all(.x > x))
  
  df <- tibble::tibble(
    date = date,
    value = value
  ) #%>% 
    #complete(date = seq(min(date), max(date), 1), 
    #         fill = list(value = 0))
  
  vector <- slider::slide_index_lgl(df$value, df$date, eval(f), 
                                    .after = lubridate::days(.after))
  
  valueDate <- min(date[vector])
  
  return(valueDate)
}

