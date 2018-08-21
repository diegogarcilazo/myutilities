context("zerofill")

test_that(
  "zerofill adding 10 right",
  expect_equal(zerofill(20, 10), "0000000020")
)



