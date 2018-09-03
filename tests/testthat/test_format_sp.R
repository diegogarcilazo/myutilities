context("format_sp")

testthat::test_that(
  "format_sp with problems", 
  testthat::expect_equal(format_sp(10000, plus.flag = T, flag = "$"), "+10.000,00$"))



