
# Lextale <a href='https://fgazzelloni.github.io/oregonfrogs/'><img src='https://user-images.githubusercontent.com/53487593/193571550-1435e3ab-984d-4471-96f2-e8550a8a48c9.png' align="right" width="25%" min-width="120px" /></a>

<!-- README.md is generated from README.Rmd. Please edit that file -->


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
CEF() #under progress
```
This function categorises the English lexTALE-scores into three CEF levels. The categorisation is based on [Lemhöfer & Broersma, 2012 study](https://www.lextale.com/pdf/Lemhofer_Broersma_2012.pdf). cef() argument takes a dataframe which must inclue *score* variable(column) of values from 0 to 100. The function creates two new columns, CEF.level & CEF.descr. based on the provided scores


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
answer <- sample(c(0/1), replace = TRUE, 2400) #generate 2400 random binary responses
ID <- gl(40, 60) #generate  40 ids
data <- cbind(ID, answer) #combine the two columns above into one data
#The following line run the lextale test:
Lextale::lex(data)
```

## Cite as

Elotteebi, G. (2022). Lextale R-package: A package to calculates %correctAV of the LexTALE test (Version 2.0.0) [Computer software]. https://doi.org/10.5281/zenodo.7017230
