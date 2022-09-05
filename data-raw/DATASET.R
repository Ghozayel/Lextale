## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(here)

lextale <- read.csv(here('data-raw', 'lextaledata.csv')) # Read in csv file
lextale$answer <- sample(c(0,1), replace = TRUE, 600) #generate new variable of binary random answers
is.numeric(lextale$answer)
usethis::use_data(lextale, overwrite = TRUE)
