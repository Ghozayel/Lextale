#' @title categorize lextale score
#' @description to categorize lextale score, provided with scores out of 100
#' @param score a numeric value (0-100)
#' @export
#'@name cef
cef <- function(score) {
  score2cef <-
    score %>%
    #categorising scores into 3 CEF levels
    dplyr::mutate(CEF.level =
                    ifelse(score>=80, "C1 & C2",
                           ifelse(score<60 ,"B1 & lower",
                                  "B2"))) %>%
    dplyr::mutate(CEF.desc =
                    ifelse(score>=80, "Advanced/Proficient",
                         ifelse(score<60, "Lower-intermediate & lower",
                                "Upper-intermediate"))) %>%
    view() %>%
    utils::write.csv(here::here(file = 'score2cef.csv'))
}
