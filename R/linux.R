
notify_linux <- function(msg) {

  ns <- Sys.which("notify-send")

  if (ns == "") {
    stop("Cannot find notify-send executable, you need to install it.\n",
         "You need the 'libnotify-bin' package on Debian/Ubuntu, or\n",
         "the 'libnotify' package on Fedora Linux.")
  }

  system2(ns, shQuote(c(" ", msg)))

  invisible()
}
