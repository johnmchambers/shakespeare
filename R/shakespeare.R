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
#' @template reference
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
#' @template reference
speechTokens <- function(speeches, .get = NA) {
    table <- speechTokens_Python(speeches, .get = .get)
    if(identical(.get, TRUE))
        lapply(table, function(splist) lapply(splist, function(x)
            gsub("$", "\n", unlist(x), fixed = TRUE)))
    else
        table
}


allKeys <- function()
    .playsTable$keys

playWords <- function(play) {
    wordTable <- .playsTable$wordTable
    if(is.null(wordTable)) { # initialize
        wordTable <- list()
        for(key in allKeys()) {
            allTokens <- tokens(Play(key)$speeches)
            wordTable[[key]] <- unlist(wordsUsed(allTokens, .get=TRUE), use.names = FALSE)
        }
        .playsTable$wordTable <- wordTable
    }
    if(missing(play))
        wordTable
    else
        wordTable[[findPlay(play)]]
}

otherWords <- function(play) {
    otherTable <- .playsTable$otherWords
    if(is.null(otherTable)) { # initialize
        allWords <- playWords()
        keys <- allKeys()
        otherTable <- list()
        for(i in seq_along(keys)) {
            otherTable[[i]] <- unique(unlist(allWords[-i], use.names = FALSE))
        }
        names(otherTable) <- keys
        .playsTable$otherWords <- otherTable
    }
    if(missing(play))
        otherTable
    else
        otherTable[[findPlay(play)]]
}

playLength <- function(play) {
    lengths <- .playsTable$playLength
    if(is.null(lengths)) {
        keys <- allKeys()
        lengths <- integer(length(keys))
        for(i in seq_along(keys)) {
            allTokens <- tokens(Play(keys[[i]])$speeches, .get=TRUE)
            lengths[[i]] <- length(unlist(allTokens, use.names = FALSE))
        }
        names(lengths) <- keys
        .playsTable$playLength <- lengths
    }
    if(missing(play))
        lengths
    else
        lengths[[findPlay(play)]]
}

.speechesTable <- new.env(parent = emptyenv())

getSpeeches <- function(play, tokens = TRUE, tokenCase = FALSE, key = "") {
    if(is.character(play)) {
        play <- Play(play) # error if not found
        if(missing(key))
            key <- play$key
        play <- play$parse
    }
    if(is(play, "ElementTree_Python"))
    {
        save <- nzchar(key)
        if(!save) ## use the proxy object's Python name, but don't serialize
            key <- XR::proxyName(play)
        if(exists(key, envir = .speechesTable) && !tokenCase)
            speeches <- get(key, envir = .speechesTable)
        else {
            ## is there a serialized version?
            file <- playSaveFile(key,  "speeches", "r")
            if(save && nzchar(file))
                speeches <- play$.ev$Unserialize(file)
            else
                speeches <- getSpeeches_Python(play, tokens, tokenCase)
                file <- playSaveFile(key, "speeches", "w")
                if(save && nzchar(file))
                    play$.ev$Serialize(speeches, file)
            assign(key, speeches, envir = .speechesTable)
            }
        speeches
        }
    else ## TODO:  should have some methods for other formats?
        stop(gettextf("Argument 'play' must identify one of the 37 plays: got %s", dQuote(class(play))))
}



