

#' Title LexTALE % correctAV
#'
#' @param lextale
#'
#' @return
#' @export
#'
#' @examples
lextale <- function(var, n = ,...) {
  data$score <- ifelse(data$var ==data$correct, 1,0) %>% #marking correct/incorrect entries (1=correct and 0=incorrect) in a new column called score
    group_by(ID,type) %>%     #calculate number of correct answers per type (word/ non-word) for each participant
    summarise(N.correct=sum(score)) %>%
    mutate(p.correct=if_else(type=="word",N.correct/40*100, N.correct/20*100)) %>%     #p.correct is the percentage
    group_by(ID)%>%
    summarise(finalScore=mean(p.correct)) %>%
    write.csv(here('results', 'lextaleFinalScore.csv')) #saving the file
}
