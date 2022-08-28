#' @title calculate lextale score
#' @description calculate the lextale score
#' @param answerVar a 0/1 values responses to lextale test
#' @export
#' @examples
#' lex(sample(c(0,1), replace = TRUE, 600))
#' @name lex

library(tidyverse)
library(here)

lex <- function(answerVar) {
  stopifnot("Input must be numeric" = is.numeric(answerVar))
  if (length(answerVar)!=600){
    warning("Please make sure that you provided responses for 10 participants, 60 data-ponits/responses for each, a total of 600 rows.")
  }
  data <- readr::read_csv(here('data-raw','lextale-sampleData.csv'))
  ids <- gl(10, 60) #generate 10 ids
  input <- c(answerVar)
  result <- cbind(data, input, ids)
  score <- c(ifelse(result$input ==result$correct, 1,0)) #marking correct/incorrect entries (1=correct and 0=incorrect) in a new column called score
  result <- cbind(result, score)
  result <- result %>%
    dplyr::group_by(ids,type) %>%     #calculate number of correct answers per type (word/ non-word) for each participant
    dplyr::summarise(N.correct=sum(score)) %>%
    dplyr::mutate(p.correct=if_else(type=="word", N.correct/40*100, N.correct/20*100))     #p.correct is the percentage for each type
  result <- result %>%
    dplyr::group_by(ids) %>%
    dplyr::summarise(p.correctAV = mean(result$p.correct)) #averaging the correct results of the two types to get the lextale score
  print(result)
  return(result)
}
