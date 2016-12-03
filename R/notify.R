
detect_os <- function() {
  if (.Platform$OS.type == "windows") {
    "windows"
  } else if (Sys.info()["sysname"] == "Darwin") {
    "macos"
  } else if (Sys.info()["sysname"] == "Linux") {
    "linux"
  } else {
    "linux"                             # Try Linux, might work, anyway
  }
}

#' Create a desktop notification
#'
#' How exactly the notification appears is platform dependent:
#' * On macOS, we use the `terminal-notifier` tool, see
#'   https://github.com/julienXX/terminal-notifier
#' * On Linux and *BSD systems, including Solaris the `notify-send`
#'   command line tool is used. This requires the `libnotify-bin`
#'   package on Ubuntu/Debian and similar systems, or the `libnotify`
#'   package on RedHat/CentOS/Fedora and similar systems.
#' * On Windows 8 or newer Windows versions we use the `toaster` tool,
#'   see https://github.com/nels-o/toaster.
#' * On older Windows versions we use the `notifu` program, see
#'   https://www.paralint.com/projects/notifu.
#'
#' All notification systems support showing a title and an image,
#' as part of the notification.
#'
#' @param msg Message to show. It may contain newline characters.
#' @param title Message title. Typically shown on the top, with
#'   larger font.
#' @param image Image to show in the notification. By default the
#'   official R logo is shown on macOS, and an alternative logo is shown
#'   on other OSes, because of licensing reasons. You can specify a PNG
#'   file here, to show instead of the R logo. This currently does not
#'   work on older Windows versions (before Windows 8), which does not
#'   allow PNG files, only ICO icons.
#'
#' @export
#' @examples
#' \dontrun{
#' notify("Hello world!")
#' notify("Hello world!", title = "Introduction")
#' notify("Hello world!", title = "Introduction", image = "mylogo.png")
#' }

notify <- function(msg, title = "R notification", image = NULL) {

  msg <- paste(msg, collapse = "\n")

  switch(
    detect_os(),
    windows = notify_windows(msg, title, image),
    macos   = notify_macos(msg, title, image),
    linux   = notify_linux(msg, title, image)
  )
}
