# Hey Emacs!  This is a -*- R -*- file.

## Create a new invisible environment for all the functions to go in so it doesn't clutter your workspace.
.env <- new.env()


## Where are all my default functions stored?
.env$kRprofileDir <- "~/.config/Rprofile"

## This is a bit circular...load this function from the kRprofileDir
sys.source(file.path(.env$kRprofileDir, "r-mass-source.R"), envir = .env)
## and then load everything in kRprofileDir
.env$sourceDir(.env$kRprofileDir, env = .env)
## ...but it works.


## Attach all the variables above
attach(.env)


## What libraries do I always want?
SmartRequire("xts")


## .First() run at the start of every R session.
## Use to load commonly used packages?
.First <- function() {
    cat("\nSuccessfully loaded .Rprofile at", date(), "\n")
}

## .Last() run at the end of the session
.Last <- function() {
    # save command history here?
    cat("\nGoodbye at ", date(), "\n")
}
