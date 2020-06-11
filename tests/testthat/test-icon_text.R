context("icon_text")

test_that("icon_text works", {
  hold <- icon_text("paw", "Paw")
  expect_type(hold, "list")
  expect_equal(hold[[1]]$name, "div")
})
