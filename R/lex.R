#' @title calculate lextale score
#' @description to calculate lextale score, provided with answer variable (0/1)
#' @param answerVar a binary values (0/1), at least 60 to returns one score
#' @export
#' @name lex
lex <- function(answerVar) {
  stopifnot("Input must be numeric" = is.numeric(answerVar))
  if (length(answerVar)<60){
    warning("Please make sure that you provided at least 60 responses/data-ponits/rows.")
    }
  #importing the package data
  Data <-
    Lextale::lextale %>%
    #marking correct/incorrect entries (1=correct and 0=incorrect) in a new column called score
    dplyr::mutate(score=if_else(answerVar$answer==correct, 1, 0),
                  ID = answerVar$ID)
  accuracyByType <- Data %>%
    #calculate number of correct answers per type (word/ non-word) for each participant
    dplyr::group_by(ID,type) %>%
    dplyr::summarise(N.correct=sum(score)) %>%
    #p.correct is the percentage for each type
    dplyr::mutate(p.correct=if_else(type=="word", N.correct/40*100, N.correct/20*100))
  print(accuracyByType)
  p.correctAV <-
    accuracyByType %>%
    dplyr::group_by(ID) %>%
    #averaging p.correct of the two types to get the lextale score
    dplyr::summarise(p.correctAV=mean(p.correct))
  return(p.correctAV)
}
