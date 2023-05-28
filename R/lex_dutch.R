#' @title calculate lextale score, Dutch version
#' @description to mark & calculate score for Dutch lextale-test, provided with answer variable (0/1)
#' @param dataframe a binary values (0/1), at least 60 to returns one score
#' @export
#' @name lex_dutch
lex_dutch <- function(dataframe) {
  if(!is.numeric(answerVar$answer)){ anwerVar$answer = ifelse(tolower(answerVar$answer) %in% c("yes", "y"), 1, 0)}
  stopifnot(all(answerVar$answer %in% c(1,0)))
}
  #importing the package data
  Data <-
    Lextale::lextale.dutch %>%
    #marking correct/incorrect entries (1=correct and 0=incorrect) in a new column called score
    dplyr::mutate(score=if_else(dataframe$answer==correct, 1, 0),
                  ID = dataframe$ID)
  accuracyByType <- Data %>%
    #calculate number of correct answers per type (word/ non-word) for each participant
    dplyr::group_by(ID,type) %>%
    dplyr::summarise(N.correct=sum(score)) %>%
    #p.correct is the percentage for each type
    dplyr::mutate(p.correct=if_else(type=="word", N.correct/40*100, N.correct/20*100))
  p.correctAV <-
    accuracyByType %>%
    dplyr::group_by(ID) %>%
    #averaging p.correct of the two types to get the lextale score
    dplyr::summarise(p.correctAV=mean(p.correct)) %>%
    view() %>%
    utils::write.csv(here::here(file = 'score.lex-dutch.csv'))
}
