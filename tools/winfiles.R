
downloader <- function() {

  ## notifu
  
  if (!file.exists("inst/notifu")) {
    if(getRversion() < "3.3.0") setInternet2()
    on.exit(unlink("notifu.zip"), add = TRUE)
    download.file(
      "https://github.com/rwinlib/notifu/releases/download/1.6.1/notifu-1.6.1.zip",
      "notifu.zip",
      quiet = TRUE
    )
    dir.create("inst/notifu", showWarnings = FALSE)
    unzip("notifu.zip", exdir = "inst/notifu")
  }
  
  ## toaster
  
  if (!file.exists("inst/toaster")) {
    if(getRversion() < "3.3.0") setInternet2()
    on.exit(unlink("toaster.zip"), add = TRUE)
    download.file(
      "https://github.com/rwinlib/toaster/releases/download/2016-12-01/toaster.zip",
      "toaster.zip",
      quiet = TRUE
    )
    dir.create("inst/toaster", showWarnings = FALSE)
    unzip("toaster.zip", exdir = "inst/toaster")
  }
}

downloader()
