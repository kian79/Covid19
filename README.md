
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Covid19
<img src="/man/figure/logo.png">
<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/kian79/Covid19.svg?branch=master)](https://travis-ci.com/kian79/Covid19)
[![CRAN
status](https://www.r-pkg.org/badges/version/Covid19)](https://CRAN.R-project.org/package=Covid19)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
<!-- badges: end -->
Covid19 is an R package that fetches corona data from John Hopkins University and updates it daily. You can also plot this data in different ways country by country and date by date.
The goal of Covid19 is to present the latest corona data in the best, simplest and most comprehensible way possible.

## Installation

You can install the released version of Covid19 from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("Covid19")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("kian79/Covid19")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(Covid19)
## basic example code
plot_country_data(start_date = '2-22-2020', end_date = '10-27-2020', country1 = 'Iran', type1='confirmed')
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r
plot_world_map(day1 = 27,month1=10,year1=20,type1='confirmed')
```

<img src="man/figures/README-example-2.png" width="100%" />
