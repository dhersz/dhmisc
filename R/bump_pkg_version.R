#' Bump package version
#'
#' Automatically bumps package version and optionally updates package metadata.
#' Helper around \code{desc::desc_bump_version()} and \code{codemetar::write_codemeta()}.
#'
#' @param which Component of version number to bump, either \code{"major"},
#'   \code{"minor"}, \code{"patch"} or \code{"dev"} (the default).
#' @param update_metadata Should \code{codemetar::write_codemeta()} be run to
#'   update the package metadata? Defaults to \code{TRUE} (please refer to
#'   \url{https://codemeta.github.io/} for more information on software
#'   metadata).
#'
#' @examples
#' \dontrun{bump_pkg_version()}
#'
#' @export
bump_pkg_version <- function(which = "dev", update_metadata = TRUE) {

  if (! which %in% c("major", "minor", "patch", "dev"))
    stop("'which' must be one of 'major', 'minor', 'patch' or 'dev'.")

  if (!is.logical(update_metadata)) stop("'update_metadata' must be a logical.")

  # bump package version

  desc::desc_bump_version(which = which)

  # conditionally update metadata

  if (update_metadata) codemetar::write_codemeta()

}
