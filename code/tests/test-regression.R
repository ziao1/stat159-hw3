library(testthat)
source("code/functions/regression-functions.R")

# data of multiple regression for test
reg = lm(mpg ~ disp + hp, data = mtcars)
regsum = summary(reg)

context("Test for RSS")
test_that("rss is correct", {
  expect_equal(residual_sum_squares(reg), sum(reg$residuals^2))
  expect_length(residual_sum_squares(reg), 1)
  expect_type(residual_sum_squares(reg), 'double')
})

context("Test for TSS")
test_that("tss is correct", {
  expect_equal(total_sum_squares(reg), sum((mtcars$mpg - mean(mtcars$mpg))^2))
  expect_length(total_sum_squares(reg), 1)
  expect_type(total_sum_squares(reg), 'double')
})

context("Test for RSE")
test_that("rse is correct", {
  expect_equal(residual_std_error(reg), regsum$sigma)
  expect_length(residual_std_error(reg), 1)
  expect_type(residual_std_error(reg), 'double')
})

context("Test for R2")
test_that("r2 is correct", {
  expect_equal(r_squared(reg), regsum$r.squared)
  expect_length(r_squared(reg), 1)
  expect_type(r_squared(reg), 'double')
})

context("Test for F-stat")
test_that("f is correct", {
  expect_equivalent(f_statistic(reg), regsum$fstatistic[1])
  expect_length(f_statistic(reg), 1)
  expect_type(f_statistic(reg), 'double')
})