context("age_cat")

test_that(
  "age_cat transformation style 1",
  expect_equal(
    age_cat(c(12,23,43,23,85,90,100,101), 0, 100 , by = 5),
    structure(c(3L, 5L, 9L, 5L, 18L, 19L, 21L, 21L), .Label = c("0-4", 
    "5-9", "10-14", "15-19", "20-24", "25-29", "30-34", "35-39", 
    "40-44", "45-49", "50-54", "55-59", "60-64", "65-69", "70-74", 
    "75-79", "80-84", "85-89", "90-94", "95-99", "100+"), class = "factor")     
  )
)



test_that(
  "age_cat transformation style 3",
  expect_equal(
    age_cat(c(12,23,43,23,85,90,100,101), 0, 85 , by = 5, style = 3),
    structure(c(3L, 5L, 9L, 5L, 18L, 18L, 18L, 18L), .Label = c("1", 
    "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", 
    "14", "15", "16", "17", "18"), class = "factor")    
)
)