
notify_linux <- function(msg, title, image, timeout) {

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

  expire <- as.integer(1e3L*timeout)
  if (is.na(expire)) expire <- 1e3L*10L
  
  args <- c(
    "-i", shQuote(image),
    "-t", expire,
    shQuote(title),
    shQuote(msg)
  )

  system2(ns, args)

  invisible()
}
