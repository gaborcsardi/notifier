
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

#' @export

notify <- function(msg) {
  switch(
    detect_os(),
    windows = notify_windows(msg),
    macos   = notify_macos(msg),
    linux   = notify_linux(msg)
  )
}
