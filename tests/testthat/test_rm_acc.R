context("rm_acc")

test_that(
  "rm_acc has a problem",
  expect_equal(rm_acc("extrañar mi país"), "extranar mi pais")
)
