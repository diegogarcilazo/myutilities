context("classint")

test_that(
  "Result factor with 4 levels",
  expect_equal(
    levels(classint(iris$Petal.Width, n = 4)), 
    c("[0.1,0.3]", "(0.3,1.3]", "(1.3,1.8]", "(1.8,2.5]"))
)
