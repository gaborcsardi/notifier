
notify_windows <- function(msg, title) {

  ## toaster is nicer, but only works from windows 8
  if (windows_version() < "6.2.9200") {
    notify_notifu(msg, title)

  } else {
    notify_toaster(msg, title)
  }
}

notify_notifu <- function(msg, title) {

  notifu <- system.file(package = packageName(), "notifu", "notifu.exe")

  if (!file.exists(notifu)) {
    stop("Cannot find notifu.exe executable, ", sQuote("notifier"),
         " installation is broken", call. = FALSE)
  }

  system2(notifu, c("/m", shQuote(msg), "/p", shQuote(title)), wait = FALSE)

  invisible()
}

notify_toaster <- function(msg, title) {

  toaster <- system.file(package = packageName(), "toaster", "toast.exe")

  if (!file.exists(toaster)) {
    stop("Cannot find toast.exe executable, ", sQuote("notifier"),
         " installation is broken", call. = FALSE)
  }

  system2(toaster, c("-m", shQuote(msg), "-t", shQuote(title)))

  invisible()
}
