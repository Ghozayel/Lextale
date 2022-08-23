
# Lextale

<!-- badges: start -->
[![DOI](https://zenodo.org/badge/525854071.svg)](https://zenodo.org/badge/latestdoi/525854071)
<!-- badges: end -->

The goal of Lextale is to calculates the % correctAV scoring for the English LexTALE-test if administered with the downloads using implementations that do not end with participants' score on the screen, e.g. online surveys. The argument in the function lextale() in this version must include 600 data points, i.e. of 10 paericipants.

## Installation

You can install the development version of Lextale from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Ghozayel/Lextale")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(Lextale)
lextale(sample(c(0,1), replace = TRUE, 600))
```

