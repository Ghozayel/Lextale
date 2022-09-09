## code to prepare `DATASET` dataset goes here
library(tidyverse)

lextaledata <- read.csv(here::here('data-raw', 'lextaledata.csv')) # Read in csv file
lextaledata$answer <- sample(c(0,1), replace = TRUE, 600) #generate new variable of binary random answers
is.numeric(lextaledata$answer)
usethis::use_data(lextaledata, overwrite = TRUE)
