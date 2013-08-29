# From the "source" help page...

## If you want to source() a bunch of files, something like
## the following may be useful:
sourceDir <- function(path, trace = TRUE, ..., env = NULL) {
    for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
        if(trace) cat(nm,":")
        if(is.null(env)) {
            source(file.path(path, nm), ...)
        } else {
            # If env is defined then source the packages into that environment
            sys.source(file = file.path(path, nm), envir = env, ...)
        }
        if(trace) cat("\n")
    }
}


#sourceDir( "../r-source-files" )
