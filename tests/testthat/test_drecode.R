library(myutilities)
testthat::context("drecode")

test_that("warn_diff warn when find diff",
          {
            a = c(2:6);
            b = c(1:5);
            c = c(1:3);
            d = c
            expect_warning(warn_diff(a, b))
            expect_message(warn_diff(d, c))
          })

testthat::test_that("drecode return a data frame", {
df = tibble::data_frame(a = 1:18, b = LETTERS[1:18])
result_expected <- structure(list(1:18, c("A", "B", "C", "D", "E", "F","G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R"), c(0.12, 0.1, 0.09, 0.09, 0.08, 0.08, 0.06, 0.06,0.06, 0.06, 0.05, 0.04, 0.04, 0.03, 0.02, 0.01, 0.005, 0.005)), row.names = c(NA, -18L), .Names = c("a", "b", "prueba"), class = c("tbl_df", "tbl", "data.frame"))

result <- drecode(df, myutilities::gedadesn18, a, age.group, W, prueba)

testthat::expect_equal(result, result_expected)
})
