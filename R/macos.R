
#' @importFrom utils packageName

notify_macos <- function(msg) {

  tn <- system.file(package = packageName(),
                    "tn", "bin", "terminal-notifier")

  if (!file.exists(tn)) {
    stop("Cannot find terminal-notifier executable, ", shQuote("notifier"),
         " installation is broken", call. = FALSE)
  }

  system2(tn, c("-message", shQuote(msg)))

  invisible()
}
