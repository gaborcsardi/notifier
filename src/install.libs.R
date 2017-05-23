
# Copy macOS binary to correct location
execs <- c("macnotifier", "../inst/Info.plist")

dest <- file.path(R_PACKAGE_DIR, paste0("macos", R_ARCH))
dir.create(dest, recursive = TRUE, showWarnings = FALSE)
file.copy(execs, dest, overwrite = TRUE)
