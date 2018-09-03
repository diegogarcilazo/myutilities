context("pct_se")

testthat::test_that(
  "pct_se has problems",
  {testthat::expect_equal(pct_se(10,100), 5.879892)}
)