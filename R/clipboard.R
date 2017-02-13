#' Copy data.frames, tables, xtabs, ftables, tbl_df to clipboard prepared for MS Excel.
#' @param x: data.frame, table, xtabs, ftable or tbl_df.
#' 

cb_copy <-  function (x, ...) UseMethod('cb_copy', x);
is.ftable <- function(x, ...) inherits(x, "ftable");
is.xtabs <- function(x, ...) inherits(x, "xtabs");
is.tbl_df <- function(x, ...) inherits(x, "tbl_df");


cb_copy.ftable <- function(x, dec = ','){
  stopifnot(is.ftable(x));
  x_ftable = stats:::format.ftable(x, quote = F, dec = ",")
  x_ftable = apply(x_ftable,2,myutilities::trim)
  write.table2(x_ftable, "clipboard-128", dec = dec, sep = "\t", 
              na = "", col.names = F, row.names = F, quote = F)
  }

cb_copy.data.frame <- function(x, dec = ','){
  stopifnot(is.data.frame(x));
  write.table(x, "clipboard-128", dec = dec, sep = "\t", 
              na = "", row.names = F, quote = F)
}

cb_copy.xtabs <- function(x, dec = ','){
  stopifnot(is.xtabs(x));
  write.table(as.data.frame.matrix(x), "clipboard-128", 
              dec = dec, sep = "\t", na = "", col.names = NA, 
              quote = F)
}

cb_copy.table <- function(x, dec = ','){
  stopifnot(is.table(x));
  write.table(as.data.frame.matrix(x), "clipboard-128", 
              dec = dec, sep = "\t", na = "", col.names = NA, 
              quote = F)
}


#' Read excel table from clipboard.
cb_paste <- function(x, dec = ',', header = T){
  read.table("clipboard-128", dec = dec,
             sep="\t", header = header, na = '', 
             stringsAsFactors = F)
  }

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

#' @title Copy an object in the clipboard
#' @description Copy an object in the clipboard
#' @param sep The object to copy.
#' @param sep A character to be used as separator for each column of the object
#' @param row.names  Copy row names (default is FALSE)
#' @param col.names Copy column names (default is TRUE)
#' @return copy the object as character in the clipboard
#' @author freecube source:http://stackoverflow.com/questions/10959521/how-to-write-to-clipboard-on-ubuntu-linux-in-r

cb_copyunix <- function(x, sep="\t", row.names=FALSE, col.names=TRUE){
  con <- pipe("xclip -selection clipboard -i", open="w")
  write.table(x, con, sep=sep, row.names=row.names, col.names=col.names)
  close(con)
}
