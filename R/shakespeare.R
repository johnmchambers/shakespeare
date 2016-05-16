#' Contents of Speeches Tokenized and Split According to Speaker
#'
#' The Python NLTK software is used to produce tokenized versions of all
#' the speeches supplied in the argument.
#' The resulting dictionary is returned to R as a named list.
#' The list corresponding to a particular speaker is unlisted and
#' the token \code{"$"} used as a line separator is replaced with new line
#' characters.
#' @param speeches Proxy for a Python object containing the relevant speeches.
#' This may be a list of speeches or and object for which \code{getSpeeches()}
#' returns such a list.  Possiblities include a Play, Act or Scene object.
#' @export
tokens <- function(speeches) {
    table <- tokens_Python(speeches, .get = TRUE)
    .newLines(table)
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
#' The corresponding element is a list of the speeches
#' made by this speaker; each list is represented by the vector of corresponging
#' tokens as produced by the \code{word_tokenizer()} function in Python.
#'
#' This function extends the proxy for a Python function of the same name
#' and argument, by getting the value returned by that function and then
#' unlisting the lines for each speech into a character vector.
#' @seealso tokens This returns the same information but in one vector for the tokens in all speeches by this speaker.
#' @export
speechTokens <- function(speeches) {
    table <- speechTokens_Python(speeches, .get = TRUE)
    lapply(table, function(splist) lapply(splist, function(x)
                               gsub("$", "\n", unlist(x), fixed = TRUE)))
}
