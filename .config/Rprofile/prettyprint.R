#

PrettyPrint <- function(n, print.it = FALSE, round = 2) {
  # Function to make the printing of numbers "pretty".
  #  i.e.  123456789  becomes 123.46M

  if(n == 0) {
    scaled.n <- 0
    txt <- " "
  } else {
    rescale.factor <- log10(n) %/% 3

    txt <- switch(as.character(3 * rescale.factor),
      "3" = "K",
      "6" = "M",
      "9" = "B",
      "12" = "T")

    scaled.n <- n / 10^(3*rescale.factor)
  }

  if(print.it) {
    retval <- paste(round(scaled.n, round), txt, sep="")
  } else {
    retval <- list(n = scaled.n, txt = txt)
  }
  return(retval)
}

## END
