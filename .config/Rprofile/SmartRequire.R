SmartRequire <- function( pkg ) {
    # A function to make the library/require function automatically
    # install the package if it doesn't exist locally.
    if( !require( pkg, character.only = TRUE) ) {
        cat("Installing package:", pkg, "\n")
        install.packages(pkg, dependencies = c("Depends", "Suggests", "Enhances"))
        library(pkg, character.only = TRUE)
    }
}
