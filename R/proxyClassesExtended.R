## class definitions that depend on the proxies to Python classes
## and need to come after proxyClasses.R in collation order

#' Class for Python List of Speech objects
#'
#' The R reference class \code{"SpeechList"} extends the proxy class for a Python list.  The assertion (unchecked) is
#' that the elements of the Python list are of class \code{"Speech"}.
#' In particular, every object of R class \code{\linkS4class{Play}} has a field containing a list of all the speeches
#' in the play, computed when the play is installed for this session.
#' @field tokens should the speech elements inclue token list as well as lines of text? Default \code{TRUE}.
#' @field tokenCase should the tokens in the list be case sensitive?  Default \code{FALSE}.
SpeechList <- setRefClass("SpeechList", contains = "list_Python",
                          fields = c("tokens" = "logical", tokenCase = "logical"))

SpeechList$methods(
    initialize = function(tree = NULL, ...) {
        tokens <<- TRUE
        tokenCase <<- FALSE
        initFields(...) #MUST call this, not callSuper() which calls the initializer for list_Python
        if(!is.null(tree)) {
            ## either a Python list of the speeches:
            if(is(tree, "list_Python"))
                pp <- tree
            ## or something that defines a play or parsed tree from which to find the speeches:
            else
                pp <- getSpeeches(tree, tokens, tokenCase, asSpeechList = FALSE) #(to avoid recursion)
            ## set the proxy part :: should be a SetProxy() method in XR
            .proxyObject <<- pp$.proxyObject
            .proxyClass <<- pp$.proxyClass
            .ev <<- pp$.ev
        }
    },
    show = function() {
        'automatic printing summarizes the Python object; to convert the list to R and print, use $print()'
        plays <- unlist(allFieldStrings(.self, "playTitle", .get=TRUE))
    cat(gettextf("%s object of size %d; speeches from %s\n",
                 class(.self), size(), paste(dQuote(plays), collapse = ", ")))
    },
    print = function() {
        'this method prints the entire list of speeches; e.g., the whole play, in contrast to the automatic show() method, which prints only a summary.'
        n <- size()
        if(is.na(n)) {
            warning("SpeechList object had NA for the size slot")
            n <- 0
        }
        if(n > 0) {
            playP <- actP <- sceneP <-  ""
            for(i in 0:(n-1)) {
                sp <- el(i)
                if(!is(sp, "Speech_Python")) {
                    warning(gettextf("Element %s is not a Speech object: skipping", i+1))
                    next
                }
                play <- sp$playTitle; act <- sp$act; scene <- sp$scene
                printSpeech(sp, !identical(play, playP), !identical(act, actP),
                            !identical(scene, sceneP), FALSE)
                playP <- play; actP <- act; sceneP <- scene
                cat("\n")
            }
        }
    }
    )

#' A Class for the Python/XML Version of a Play
#'
#' The plays are parsed from the set of XML files into Python \code{"ElementTree"} objects.
#' An R object from class \code{"Play"} has a proxy to the parsed play plus fields for the
#' names of the personae and a proxy to a Python list of all the speeches.
#'
#' @field parse The Python parse of the XML file,  proxy class for \code{"ElementTree"}.
#' @field personae Character vector of the descriptions of the personae in the play.  Note that this
#' comes from the play itself.  The names of speakers usually match one of the personae in the \code{grep()}
#' sense, but not always.
#' @field title The character string title, as found in the XML representation.
#' @field speeches Proxy for Python list (class \code{"SpeechList"}) of all the speeches (each element an object
#' of Python class \code{"Speech"}).  This is precomputed when the \code{"Play"} object is initialized;
#' the speeches list tends to be input to many of the interesting analyses.  If you want to suppress
#' precomputation, explicitly set the field to NULL.
#' @field key The character string identifying the play in the table and also the name of the original XML file.
#' @export
Play <- setRefClass("Play",
                    fields = c(
                    parse = "ElementTree_Python",
                    personae = "character",
                    speeches = "SpeechList",
                    title = "character",
                    key = "character"
                    ))


Play$methods(
    initialize = function(name, ...) {
        if(nargs()) {
            key <<- findPlay(name, get = FALSE)
            parse <<- getPlay(key)
            personae <<- unlist(getPersonae(parse))
            title <<- parse$findtext("TITLE")
            speeches <<- getSpeeches(parse, key = key, tokens = TRUE, tokenCase = FALSE)
            callSuper(...)
        }
    }
    )

.abbrevScene <- function(scene) {
    if(grepl("^SCENE ", scene))
        gsub("[.].*","", scene)
    else
        substr(scene, 1, 10)
}

