test_that("Factorial", {
  expect_that(factorial(2), equals(2))
  expect_that(factorial(3), equals(6))
  expect_that(factorial(10), equals(3628800))
})
