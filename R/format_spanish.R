#' Spanish format print for labels and plus flag.
#' @param x numeric to format spanish type
#' @param digits number of digits. Default 3.
#' @param dec decimal mark. Default comma.
#' @param big.mark mark every 3 numbers.
#' @param plus.flag logical. If \code{TRUE} add plus sign.
#' @param flag add a right flag. Default NULL. Useful add \code{\%}.
#' @return character with spanish format and rounded by digits.
#' @examples 
#' format_sp(100.1238, 3, plus.flag = T)

format_sp <- function(x, digits = 2 , dec = ',', big.mark = '.', plus.flag = F, flag = NULL){
  
  label <- formatC(x, digits = digits, decimal.mark = dec, big.mark = big.mark, format = 'f', flag = ifelse(plus.flag == T,'+',''));
  
  if(!is.null(flag)){
  label  <- paste(label, flag)
  }
  return(label)
}


#' Remove accents.
#' @param x character.
#' @param id a single string with transform identifier, see stringi::stri_trans_list.
#' @examples 
#' acc_rm('бън')

acc_rm <- function(x, id) stringi::stri_trans_general(x, id = "Latin-ASCII")

