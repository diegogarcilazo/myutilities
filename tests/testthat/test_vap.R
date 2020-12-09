context("vap")

stn <- myutilities::stn

vap.data.frame_result <- structure(
  list(vap = -3.47, lwr = -3.73, upr = -3.22), 
  class = "data.frame", 
  row.names = c(NA, -1L))

vap.data.frame_result_testTrue <- structure(
  list(vap = -3.47, lwr = -3.73, upr = -3.22, SW = 0.54, BP = 0.26, HC = 0.93, DW = 0), 
                                            class = "data.frame", 
                                            row.names = c(NA, -1L))

test_that(
  "vap with data.frame object ",
  {
    expect_equal(vap(stn, year, def), vap.data.frame_result)
  })


test_that("vap with linear model tests",
          {
            expect_equal(
              vap(stn, year, def, tests = T),
              vap.data.frame_result_testTrue
              )
          })




