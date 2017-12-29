#' Function to write in spanish format txt files. Consistent with read.delim2. Useful for read in excel with spansh configuration.
#' @param x data.frame to write.
#' @param dir path directory and name of file with extension. Default open windows to choose file localization.
#' @param ext extension file. Default \code{txt}.
#' @return plain text file with header, sep by tabular and comma as decimal. NA are empty chr.
#' 
write.delim2 <- function(x, dir = choose.files()){
  if(!inherits(x, 'data.frame')){
    stop('Object NOT data.frame')}
  write.table(x, dir, dec = ',', row.names = F, sep = '\t', na = '')
  }

write.txt <- function(x, dir = choose.files()){
  write.table(x, dir, dec = ',', row.names = F, sep = '\t', na = '')}

