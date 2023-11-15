#' Reverse legend order on ggplot.
#' @param x gg.
legend_rev <- function(x) {
  ggplot2::guides(fill = ggplot2::guide_legend(reverse = TRUE));}