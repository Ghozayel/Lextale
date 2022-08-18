## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(here)
library(janitor)

lextale <- read.csv(here('data-raw', 'lextale-fakeData.csv')) # Read in csv file

ids <- gl(30, 60) #generate new variable 'ids'
ids
dplyr::full_join(ids, lexData, by = )

answer <- sample(c(0,1), replace = TRUE, 1800) #generate new variable for answers
answer
lextale <- lextale %>%
  mutate(answer = answer) %>%
  mutate(ids = ids)
usethis::use_data(lextale, overwrite = TRUE)
