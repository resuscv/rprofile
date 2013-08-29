# Code to make printing to a CSV file nicer.

WriteCSV <- function(x, file = "", quote = FALSE, row.names = TRUE, ...) {
    # By default turn OFF quoting
    # Also, use kOutputDirectory if defined...
    if(exists("kOutputDirectory") && file != "") {
        file <- file.path(kOutputDirectory, file)
    }
    write.csv(x, file = file, quote = quote, row.names = row.names, ...)
}
