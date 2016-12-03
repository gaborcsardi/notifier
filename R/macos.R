
#' @importFrom utils packageName

notify_macos <- function(msg, title, image) {

  tn <- system.file(package = packageName(),
                    "tn", "bin", "terminal-notifier")

  if (!file.exists(tn)) {
    stop("Cannot find terminal-notifier executable, ", sQuote("notifier"),
         " installation is broken", call. = FALSE)
  }

  args <- c(
    "-message", shQuote(msg),
    "-title", shQuote(title),
    "-sender", "org.r-project.R",
    if (! is.null(image)) c("-contentImage", shQuote(normalizePath(image)))
  )

  system2(tn, args)

  invisible()
}
