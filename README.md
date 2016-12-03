
# notifier

> Cross Platform Desktop Notifications

[![Linux Build Status](https://travis-ci.org/gaborcsardi/notifier.svg?branch=master)](https://travis-ci.org/gaborcsardi/notifier)
[![Windows Build status](https://ci.appveyor.com/api/projects/status/github/gaborcsardi/notifier?svg=true)](https://ci.appveyor.com/project/gaborcsardi/notifier)
[![](http://www.r-pkg.org/badges/version/notifier)](http://www.r-pkg.org/pkg/notifier)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/notifier)](http://www.r-pkg.org/pkg/notifier)

Send desktop notifications from R, on macOS, Windows and Linux.

## Installation

```r
source("https://install-github.me/gaborcsardi/notifier")
```

`notifier` has no R package dependencies, and no system requirements
other than the `notify-send` command line tool on Linux and other
Unix-like systems. `notify-send` is available in the default installation
on most Desktop Linux installations.

## Usage

```r
library(notifier)
notify(
  title = "15 Packages out of date",
  msg = c("You can run update.packages() to update them.",
  "Outdated packages: Boom colorspace desc memuse networkD3",
  "pbapply revealjs rgl rmdformats timevis and 5 more")
)
```

<img src="/inst/linux.png" width="400" alt="Linux">
<img src="/inst/windows.png" width="400" alt="Windows 8 or newer">

<img src="inst/macos.png" width="400" alt="macOS">
<img src="/inst/oldwindows.png" width="400" alt="Old Windows">

## Thanks

`notifier` uses various tools on the different platform:

* On macOS, it uses `terminal-notifier`:
  https://github.com/julienXX/terminal-notifier
* On Linux and other Unix-like systems it uses `notify-send` from
  `libnotify`.
* On recent Windows systems it uses `toaster`:
  https://github.com/nels-o/toaster
* Older Windows versions it uses `notifu`:
  https://www.paralint.com/projects/notifu

## License

MIT © Gábor Csárdi
