
# Lextale

<!-- badges: start -->
[![DOI](https://zenodo.org/badge/525854071.svg)](https://zenodo.org/badge/latestdoi/525854071)
<!-- badges: end -->

The goal of [Lextale package](https://ghozayel.github.io/Lextale/) is to calculates the [%correctAV scoring](https://www.lextale.com/scoring.html) for the English [LexTALE-test](www.lextale.com) if administered using implementations which do not end with participants' score on the screen, e.g. online surveys. For more info about the test, see [Lemhöfer & Broersma, 2012](https://www.lextale.com/pdf/Lemhofer_Broersma_2012.pdf).

## Functions and Arguments

``` r
lex()
```
The argument for this function in this version must be a variable of 0/1, of no more than 2400 rows, which means that this function can return scores for 40 participants in one lex-click!
Future work on the function will be on accepting Yes/No in the argument. It might as well include categorising the scores into three CEF levels.

## Installation

You can install the development version of Lextale from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Ghozayel/Lextale", dependencies = TRUE)
```

## Example

This is two basic examples which shows you how to use the lex() function with the above data:

``` r
answer <- sample(c(0/1), replace = TRUE, 600)
Lextale::lex(answer)
```
or
``` r
Lextale::lex(sample(c(0/1), replace = TRUE, 2400))
```

## Cite as

Ghozayel Elotteebi. (2022). Lextale R Package: Initial Release (0.1.0). Zenodo. https://doi.org/10.5281/zenodo.7017231
