# Functions to work on timing of jobs.
#
# Use:
#   tic()     To start/restart the timer
#   toc()     To return time from the tic() and prints the time difference (calls tictoc())
#   tictoc()  Shorthand for print the time that has past and reset tic()
#

# Get the environment we are being run in.
# This could be changed to `new.env()` if we wanted to have a specific tictoc environment.
tictoc.env <- environment()


tic <- function(env = tictoc.env) {
    #tic.time <<- Sys.time()
    assign("tic.time", Sys.time(), envir = env)
}

toc <- function(env = tictoc.env) {
    #toc.time <<- Sys.time()
    assign("toc.time", Sys.time(), envir = env)
    PrintTicToc()
}

tictoc <- function(env = tictoc.env) {
    # Shorthand for print the time that has past and reset tic()
    toc(env = env)
    tic(env = env)
}

PrintTicToc <- function(env = tictoc.env) {
    tictoc <- get("toc.time", envir = env) - get("tic.time", envir = env)

    cat("\n...Timing is ", round(tictoc, 2), " ", attr(tictoc, "units"), ".\n", sep = "")
    return(invisible(tictoc))
}


# Set the global variables
tic()
assign("toc.time" , get("tic.time", envir = tictoc.env), envir = tictoc.env)
