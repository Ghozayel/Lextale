test_that("is_tibble", {
  expect_false(is_tibble(trees))
  expect_true(is_tibble(as_tibble(trees)))
  expect_false(is_tibble(NULL))
  expect_false(is_tibble(0))
})
