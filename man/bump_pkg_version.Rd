% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bump_pkg_version.R
\name{bump_pkg_version}
\alias{bump_pkg_version}
\title{Bump package version}
\usage{
bump_pkg_version(which = "dev", update_metadata = TRUE)
}
\arguments{
\item{which}{Component of version number to bump, either \code{"major"},
\code{"minor"}, \code{"patch"} or \code{"dev"} (the default).}

\item{update_metadata}{Should \code{codemetar::write_codemeta()} be run to
update the package metadata? Defaults to \code{TRUE} (please refer to
\url{https://codemeta.github.io/} for more information on software
metadata).}
}
\description{
Automatically bumps package version and optionally updates package metadata.
Helper around \code{desc::desc_bump_version()} and \code{codemetar::write_codemeta()}.
}
\examples{
\dontrun{bump_pkg_version()}

}