printSpeech <- function(speech, showPlay = TRUE, showAct = TRUE, showScene= TRUE, abbrevScene = TRUE) {
    ## either called with a proxy object or a previously converted (and maybe modified) speech
    if(is(speech, "Speech_Python"))
        speech <- pythonGet(speech)
    fields <- speech@fields
    header <- if(showPlay) fields$play else ""
    if(showAct) {
        if(nzchar(header))
            header <- paste0(header,",")
        header <- paste(header, fields$act)
    }
    if(showScene) {
        if(nzchar(header))
            header <- paste0(header,",")
        header <- paste(header, if(abbrevScene) .abbrevScene(fields$scene) else fields$scene)
    }
    if(nzchar(header)) cat(header, "\n")
    cat(fields$speaker, ":\n")
    writeLines(paste("   ",fields$lines))
    invisible(speech)
}

#' Print a List of Speeches or Speech Fragments
#'
#' Given a list of speech objects, print them all.  The list may be a portion
#' of a play (e.g., a scene) or a list of speech fragments generated by
#' \code{\link{searchSpeeches}()} and \code{\link{speechFragments}()}.
#' @param speeches A list of speeches, either a list in Python or the result of getting
#' such an object back to R.
#' @param printSeparator Should a special separator line be printed between speeches.  Generally you would want this if the list was a result of a search, but not
#' to print a contiguous part of the play, e.g., a scene.
printSpeeches <- function(speeches, printSeparator = TRUE) {
    if(is(speeches, "list_Python"))
        speeches <- pythonGet(speeches)
    play <- TRUE
    lastAct <- lastScene <- ""
    for(speech in speeches) {
        if(printSeparator && !identical(lastAct, "")) # separator
            cat("      ------\n")
        if(is(speech, "Speech_Python"))
            speech <- pythonGet(speech)
        fields <- speech@fields
        act <- fields$act; scene <- fields$scene
        last <- printSpeech(speech, play, !identical(act, lastAct),
                            !identical(scene,lastScene), FALSE)
        lastAct <- act; lastScene <- scene; play <- FALSE
    }
}
##TODO:  define a version of the Play class in Python but in native R form
## using the XML package to represent the XML form of the play
    ## setMethod("asServerObject",
    ## c("Play_R", "PythonObject"),
    ##       function(object, prototype) {
    ##           file <- tempfile()
    ##           XML::saveXML(object, file)
    ##           gettextf("xml.etree.ElementTree.parse(%s)",
    ##                    asServerObject(file, prototype))
    ##       })

#' Install Parsed Plays and Speeches Lists
#'
#' Installs all the plays whose keys, or uniquely identifying strings from their title, are supplied as \code{what}.
#' Installing means storing the parsed plays and derived speeches lists in tables for the session.  If the user
#' has write permission on the installed package's directories, serialized versions will be written there, to be used
#' in later R sessions, rather than recomputing the parse trees and speech lists.
#'
#' Use of this function is never required.  If a play is accessed as an object of class \code{\linkS4class{Play}}, the
#' same information will be stored for the session and written to the package files, if the user has write permission.
#' It's perhaps less likely to be confusing if the plays are installed initially, as access to the tables is essentially
#' instantaneous.  Unserializing the saved files may be mildly noticeable as a delay, and the initial parse and computation
#' is roughly twice as long again.
#'
#' @param what character vector identifying the plays to install.  By default installs all the 37 plays (which can take
#'  a minute or more, depending on the hardware).
#' @param report if \code{TRUE} the function will report its progress.
#' By default, reports if \code{what} is missing.
#' @param objects should the return value be the list of objects? If
#' not, the keys are returned. Default \code{TRUE}
#' @return either the list of all the objects or the vector of keys,
#' corresponding to the requested plays, according to \code{objects}.
installPlays <- function(what = .playsTable$keys, report = missing(what), objects = TRUE) {
    if(!length(what))
        return()
    hasParse <- playSaveFile(what[[1]], "parse", "r")
    if(!nzchar(hasParse)) {
        file <- playSaveFile(what[[1]], "parse", "w")
        if(!nzchar(file))
            warning("You don't seem to have write permission on the installed package; plays will only be installed for this session")
        else system(paste("rm",file))
    }
    if(report) cat("Installing:"); punct = " "
    for(i in seq_along(what)) {
        name <- what[[i]]
        if(report) cat(punct, name, sep = "")
        play <- Play(name)
        if(name != play$key) {
            if(report) cat(" (as ",play$key,")", sep = "")
            what[[i]] <- play$key
        }
        punct = "; "
    }
    if(report) cat("\n")
    what
}
