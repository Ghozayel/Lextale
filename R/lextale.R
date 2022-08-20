#' @title LexTALE % correctAV
#' @description This package calculates the % correctAV scoring for the English LexTALE-test if administered with the downloads using implementations that do not end with participants' score on the screen, e.g. online surveys
#' @param var A lextale var must be provided as a numeric data, either 0 or 1, with 60 responses at least for each participant.
#' @export
#' @examples
#' lextale(0, n = 60)
lextale <- function(var, n = min(60)) {
  stopifnot("Input must be numeric" = is.numeric(var))
  stopifnot("Input must be logical" = is.logical(var))
  lextale$score <- ifelse(lextale$var ==lextale$correct, 1,0) %>% #marking correct/incorrect entries (1=correct and 0=incorrect) in a new column called score
    group_by(ID,type) %>%     #calculate number of correct answers per type (word/ non-word) for each participant
    summarise(N.correct=sum(score)) %>%
    mutate(p.correct=if_else(type=="word",N.correct/40*100, N.correct/20*100)) %>%     #p.correct is the percentage for each type
    group_by(ID)%>%
    summarise(finalScore=mean(p.correct)) %>% #averaging the correct results of the two type to get the lextale score
    print(finalScore) %>%
    write.csv(here::here('results', 'lextaleScore.csv') #saving the file
    )
}
