
notify_linux <- function(msg, title, image) {

  ns <- Sys.which("notify-send")

  if (ns == "") {
    stop("Cannot find notify-send executable, you need to install it.\n",
         "You need the 'libnotify-bin' package on Debian/Ubuntu, or\n",
         "the 'libnotify' package on Fedora Linux.")
  }

  ## Otherwise error
  if (title == "") title <- " "

  if (is.null(image)) {
    image <- normalizePath(system.file(package = packageName(), "R.png"))
  }

  args <- c("-i", image, title, msg)
  run(ns, args)

  invisible()
}
