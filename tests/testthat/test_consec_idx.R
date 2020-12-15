testthat::context("consec_idx")

library(magrittr)

set.seed(1234)
complete_ts <- tibble::tibble(
  ts = seq(as.Date("2020-03-08"), as.Date("2020-06-06"), 1),
  values = runif(vctrs::vec_size(ts), 0L, 10L) %>% as.integer()
)

set.seed(1234)
incomplete_ts <- tibble::tibble(
  ts = seq(as.Date("2020-03-08"), as.Date("2020-06-06"), 2),
  values = runif(vctrs::vec_size(ts), 0L, 10L) %>% as.integer()
)



testthat::test_that(
  "consec_date test with complete data.",
  testthat::expect_equal(
    min(consec_idx(complete_ts$ts, complete_ts$values, .x > 0, 5)), 
    as.Date("2020-03-08"))
)

testthat::test_that(
  "consec_date test with incomplete data.",
  testthat::expect_message(
    consec_idx(incomplete_ts$ts, incomplete_ts$values, .x > 0, .after = 3))
)
