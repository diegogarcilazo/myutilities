context("create_labs")

test_that("create_labs test", {
  expect_equal(create_labs(0, 100, 20, above.char = "+", sep = "-"), 
               c("0-19", "20-39", "40-59", "60-79", "80-99", "100+"))
})