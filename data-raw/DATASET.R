## code to prepare `DATASET` dataset goes here

lextaledata <- readr::read_csv(here::here('data-raw', 'lextaledata.csv')) # Read in csv file
lextaledata$answer <- sample(c(0,1), replace = TRUE, 2400) #generate new variable of binary random answers
is.numeric(lextaledata$answer)
usethis::use_data(lextaledata, overwrite = TRUE)

lextale.dutch <- readr::read_csv(here::here('data-raw', 'lextale.dutch.csv')) # Read in csv file
lextale.dutch$answer <- sample(c(0,1), replace = TRUE, 2400) #generate new variable of binary random answers
is.numeric(lextale.dutch$answer)
usethis::use_data(lextale.dutch, overwrite = TRUE)
