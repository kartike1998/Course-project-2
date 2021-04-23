data_full <- read.csv("repdata_data_StormData.csv.bz2")

data_raw <- data_full[, c(1:2, 8, 23:26)]