
notify_linux <- function(msg, title) {

  ns <- Sys.which("notify-send")

  if (ns == "") {
    stop("Cannot find notify-send executable, you need to install it.\n",
         "You need the 'libnotify-bin' package on Debian/Ubuntu, or\n",
         "the 'libnotify' package on Fedora Linux.")
  }

  ## Otherwise error
  if (title == "") title <- " "

  system2(ns, shQuote(c(title, msg)))

  invisible()
}
