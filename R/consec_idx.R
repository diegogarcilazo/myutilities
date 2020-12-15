#' This function iterates through values using a sliding window, 
#' applying a condition and evaluate it to each sub-window 
#' then return the first or last index of the windows that match condition

#' @param index date. i-ndex date.
#' @param value numeric. Count values.
#' @param expr expression. type of .x > 2.
#' @param .after The number of values after the current element of .i to include 
#' in the sliding window. Set to Inf to select all elements after the 
#' current element. Negative values are allowed, which allows you 
#' to "look backwards".
#' @param .f function to apply to find min o max of all windows.
#' @param messages show messages for more information about the windows.
#' @return window's vector.


consec_idx <- function(index, value, expr, .after = 7, .f = "min",
                       .messages = F){
  stopifnot(all(!is.na(value)))
  stopifnot(is.numeric(index) | lubridate::is.Date(index))
  stopifnot(is.numeric(value))
  stopifnot(length(index) == length(value))
  x <- rlang::enexpr(expr)
  f <- rlang::expr(~all(!!x))
  df <- tibble::tibble(
    index = index,
    value = value
  ) %>%
    dplyr::arrange(index) %>%
    complete(index = seq(min(index), max(index), 1),
             fill = list(value = 0))
  vector <- slider::slide_lgl(df$value, rlang::eval_tidy(f),
                              .after = .after - 1,
                              .complete = T)
  if(all(!vector[!is.na(vector)])){
    message("Theres no window's that condition is true.")
  } else {
    firstValueWindow <- rlang::exec(.f, df$index[vector], na.rm = T)
    index <- match(firstValueWindow, df$index)
    returnWindow <- df$index[index:(index + (.after - 1))]
    if(.messages){
      cat("Indexes that window's condition is true:")
      cat("\n")
      cat(paste(na.omit(df$index[vector]), collapse = ", "))
      cat("\n\n")
      cat("Indexes that have no complete windows:")
      cat("\n")
      cat(paste(df$index[(is.na(vector))], collapse = ", "))
      cat("\n\n")
      cat(glue::glue("{.f} window's indexes that condition is true."))
      cat("\n")
      return(returnWindow)
    } else {
      message(glue::glue("{switch(.f, min = 'First', max = 'Last')} window's indexes that condition is true."))
      return(returnWindow)
    }
  }
}




