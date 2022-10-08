cef <- function(score) {
  score2cef <-
    score %>%
    #categorising scores into 3 CEF levels
    dplyr::mutate(CEF.level =
                    ifelse(score<=80, "C1 & C2",
                           ifelse(score>60 ,"B1 & lower",
                                  "B2"))) %>%
    dplyr::mutate(CEF.desc =
                    ifelse(score<=80, "Advanced/Proficient",
                         ifelse(score>60, "Lower-intermediate & lower",
                                "Upper-intermediate")))
  return(score2cef)
}