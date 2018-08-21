#' function that read path on windows from clipboard prepares it for R and paste it in clipboard.
#' Copy path
#' directory <- pathPrep() or paste it on script

pathPrep <- function(path = "clipboard") {
  y <- if (path == "clipboard") {
    readClipboard()
  } else {
    cat("Please enter the path:\n\n")
    readline()
  }
  x <- chartr("\\", "/", y)
  x2<-paste0("'",x,'/',"'")
  writeClipboard(x2)
  return(invisible(x2))
}
