test_that("charachter input causes error", {
  expect_error(Lextale::lex(sample(c(Yes/No), replace = TRUE, 600)))
})
