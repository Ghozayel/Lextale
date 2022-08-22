#' @title LexTALE % correctAV
#' @description This package calculates the % correctAV scoring for the English LexTALE-test if administered with the downloads using implementations that do not end with participants' score on the screen, e.g. online surveys
#' @param var A lextale var must be provided as a numeric data, either 0 or 1, with 60 responses at least for each participant.
#' @export
#' @examples
#' lextale(c(0,1,0,0,1,0,1,0,1,0,0,0,1,1,1,0,0,0,1,0,0,1,0,0,1,0,1,0,1,0,0,0,1,1,1,0,0,0,1,0,0,1,0,0,1,0,1,0,1,0,0,0,1,1,1,0,0,0,1,0))
lextale <- function(answerVar) {
  stopifnot("Input must be numeric" = is.numeric(answerVar))
    if (length(answerVar)!=60){
      warning("Please make sure that you provided 60 data points/rows/responses.")
    }
  data <- read_csv('data-raw/lextale-sampleData.csv')
  input <- c(answerVar)
  result <- cbind(data, input)
  score <- c(ifelse(result$input ==result$correct, 1,0)) #marking correct/incorrect entries (1=correct and 0=incorrect) in a new column called score
  result <- cbind(result, score)
  result <- result %>%
    group_by(type) %>%     #calculate number of correct answers per type (word/ non-word) for each participant
    summarise(N.correct=sum(score)) %>%
    mutate(p.correct=if_else(type=="word",N.correct/40*100, N.correct/20*100))     #p.correct is the percentage for each type
  finalScore <- mean(result$p.correct) #averaging the correct results of the two type to get the lextale score
  return(finalScore)
}
