testthat::context("create_labs")

vector_ages <- c("0 a 4", "5 a 9", "10 a 14", "15 a 19", "20 a 24", "25 a 29", 
  "30 a 34", "35 a 39", "40 a 44", "45 a 49", "50 a 54", "55 a 59", 
  "60 a 64", "65 a 69", "70 a 74", "75 a 79", "80 a 84", "85 a 89", 
  "90 a 94", "95 a 99", "100 y más")


testthat::test_that(
  "create_labs",
  testthat::expect_equal(
    create_labs(0,100,5, " y más", " a "), 
    vector_ages)
)
