
escape_applescript <- function(x) {
  gsub('"', '\\"', x, fixed = TRUE)
}

notify_macos <- function(msg) {
  script <- paste0(
    "display notification ",
    "\"", escape_applescript(msg), "\""
  )

  cmd <- paste("osascript -e", shQuote(script))
  system(cmd)
  invisible()
}
