## XRPython will create load actions for the path, imports
pythonAddToPath() # by default, the "python" directory
pythonImport("thePlay")

## an environment to store various information about the plays, typically
## named lists with per-play information under the key for that play.
## The functions to return the requested information are self-initializing
## partly to allow parameters to be set for the Python functions returning
## the data needed (e.g., control over the definition of "word")
## Also contains "keys" and "titles", initialized below
.playsTable <- new.env(parent = emptyenv(), size = 80L)
tbl <- read.csv(system.file("plays", "titleTable.csv",
                            package = "shakespeare", mustWork = TRUE),
                header = FALSE, stringsAsFactors = FALSE)
assign("keys", gsub("[.]xml$", "", tbl[,1]), envir = .playsTable)
assign("titles", tbl[,2], envir = .playsTable)
rm(tbl)

#' Titles of Shakespeare's Plays and Corresponding Keys
#'
#' This function returns, as a data frame, the titles of Shakespeare's plays as stored in XML files and the corresponding keys used to identify
#' the individual plays.  Either the key or a unique string matching a title can be given as the name to \code{\link{getPlay}()}.
#' @export
playTitles <- function() {
    data.frame(Title = .playsTable$titles, Key = .playsTable$keys)
}

#' Get a Play as a Parsed XML Object
#'
#' Given a character string that identifies one of Shakespeare's plays, this function returns a pointer to the
#' parsed XML version of the play.  More prescisely, the returned value is a proxy for a Python object resulting from
#' parsing the corresponding file.
#'
#' The text of the XML version of the plays (a contribution from Jon Bosak, available from \url{https://www.ibiblio.org/xml/examples/shakespeare/})
#' are included with this package.  In an R session, the first call to \code{getPlay()} matching a particular play will parse the file (in
#' Python) and return the proxy to the corresponding Python object.  The proxy is also saved in a table so that multiple calls for the same
#' play will only parse once.
#'
#' This function uses a proxy for the Python function of the same name (which exists in the package as well, under the
#' name \code{getPlay_Python}.
#' @param name a character string identifying the play.  Ideally this is the key under which the play is stored, but it can also be any
#' string that uniquely matches one of the play titles.  To see keys and titles, call \code{\link{playTitles}()}.
#' @param ask  if more than  one play matches the name, should the user be asked to choose.  Default \code{TRUE} iff the session is interactive.  No resolution of multiple matches generates an error.
#' @export
findPlay <- function(name, ask = interactive()) {
    keys <- .playsTable$keys
    titles <- .playsTable$titles
    which <- match(name, keys, 0L)
    if(!which) {
        inTitle <- grep(name, titles, fixed = TRUE)
        if(!length(inTitle))
            ## grr, grep won't take both fixed and ignore.case
            ## so we have to hope no special chars
            inTitle <- grep(name, titles, ignore.case = TRUE)
        if(length(inTitle) > 1) {
            if(ask) {
                pick <- menu(titles[inTitle], TRUE, "Matching titles (pick one):")
                if(pick > 0) {
                    inTitle <- inTitle[[pick]]
                    which <- inTitle
                }
            }
            if(length(inTitle) > 1)
                stop("Several titles matched--you need to disambiguate the name:\n",
                     paste0("    ",titles[inTitle], collapse = "\n"))
        }
       if(length(inTitle))
            which <- inTitle
    }
    if(which) {
    ## If the play has not been parsed, do it now and save
        key <- keys[which]
        if(!exists(key, envir = .playsTable)) {
            file <- system.file("plays", paste0(key, ".xml"),
                                package = .packageName, mustWork = TRUE)
            value <- getPlay_Python(file)
            assign(key, value, envir = .playsTable)
        }
        key
    }
    else
        stop(gettextf("No match of %s to the names or the play titles", dQuote(name)))
    ## TODO: should try to parse a file name if no match to table.

 }

getPlay <- function(name) {
    key <- findPlay(name)
    get(key, envir = .playsTable)
}
