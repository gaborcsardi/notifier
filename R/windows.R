
notify_windows <- function(msg, title, image) {

  ## toaster is nicer, but only works from windows 8
  if (windows_version() < "6.2.9200") {
    notify_notifu(msg, title, image)

  } else {
    notify_toaster(msg, title, image)
  }
}

bg_procs <- new.env(parent = emptyenv())

#' @importFrom processx process

notify_notifu <- function(msg, title, image) {

  notifu <- system.file(package = packageName(), "notifu", "notifu.exe")

  if (!file.exists(notifu)) {
    stop("Cannot find notifu.exe executable, ", sQuote("notifier"),
         " installation is broken", call. = FALSE)
  }

  if (is.null(image)) {
    image <- normalizePath(system.file(package = packageName(), "R.ico"))
  }

  ## Unfortunately notifu takes a while to finish, so it is a bit harder
  ## to clean it up, because we need to run it in the background.
  ## We store the process objects in a list, within an environment in the
  ## package. Every time a new process is added we also check for process
  ## objects that have been in the list for a while, and remove them.

  args <- c("/m", msg, "/p", title, "/i", image)
  p <- process$new(notifu, args)

  now <- Sys.time()
  bg_procs$p <- c(bg_procs$p, list(list(proc = p, ts = now)))

  timeout <- as.difftime(5, units = "secs")
  rm <- Filter(
    function(i) now - bg_procs$p[[i]]$ts > timeout,
    seq_along(bg_procs$p)
  )
  if (length(rm)) bg_procs$p <- bg_procs$p[-rm]

  invisible()
}

#' @importFrom processx run

notify_toaster <- function(msg, title, image) {

  toaster <- system.file(package = packageName(), "toaster", "toast.exe")

  if (!file.exists(toaster)) {
    stop("Cannot find toast.exe executable, ", sQuote("notifier"),
         " installation is broken", call. = FALSE)
  }

  if (is.null(image)) {
    image <- normalizePath(system.file(package = packageName(), "R.png"))
  }

  args <- c("-m", msg, "-t", title, "-p", image)
  run(toaster, args, timeout = 2)

  invisible()
}
