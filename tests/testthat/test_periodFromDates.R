testthat::context("periodFromDates")

testthat::test_that(
  desc = "periodFromDates", 
  code = {testthat::expect_equal(
    object = periodFromDates("2013-06-06", "2023-11-09"), 
    expected = "10 years and  5 months")})