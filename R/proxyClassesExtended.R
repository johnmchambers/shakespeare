## class definitions that depend on the proxies to Python classes
## and need to come after proxyClasses.R in collation order

#' A Class for the Python/XML Version of a Play
#'
#' The plays are parsed from the set of XML files into Python \code{"ElementTree"} objects.
#' An R object from class \code{"Play"} has a proxy to the parsed play plus fields for the
#' names of the personae and a proxy to a Python list of all the speeches.
#' This class extends the proxy class for \code{"ElementTree"}.
#'
#' @field personae Character vector of the descriptions of the personae in the play.  Note that this
#' comes from the play itself.  The names of speakers usually match one of the personae in the \code{grep()}
#' sense, but not always.
#' @field title The character string title, as found in the XML representation.
#' @field speeches Proxy for a Python listof all the speeches (each an object
#' of Python class \code{"Speech"}).  This is precomputed when the \code{"Play"} object is initialized;
#' the speeches list tends to be input to many of the interesting analyses.  If you want to suppress
#' precomputation, explicitly set this field to a Python list, as in the example below.
#' @field key The character string identifying the play in the table and also the name of the original XML file.
#' @export
Play <- setRefClass("Play",
                    contains = "ElementTree_Python",
                    fields = c(
                        personae = "character",
                        speeches = "list_Python",
                        title = "character",
                        key = "character"
                               ))


Play$methods(
    initialize = function(name, ...) {
        if(nargs()) {
            key <<- findPlay(name)
            callSuper(getPlay(key), ...)
            personae <<- unlist(getPersonae(.self))
            title <<- findtext("TITLE")
            speeches <<- getSpeeches(.self)
        }
    }
    )


