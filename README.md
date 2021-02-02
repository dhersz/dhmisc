
# dhmisc

[![CRAN
status](https://www.r-pkg.org/badges/version/dhmisc)](https://CRAN.R-project.org/package=dhmisc)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

**dhmisc** is a collection of functions/tools I like to use but are
either not present in any R packages I know of or their implementation
in existing R packages don’t fulfill my needs.

## Installation

Development version:

``` r
remotes::install_github("dhersz/dhmisc")
```

## Functions

The package doesn’t yet contain any functions.

The pre-commit hooks were basically copied from the great
[`precommit`](https://github.com/lorenzwalthert/precommit) package. The
hooks I want to use don’t work in my computer due to `bash` location, so
I had to adapt the shebang a small bit.

To install and use `precommit` please check its [installation and usage
instructions](https://github.com/lorenzwalthert/precommit#installation).
After running `precommit::use_precommit()` you will need to adjust the
`.pre-commit-config.yaml` to use the hooks provided here. An example on
how to do it will soon be provided.

## Acknowledgement

Credits for pre-commit hooks go to [Lorenz
Walthert](https://github.com/lorenzwalthert),
[`precommit`](https://github.com/lorenzwalthert/precommit) maintainer.