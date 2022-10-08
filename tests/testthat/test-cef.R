test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
test_that("charachter input causes error", {
  expect_error(Lextale::cef(sample(c(Yes/No), replace = TRUE, 10)))
})
