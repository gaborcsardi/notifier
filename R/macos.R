
#' @importFrom utils packageName
#' @importFrom processx run

notify_macos <- function(msg, title, image) {

  tn <- system.file(package = packageName(), "bin", "macnotifier")

  bundle_id <- if (Sys.getenv("RSTUDIO", "") == "1") {
    "org.rstudio.RStudio"
  } else {
    "org.r-project.R"
  }

  args <- c(
    "-message", msg,
    "-title", title,
    "-sender", bundle_id,
    if (! is.null(image)) c("-contentImage", normalizePath(image))
  )

  run(tn, args, timeout = 2)

  invisible()
}
