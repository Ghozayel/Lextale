

#' Title
#'
#' @param lextale
#'
#' @return
#' @export
#'
#' @examples
lextale <- function(lextale, var) {

  #marking correct/incorrect entries (1=correct and 0=incorrect) in a new column called score
  lextale$score <- ifelse(lextale$answer==lextale$correct, 1,0) %>%
    #calculate score based on the marked file
    score <- markedLextale %>%
      group_by(ID,type) %>%
      summarise(N.correct=sum(score)) %>%
      mutate(p.correct=if_else(type=="word",N.correct/40*100, N.correct/20*100))

score.final <-
  score%>%
  group_by(ID)%>%
  summarise(finalScore=mean(p.correct))

#saving the file
write.csv(score.final, 'multiL2/lextaleFinalScore.csv')
}
