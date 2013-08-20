# Hey Emacs!  This is a -*- R -*- file.

## Create a new invisible environment for all the functions to go in so it doesn't clutter your workspace.
.env <- new.env()



.env$SmartRequire <- function( pkg ) {
    # A function to make the library/require function automatically
    # install the package if it doesn't exist locally.
    if( !require( pkg, character.only = TRUE) ) {
        cat("Installing package:", pkg, "\n")
        install.packages(pkg, dependencies = NA)
        if(require( pkg, character.only = TRUE)) {
            cat("Package", pkg, "has now been installed and included in this R session.\n")
        } else {
            cat("!!! ERROR !!!  Unable to install: ", pkg, "\n")
        }
    }
}



# These functions come from a post on Stack Overflow
#
#   http://stackoverflow.com/questions/1358003/tricks-to-manage-the-available-memory-in-an-r-session
#
# In particular Tony Breyal's version of Dirk Eddelbuettel's post.


# improved list of objects
.env$ls.objects <- function (pos = 1, pattern, order.by,
                         decreasing=FALSE, head=FALSE, n=5) {
  napply <- function(names, fn) sapply(names, function(x)
    fn(get(x, pos = pos)))
  names <- ls(pos = pos, pattern = pattern)
  obj.class <- napply(names, function(x) as.character(class(x))[1])
  obj.mode <- napply(names, mode)
  obj.type <- ifelse(is.na(obj.class), obj.mode, obj.class)
  obj.prettysize <- napply(names, function(x) {
    capture.output(print(object.size(x), units = "auto")) })
  obj.size <- napply(names, object.size)
  obj.dim <- t(napply(names, function(x)
    as.numeric(dim(x))[1:2]))
  vec <- is.na(obj.dim)[, 1] & (obj.type != "function")
  obj.dim[vec, 1] <- napply(names, length)[vec]
  out <- data.frame(obj.type, obj.size, obj.prettysize, obj.dim)
  names(out) <- c("Type", "Size", "PrettySize", "Rows", "Columns")
  if (!missing(order.by))
    out <- out[order(out[[order.by]], decreasing=decreasing), ]
  if (head)
    out <- head(out, n)
  out
}

# shorthand
.env$lsos <- function(..., n=10) {
  ls.objects(..., order.by="Size", decreasing=TRUE, head=TRUE, n=n)
}



# The following are from
#   http://gettinggeneticsdone.blogspot.com.au/2013/07/customize-rprofile.html
#   https://gist.github.com/stephenturner/5700920

## Strip row names from a data frame (stolen from plyr)
.env$unrowname <- function(x) {
    rownames(x) <- NULL
    x
}

## List objects and classes (from @_inundata)
.env$lsa <- function() {
    obj <- type <- function(x) { class(get(x)) }
    foo=data.frame(sapply(ls(envir=.GlobalEnv),obj <- type))
    foo$object <- name=rownames(foo)
    names(foo)[1]="class"
    names(foo)[2]="object"
    return(unrowname(foo))
}

## List all functions in a package (also from @_inundata)
.env$lsp <-function(package, all.names = FALSE, pattern) {
    package <- deparse(substitute(package))
    ls(
        pos = paste("package", package, sep = ":"),
        all.names = all.names,
        pattern = pattern
        )
}

## Attach all the variables above
attach(.env)


## What libraries do I always want?
SmartRequire("xts")


## .First() run at the start of every R session.
## Use to load commonly used packages?
.First <- function() {
    # library(ggplot2)
    cat("\nSuccessfully loaded .Rprofile at", date(), "\n")
}

## .Last() run at the end of the session
.Last <- function() {
    # save command history here?
    cat("\nGoodbye at ", date(), "\n")
}
