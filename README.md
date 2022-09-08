
# Lextale

<!-- badges: start -->
[![DOI](https://zenodo.org/badge/525854071.svg)](https://zenodo.org/badge/latestdoi/525854071)
<!-- badges: end -->

The goal of [Lextale package](https://ghozayel.github.io/Lextale/) is to calculates the [%correctAV scoring](https://www.lextale.com/scoring.html) for the English [LexTALE-test](www.lextale.com) if administered using implementations which do not end with participants' score on the screen, e.g. online surveys. For more info about the test, see [Lemhöfer & Broersma, 2012](https://www.lextale.com/pdf/Lemhofer_Broersma_2012.pdf).

## Functions and Arguments

``` r
lex()
```
The current argument for this function in this version must be a variable of 0/1, of 600 rows, to return scores for 10 participants. 

## Installation

You can install the development version of Lextale from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Ghozayel/Lextale", dependencies = TRUE)
```

## Example

This is a [10 participants template](https://github.com/Ghozayel/Lextale/blob/045f9f80d96fad6c20d4912dfe95118ec9995a9a/data-raw/lextaledata.csv), you can copy, add your answers & adjust the length accordingly before running the lex() function. Remember that each participant must have 60 data points/rows, and that 'type' and 'correct' variables are fixed-order. 

This is two basic examples which shows you how to use the lex() function with the above data:

``` r
answer <- sample(c(0/1), replace = TRUE, 600)
Lextale::lex(answer)
```
or
``` r
Lextale::lex(sample(c(0/1), replace = TRUE, 600))
```

## Cite as

Ghozayel Elotteebi. (2022). Lextale R Package: Initial Release (0.1.0). Zenodo. https://doi.org/10.5281/zenodo.7017231
