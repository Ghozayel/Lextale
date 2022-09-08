#' @title calculate lextale score
#' @description to calculate lextale score, provided with a tibble of at least four variables
#' @param answerVar a tibble with ids,type (word/nonword),correct(0/1) and answer(0/1) variables
#' @export
#' @name lex
lex <- function(answerVar) {
  #importing the package data
  Data <-
    Lextale::lextale %>%
    #marking correct/incorrect entries (1=correct and 0=incorrect) in a new column called score
    dplyr::mutate(score=if_else(answerVar==correct, 1, 0))
  accuracyByType <- Data %>%
    #calculate number of correct answers per type (word/ non-word) for each participant
    dplyr::group_by(ids,type) %>%
    dplyr::summarise(N.correct=sum(score)) %>%
    #p.correct is the percentage for each type
    dplyr::mutate(p.correct=if_else(type=="word", N.correct/40*100, N.correct/20*100))
  print(accuracyByType)
  p.correctAV <-
    accuracyByType %>%
    dplyr::group_by(ids) %>%
    #averaging p.correct of the two types to get the lextale score
    dplyr::summarise(p.correctAV=mean(p.correct))
  return(p.correctAV)
}
