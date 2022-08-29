#' @title calculate lextale score
#' @description calculate the lextale score
#' @param answerVar a 0/1 values responses to lextale test
#' @export
#' @examples
#' lex(sample(c(0,1), replace = TRUE, 120))
#' @name lex
lex <- function(answerVar) {
  #stopifnot("Input must be numeric" = is.numeric(answerVar))
  #if (length(answerVar)!=120){
    #warning("Please make sure that you provided 120 responses/data-ponits/rows.")
  #}
  #numeric vector
  ids <- gl(2, 60) #generate 2 ids
  #logical vector
  correct <- c(0,1,1,1,0,1,1,1,1,0,
              1,1,1,1,1,0,1,1,0,1,
              1,1,0,1,1,1,0,1,1,0,
              1,0,0,1,1,1,0,1,1,0,
              1,0,0,1,1,1,1,0,0,1,
              1,1,1,0,0,1,0,0,1,1,
              0,1,1,1,0,1,1,1,1,0,
              1,1,1,1,1,0,1,1,0,1,
              1,1,0,1,1,1,0,1,1,0,
              1,0,0,1,1,1,0,1,1,0,
              1,0,0,1,1,1,1,0,0,1,
              1,1,1,0,0,1,0,0,1,1)
  #character vector
  type <- c('nonword','word','word','word','nonword','word',
            'word','word','word','nonword','word','word',
            'word','word','word','nonword','word','word',
            'nonword','word','word','word','nonword','word',
            'word','word','nonword','word','word','nonword',
            'word','nonword','nonword','word','word','word',
            'nonword','word','word','nonword','word','nonword',
            'nonword','word','word','word','word','nonword',
            'nonword','word','word','word','word','nonword',
            'nonword','word','nonword','nonword','word','word',
            'nonword','word','word','word','nonword','word',
            'word','word','word','nonword','word','word',
            'word','word','word','nonword','word','word',
            'nonword','word','word','word','nonword','word',
            'word','word','nonword','word','word','nonword',
            'word','nonword','nonword','word','word','word',
            'nonword','word','word','nonword','word','nonword',
            'nonword','word','word','word','word','nonword',
            'nonword','word','word','word','word','nonword',
            'nonword','word','nonword','nonword','word','word')
  #logical vector
  input <- c(answerVar)
  result <- cbind(ids, correct, type, input)
  #marking correct/incorrect entries (1=correct and 0=incorrect) in a new column called score
  score <- c(ifelse(result$input == result$correct, 1,0))
  result1 <- cbind(result, score)
  #print(result1)
  result2 <- result1 %>%
    #calculate number of correct answers per type (word/ non-word) for each participant
    dplyr::group_by(ids,type) %>%
    dplyr::summarise(N.correct=sum(score)) %>%
    #p.correct is the percentage for each type
    dplyr::mutate(p.correct=if_else(type=="word", N.correct/40*100, N.correct/20*100))
  print(result2)
  result3 <- result2 %>%
    dplyr::group_by(ids) %>%
    #averaging the correct results of the two types to get the lextale score
    dplyr::summarise(p.correctAV = mean(result$p.correct))
  write.csv(here::here('result.csv'), result3)
  return(result3)
}
