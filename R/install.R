
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

installer <- function() {

  ## Are we installing the package or loading in devtools?
  ## If the latter, do nothing...
  if (Sys.getenv("R_PACKAGE_DIR", "") == "") return()

  switch(
    detect_os(),
    windows = install_windows(),
    macos = install_macos(),
    linux = install_linux()
  )
}

#' @importFrom utils download.file unzip

install_windows <- function() {

  ## notifu

  if (!file.exists("inst/notifu")) {
    if(getRversion() < "3.3.0") do.call("setInternet2", list())
    on.exit(unlink("notifu.zip"), add = TRUE)
    download.file(
      "https://github.com/rwinlib/notifu/releases/download/1.6.1/notifu-1.6.1.zip",
      "notifu.zip",
      quiet = TRUE
    )
    notifu_dir <- file.path(Sys.getenv("R_PACKAGE_DIR"), "notifu")
    dir.create(notifu_dir, showWarnings = FALSE)
    unzip("notifu.zip", exdir = notifu_dir)
  }

  ## toaster

  if (!file.exists("inst/toaster")) {
    if(getRversion() < "3.3.0") do.call("setInternet2", list())
    on.exit(unlink("toaster.zip"), add = TRUE)
    download.file(
      "https://github.com/rwinlib/toaster/releases/download/2016-12-04-2/toaster.zip",
      "toaster.zip",
      quiet = TRUE
    )
    toaster_dir <- file.path(Sys.getenv("R_PACKAGE_DIR"), "toaster")
    dir.create(toaster_dir, showWarnings = FALSE)
    unzip("toaster.zip", exdir = toaster_dir)
  }
}

install_macos <- function() {
  ## Nothing extra to do on macos
}

install_linux <- function() {
  ## TODO: check if notify-send is available
}

installer()
