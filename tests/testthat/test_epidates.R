context("EpiDates")

testthat::test_that(
  "epidates_date2week with problems", 
  testthat::expect_equal(epidates_date2week(as.Date('2016-05-03')), 18))


testthat::test_that(
  "epidates_date2week with problems", 
  testthat::expect_equal(epidates_date2week(as.Date('2016-01-05')), 1))


testthat::test_that(
  "epidates_yw2month with problems", 
  testthat::expect_equal(epidates_yw2month(2018L, 5L), 1L))


testthat::test_that(
  "epidates_yw2month with problems",
  testthat::expect_equal(epidates_yw2month(2018L, 8L), 2L))


testthat::test_that(
  "dx_asDate with problems",
  testthat::expect_equal(dx_asDate(43000), as.Date('2017-09-22')))

testthat::test_that(
  "dx_toNumber with problems",
  testthat::expect_equal(dx_toNumber(as.Date('2017-09-22')), 43000))