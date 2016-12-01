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

#' Generate a List of Speeches
#'
#' Given the parsed version of a play or portion of one, or a character string to identify one of the plays, returns a proxy
#' for the list of \code{"Speech"} objects contained in play.  For all the speeches in a play, this function will have been
#' called when the \code{\linkS4class{Play}} object is initialized, and can be accessed as the \code{"speeches"} field of
#' the object.  Only for special purposes does \code{getSpeeches()} need to be called explicitly; see \dQuote{Details}.
#'
#' This function is only needed explicitly for a specialized speech list.  The standard speech list has lines of text and
#' a parallel list of the tokenized, case insensitive version of those lines.  Those speech lists are stored in a table
#' (an environment) according to the key for each play.  They can be obtained without recomputing as the corresponding field
#' of the \code{"Play"} object or by calling \code{getSpeeches()} with the name of the play as argument.
#' If one wanted, for example, a case sensitive version of the speech list, that does require computing by a call to
#' \code{getSpeeches()}.  That result can also be stored for future access by supplying the \code{key} argument (as
#' a string \emph{different} from the play's key).
#' @param play the name of the play, or the \quote{"parse"} field of a play object.  Can be omitted to retrieve a special
#' speech list (see \dQuote{Deatails}).
#' @param tokens,tokenCase controls whether tokens are computed and if so whether they are case sensitive.  (see \dQuote{Deatails}).
#' @param key the string under which the computed speech list will be stored for the session.  Omitted unless a special speech list is being computed, in which case can be supplied to retrieve that list later (see \dQuote{Deatails}).
#' @param asSpeechList should the result be from class SpeechList? (for internal use)
getSpeeches <- function(play = NULL, tokens = TRUE, tokenCase = FALSE, key = "", asSpeechList = TRUE) {
    if(is.character(play)) {
        name <- findPlay(play, get = FALSE) # error if not found
        if(missing(key) && tokens && !tokenCase) # the default, ok to save under play's key
            key <- name
        play <- getPlay(name) # the parse tree
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
    }
    else if(is.null(play) && nzchar(key))
        speeches <- get(key, envir = .speechesTable)
    else ## TODO:  should have some methods for other formats?
        stop(gettextf("Argument 'play' must identify one of the 37 plays: got %s", dQuote(class(play))))
    if(asSpeechList)
        SpeechList(speeches, tokens=tokens, tokenCase=tokenCase)
    else
        speeches
}

## some templates for python apply functions

## find a token, maybe only the first, maybe all
.f.token = c(
"def NAME(i, line, tokens, value):",
"    for token in tokens:",
"        if ALLOW r\"TARGET\" == token:",
"            value.append(i)",
"            MAYBE_EXIT",
"    return False"
)

## match a string in a line
.f.string = c(
"def NAME(i, line, tokens, value):",
"    if ALLOW r\"TARGET\" in line:",
"        value.append(i)",
"        MAYBE_EXIT",
"    return False"
)

##match a regular expression in a line
.f.regexp = c(
"def NAME(i, line, tokens, value):",
"    if ALLOW re.search(r\"TARGET\", line):",
"        value.append(i)",
"        MAYBE_EXIT",
"    return False"
)

SearchFun <- setClass("SearchFun",
                      slots = c(source = "character", type = "character", text = "character"),
                      contains = "AssignedProxy")

setMethod("show", "SearchFun",
          function(object) {
              cat(gettextf("Python search function of class %s for %s = %s\n",
                         XR::nameQuote(class(object)), object@type, XR::nameQuote(object@text)))
              cat("\nPython Function:\n")
              writeLines(paste(" ", object@source))
          })

searchFun <- function(..., first = FALSE, exclude = FALSE, fName = .ev$ProxyName(), .ev = XRPython::RPython()) {
    arg = list(...)
    if(length(arg) != 1)
        stop("you should give one named argument; e.g., token = \"....\"")
    type <- names(arg)
    text <- arg[[1]]
    fun <- switch(type,
                  token = .f.token,
                  string =.f.string,
                  regexp = .f.regexp,
                  pattern = f.regexp,
                  stop(gettextf("Not one of the recognized search types: %s",XR::nameQuote(names(arg)))))
    fun <- gsub("TARGET", text, fun, fixed = TRUE)
    fun <- gsub("ALLOW", if(exclude) "not" else "", fun, fixed = TRUE)
    fun <- gsub("MAYBE_EXIT", if(first) "return value" else "None", fun, fixed = TRUE)
    fun <- gsub("NAME", fName, fun)
    .ev$Define(fun)
    SearchFun(.ev$Eval(fName), source = fun, type = type, text = text)
}

