
detect_os <- function() {
  if (.Platform$OS.type == "windows") {
    "windows"
  } else if (Sys.info()["sysname"] == "Darwin") {
    "macos"
  } else if (Sys.info()["sysname"] == "Linux") {
    "linux"
  } else {
    stop("Unknown OS")
  }
}

#' Create a desktop notification
#'
#' @param msg Message to show. It may contain newline characters.
#' @param title Message title. Typically shown on the top, with
#'   larger font.
#'
#' @export
#' @examples
#' \dontrun{
#' notify("Hello world!")
#' }

notify <- function(msg, title = "R notification") {
  switch(
    detect_os(),
    windows = notify_windows(msg, title),
    macos   = notify_macos(msg, title),
    linux   = notify_linux(msg, title)
  )
}
