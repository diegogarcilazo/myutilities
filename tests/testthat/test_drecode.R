
#Test recode
df = tibble::data_frame(a = 1:18, b = LETTERS[1:18])
result_expected <- structure(list(a = 1:18, b = c("A", "B", "C", "D", "E", "F", 
                                                  "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R"), prueba = c(0.12, 0.1, 0.09, 0.09, 0.08, 0.08, 0.06, 0.06, 
                                                                   0.06, 0.06, 0.05, 0.04, 0.04, 0.03, 0.02, 0.01, 0.005, 0.005, 
                                                                   NA, NA)), row.names = c(NA, -18L), .Names = c("a", "b", "prueba"
                                                                   ), class = c("tbl_df", "tbl", "data.frame"))

result <- drecode(df, myutilities::gedadesn18, a, age.group, W, prueba)

testthat::expect_equal(result, result_expected)

t <- lazyeval::lazy(a, df)
lazyeval::lazy_eval(t, df)
lazyeval::lazy_eval('a', df)
lazyeval::(t)
