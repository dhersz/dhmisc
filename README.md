
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

## Utilities

### Functions

  - `bump_pkg_version()`  
    Automatically bumps package version (either the major, minor, patch
    or dev component) and conditionally updates package metadata. Helper
    around `desc::desc_bump_version()` and
    `codemetar::write_codemeta()`.

### Pre-commit hooks

To use pre-commit hooks in R packages please see `{precommit}` R package
[installation and usage
instructions](https://github.com/lorenzwalthert/precommit#installation).
To use the hooks made available here you will need to run
`precommit::use_precommit()` and configure `.pre-commit-config.yaml` as
shown below (please remove any hooks you don’t want to use from the
list):

``` yaml
repos:
-   repo: https://github.com/dhersz/dhmisc
    rev: v0.0.0.9009
    hooks:
    -   id: mod-codemeta-description-updated
    -   id: mod-readme-rmd-rendered
    -   id: version-bumped
```

  - `mod-codemeta-description-updated` and `mod-readme-rmd-rendered`  
    Copies of `codemeta-description-updated` and `readme-rmd-rendered`,
    available in `{precommit}`, with adapted shebang to work on my
    computer.

  - `version-bumped`  
    Checks if the package version has been bumped from the last commit,
    and fails if not.

## Acknowledgement

Credits for `mod-codemeta-description-updated` and
`mod-readme-rmd-rendered` pre-commit hooks go to [Lorenz
Walthert](https://github.com/lorenzwalthert),
[`{precommit}`](https://github.com/lorenzwalthert/precommit) maintainer.
