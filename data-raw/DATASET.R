## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(here)
library(janitor)

fjords <- read.csv(here('data-raw', 'lextale-fakeData.csv')) # Read in csv file

ids <- gl(30, 60) #generate new variable 'ids'
ids
dplyr::full_join(ids, lexData, by = )

answer <- gl(30, 60,0/1) #generate new variable for answers


usethis::use_data(DATASET, overwrite = TRUE)
