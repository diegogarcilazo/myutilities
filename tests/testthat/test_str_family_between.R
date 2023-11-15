testthat::context("str_family_between")
test_that(
  desc = "Test of str_family_between", 
  code = {
    expect_equal(str_extract_between("(KO)", "\\(", "\\)"), "KO")
    expect_equal(str_remove_between("(KO)", "\\(", "\\)"), "()")
    expect_equal(str_view_between("(KO)", "\\(", "\\)"), 
                 structure("(\033[36m<KO>\033[39m)", id = 1L, 
                           class = "stringr_view")
    )
  }
  
)