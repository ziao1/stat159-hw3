library(testthat)

sink(file ="./session-info-script.txt")
sessionInfo()
sink()
