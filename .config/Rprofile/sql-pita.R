# Bits of code to sort out PITA...

pitaSQL.StringToNumeric <- function(x) {
  # Take a SQL string and reformat it so that it returns a numeric value
  as.numeric(as.vector(x))
}

pitaSQL.StringToDate <- function(x, format = "%d/%m/%Y") {
  # Take a SQL string and reformat it so that it returns a date value
  as.Date(as.vector(x), format = format)
}

pitaSQL.ZeroOneToTrueFalse <- function(x) {
  # Take a SQL string and reformat it so that it returns a date value
  as.logical(as.vector(x))
}
## END
