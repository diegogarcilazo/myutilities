testthat::context("compare_c")

set.seed(1234)
vector1 <- sample(LETTERS, 10)
set.seed(123)
vector2 <- sample(LETTERS, 10)

result <- list(present_elements = c("A", "X"), 
               absent_elements = c("H", "J", "K", "Q", "T", "U", "W", "Z"), 
               outer_elements = c("C", "E", "I", "L", "N", "O", "P", "S"))


testthat::test_that(
"Return invisible",
testthat::expect_invisible(
  compare_c(vector1, vector2)
)
)


testthat::test_that(
  "Invisible is equal to result.",
  testthat::expect_equal(
    {a <- compare_c(vector1, vector2); a},
    result
  )
)
