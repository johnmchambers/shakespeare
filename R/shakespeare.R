#' Contents of Speeches Tokenized
#'
#' The Python NLTK software is used to produce a list of tokens from all
#' the speeches supplied in the argument.
#' The list corresponding to a particular speaker is unlisted and
#' the token \code{"$"} used as a line separator is replaced with new line
#' characters.
#' @param speeches Proxy for a Python object containing the relevant speeches.
#' This may be a list of speeches or and object for which \code{getSpeeches()}
#' returns such a list.  Possiblities include a Play, Act or Scene object.
#' @param .get The standard option for converting the result to R.  Supplying as
#' \code{TRUE} converts to R as a named list.
#' @export
tokens <- function(speeches, .get = NA) {
    table <- tokens_Python(speeches, .get = .get)
    if(identical(.get, TRUE))
        .newLines(table)
    else
        table
}

.newLines <- function(table) {
    cleanup <- function(x) {
        gsub("$", "\n", unlist(x), fixed = TRUE)
    }
    sapply(table, cleanup)
}

#' Vectors of Tokens for all Speeches According to Speaker
#'
#' Given a proxy for a play, act or scene object in Python, or for a list of
#' speeches, the function returns a named list, with names being the speakers.
#' The corresponding element is a list of
#' tokens as produced by the \code{word_tokenizer()} function in Python, converting the
#' speeches by this speaker into a stream of tokens.
#'
#' This function extends the proxy for a Python function of the same name
#' and argument.  If the optional argument \code{.get} is \code{TRUE},
#' the value returned by the Python function is converted and
#' the lines for each speech are unlisted into a character vector.
#' @seealso tokens This returns the same information but in one vector for the tokens in all speeches.
#' @export
speechTokens <- function(speeches, .get = NA) {
    table <- speechTokens_Python(speeches, .get = .get)
    if(identical(.get, TRUE))
        lapply(table, function(splist) lapply(splist, function(x)
            gsub("$", "\n", unlist(x), fixed = TRUE)))
    else
        table
}
