
#' @importFrom utils packageName

notify_macos <- function(msg, title, image) {

  tn <- system.file(package = packageName(), "bin", "macnotifier")

  bundle_id <- if (Sys.getenv("RSTUDIO", "") == "1") {
    "org.rstudio.RStudio"
  } else {
    "org.r-project.R"
  }

  args <- c(
    "-message", shQuote(msg),
    "-title", shQuote(title),
    "-sender", bundle_id,
    if (! is.null(image)) c("-contentImage", shQuote(normalizePath(image)))
  )

  system2(tn, args)

  invisible()
}
