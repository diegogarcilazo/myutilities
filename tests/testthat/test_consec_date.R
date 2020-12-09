context("consec_date")

set.seed(1234)
complete_ts <- tibble(
  ts = seq(as.Date("2020-03-08"), as.Date("2020-06-06"), 1),
  values = runif(vctrs::vec_size(ts), 0L, 10L) %>% as.integer()
)

set.seed(1234)
incomplete_ts <- tibble(
  ts = seq(as.Date("2020-03-08"), as.Date("2020-06-06"), 2),
  values = runif(vctrs::vec_size(ts), 0L, 10L) %>% as.integer()
)



testthat::test_that(
  "consec_date test with complete data.",
  testthat::expect_equal(
    consec_date(complete_ts$ts, complete_ts$values, 0, 5), 
    as.Date("2020-03-08"))
)

testthat::test_that(
  "consec_date test with incomplete data.",
  testthat::expect_equal(
    consec_date(incomplete_ts$ts, incomplete_ts$values, 0, .after = 3), 
    as.Date("2020-03-08"))
)
