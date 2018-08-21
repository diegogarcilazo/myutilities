context("DateToInt")

test_that(
  "DateToInt units = years",
  {
    expect_equal(DateToInt(as.Date("2013-06-06"), as.Date("2018-08-12")), 5)
  })


test_that("DateToInt units = months",
          {
            expect_equal(
              DateToInt(as.Date("2013-06-06"), as.Date("2018-08-12"), 
                        units = "months"), 62)
          })
