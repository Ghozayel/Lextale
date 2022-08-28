
# Lextale

<!-- badges: start -->
[![DOI](https://zenodo.org/badge/525854071.svg)](https://zenodo.org/badge/latestdoi/525854071)
<!-- badges: end -->

The goal of [Lextale package](https://ghozayel.github.io/Lextale/) is to calculates the [%correctAV scoring](https://www.lextale.com/scoring.html) for the English [LexTALE-test](www.lextale.com) if administered using implementations which do not end with participants' score on the screen, e.g. online surveys. For more info about the test, see [Lemhöfer & Broersma, 2012](https://www.lextale.com/pdf/Lemhofer_Broersma_2012.pdf).

## Functions and Arguments

lex() the current argument for this function in this version must include 600 data points, i.e. of 10 paericipants to run the %correctAV scoring analysis.

## Installation

You can install the development version of Lextale from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Ghozayel/Lextale")
```

## Example

This is a basic example which shows you how to calculate lextale scoring for 10 people:

``` r
library(Lextale)
lex(sample(c(0,1), replace = TRUE, 600))
```
## Cite as

Ghozayel Elotteebi. (2022). Lextale R Package: Initial Release (0.1.0). Zenodo. https://doi.org/10.5281/zenodo.7017231
