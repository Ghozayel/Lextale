## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(here)
library(janitor)

lexData <- read.delim(here('data-raw', 'lextale-fakeData.csv'), sep =';')
ids <- gl(30, 60)
ids
answer <- gl(30, 60,0/1)


usethis::use_data(DATASET, overwrite = TRUE)
