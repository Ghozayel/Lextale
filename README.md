
# Lextale

<!-- badges: start -->
[![DOI](https://zenodo.org/badge/525854071.svg)](https://zenodo.org/badge/latestdoi/525854071)
<!-- badges: end -->

The goal of [Lextale package](https://ghozayel.github.io/Lextale/) is to mark and calculates the [%correctAV scoring](https://www.lextale.com/scoring.html) for the English, German and Dutch versions [LexTALE-test](https://www.lextale.com) if administered using implementations that do not end with participants' score on the screen, e.g. online surveys. For more info about the test, see [Lemhöfer & Broersma, 2012](https://www.lextale.com/pdf/Lemhofer_Broersma_2012.pdf).

## Functions and Arguments

``` r
lex()
```
This function mark and calculates the lextale score for the English and German versions of the test. Its argument takes a dataframe which must inclue two variables(columns):
- ID: each ID must have 60 entries, e.g. ID *1987* repeated 60 times, with 40 IDs per time (=2400 rows).
- answer: a variable of 0/1, with 2400 rows. 

*Please note both columns names are case-sensitive.
Using this function returns the scores of 40 participants in one lex-click!
Future work will be on accepting and open number of scores, and on accepting Yes/No in the argument.* 

``` r
lex.dutch()
```
This function mark and calculates the lextale score for the Dutch version of the test. *Not yet live, but coming soon!*

``` r
CEF()
```
This function categorises the English lexTALE-scores into three CEF levels. *Not yet live, but coming soon!*


## Installation

You can install the Lextale package from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Ghozayel/Lextale", dependencies = TRUE)
```

## Example

This is a basic example which shows you how to use the *lex()* function to calculate 10 scores:

``` r
#The first 3 lines below generate fake data for the purpose of testing the lex() function:
answer <- sample(c(0/1), replace = TRUE, 2400) #generate 600 random binary responses
ID <- gl(40, 60) #generate  10 ids
data <- cbind(ID, answer) #combine the two columns above into one data
#The following line run the lextale test:
Lextale::lex(data)
```

## Cite as

Elotteebi, G. (2022). Lextale R-package: Improved Release (Version 1.1.0)[Computer software]. https://doi.org/10.5281/zenodo.7017230
