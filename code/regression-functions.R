Advertising = read.csv("/Users/Simon/Desktop/stat159-hw3/data/Advertising.csv")

residual_sum_squares = function(x){
  sum(x$residuals^2)
}

total_sum_squares = function(x){
  sum((x$fitted.values - mean(x$fitted.values))^2) + sum(x$residuals^2)
}

r_squared = function(x){
  r = 1-(residual_sum_squares(x)/total_sum_squares(x))
  return(r)
}

f_statistic = function(x){
  f = ((total_sum_squares(x)-residual_sum_squares(x))/(length(x$coefficient)-1)) / (RSS/(length(x$residuals) - length(x$coefficient)))
  return(f)
}

residual_std_error = function(x){
  sqrt(sum(x$residuals^2)/(length(x$residuals) - length(x$coefficient)))
}
