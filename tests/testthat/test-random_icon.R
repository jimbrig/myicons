context("Random Icon")

test_that("random_icon_works", {
  
  hold <- random_icon()
  
  expect_type(hold, "list")
  expect_length(hold, 3)
  expect_equal(hold$name, "i")
  
})

test_that("random_icon works with a term", {
  
  hold <- random_icon(term = "animal")
  expect_type(hold, "list")
  expect_length(hold, 3)
  expect_equal(hold$name, "i")
  
})

test_that("warning displays", {
  
  t <- "random text that will not work"
  expect_warning(random_icon(term = t))
  
})
