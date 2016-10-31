#' Python Function to Parse XML File for Play
#' 
#' [Python Documentation]
#' Parse the file name, or if it's not a string, assume it's
#' a previously parsed tree.  (Should of course check that).
#'     
#' @section Python Functions:
#' getPlay(what)
#' @export
getPlay_Python <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

getPlay_Python <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function getPlay() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function getPlay() only allows 1 argument; got ", 
            nPyArgs)
    .ev$Import("thePlay", "getPlay")
    .ev$Call("getPlay", ..., .get = .get)
}
    , name = "getPlay"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "Parse the file name, or if it's not a string, assume it's\na previously parsed tree.  (Should of course check that).\n    "
    , serverArgs = "what"
)

#' Python List of all Acts of a Play
#' 
#' [Python Documentation]
#' Return a list of the acts in the XML object "play".  Each element of the list is
#' an object of class "Act" with fields "title" and "data" (the XML element for the act).
#'     
#' @section Python Functions:
#' getActs(play)
#' @export
getActs <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

getActs <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function getActs() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function getActs() only allows 1 argument; got ", 
            nPyArgs)
    .ev$Import("thePlay", "getActs")
    .ev$Call("getActs", ..., .get = .get)
}
    , name = "getActs"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "Return a list of the acts in the XML object \"play\".  Each element of the list is\nan object of class \"Act\" with fields \"title\" and \"data\" (the XML element for the act).\n    "
    , serverArgs = "play"
)

#' Python List of all Scenes of a Play
#' 
#' [Python Documentation]
#' Return a list of the scenes in the XML object "play".  Each element of the list is
#' an object of class "Scene" with fields "title", "act" and "data"
#' (the XML element for the scene).  The argument can alternatively be an Act object to obtain a list
#' of scenes from just that act.
#' @section Python Functions:
#' getScenes(play)
#' @export
getScenes <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

getScenes <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function getScenes() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function getScenes() only allows 1 argument; got ", 
            nPyArgs)
    .ev$Import("thePlay", "getScenes")
    .ev$Call("getScenes", ..., .get = .get)
}
    , name = "getScenes"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "Return a list of the scenes in the XML object \"play\".  Each element of the list is\nan object of class \"Scene\" with fields \"title\", \"act\" and \"data\"\n(the XML element for the scene).  The argument can alternatively be an Act object to obtain a list\nof scenes from just that act."
    , serverArgs = "play"
)

#' Python List of all Speeches of a Play (or Act or Scene)
#' 
#' [Python Documentation]
#' Return a list of the speeches in the XML object "play".  Each element of the list is
#' an object of class "Speech" with fields "title", "act", "scene" and "data"
#' (the list of lines of text in the speech).  The argument can alternatively be an Act  or Scene
#' object to obtain a list of speeches from just that act or scene.
#' 
#' The argument "tokens" determines whether the original text or a list of tokens is returned; if it is True,
#' the argument "tokenCase" determines whether upper/lower case is distinguished in the tokesn.
#' @section Python Functions:
#' getSpeeches(play, tokens =, tokenCase =)
#' @export
getSpeeches <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

getSpeeches <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function getSpeeches() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 3) 
        stop("Python function getSpeeches() only allows 3 arguments; got ", 
            nPyArgs)
    .ev$Import("thePlay", "getSpeeches")
    .ev$Call("getSpeeches", ..., .get = .get)
}
    , name = "getSpeeches"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "Return a list of the speeches in the XML object \"play\".  Each element of the list is\nan object of class \"Speech\" with fields \"title\", \"act\", \"scene\" and \"data\"\n(the list of lines of text in the speech).  The argument can alternatively be an Act  or Scene\nobject to obtain a list of speeches from just that act or scene.\n\nThe argument \"tokens\" determines whether the original text or a list of tokens is returned; if it is True,\nthe argument \"tokenCase\" determines whether upper/lower case is distinguished in the tokesn."
    , serverArgs = c("play", "tokens =", "tokenCase =")
)

#' Python List of the Persons Listed for the Play
#' 
#' [Python Documentation]
#' A list of all the speakers found in the speeches. The argument
#' can be a list of speeches or an object (Play, Act, Scene) for which
#' getSpeeches() returns such a list.
#' @section Python Functions:
#' speakers(speeches)
#' @export
speakers <- function(..., .ev = XR::getInterface(), .get = TRUE)
    NULL

speakers <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = TRUE) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function speakers() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function speakers() only allows 1 argument; got ", 
            nPyArgs)
    .ev$Import("thePlay", "speakers")
    .ev$Call("speakers", ..., .get = .get)
}
    , name = "speakers"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "A list of all the speakers found in the speeches. The argument\ncan be a list of speeches or an object (Play, Act, Scene) for which\ngetSpeeches() returns such a list."
    , serverArgs = "speeches"
)

#' Speeches Tokenized in a Python Dictionary by Speaker
#' 
#' [Python Documentation]
#' A dictionary whose keys are all the names of speakers with speeches in the list.
#' The corresponding element is a list of all the tokens spoken by each speaker.
#' Special tokens '$' and '/>' are inserted to mark the end of lines and the end of individual
#' speeches.
#' 
#' The argument can be from the "speeches" field of a Play object or the result
#' of any other computation.
#' The argument could also be an Act, Scene or Play:  any object for which getSpeeches()
#' returns a list of speeches.
#' @section Python Functions:
#' tokens(speeches)
#' @export
tokens_Python <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

tokens_Python <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function tokens() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function tokens() only allows 1 argument; got ", 
            nPyArgs)
    .ev$Import("thePlay", "tokens")
    .ev$Call("tokens", ..., .get = .get)
}
    , name = "tokens"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "A dictionary whose keys are all the names of speakers with speeches in the list.\nThe corresponding element is a list of all the tokens spoken by each speaker.\nSpecial tokens '$' and '/>' are inserted to mark the end of lines and the end of individual\nspeeches.\n\nThe argument can be from the \"speeches\" field of a Play object or the result\nof any other computation.\nThe argument could also be an Act, Scene or Play:  any object for which getSpeeches()\nreturns a list of speeches."
    , serverArgs = "speeches"
)

#' A Python Dictionary of all Speeches by Speaker
#' 
#' [Python Documentation]
#' A dictionary whose keys are the names of all speakers with speeches in the list.
#' The corresponding element is a list of all the speeches spoken by that speaker, with
#' each speech converted into a list of its tokens.
#' 
#' The argument can be from the "speeches" field of a Play object or the result
#' of any other computation.
#' The argument could also be an Act, Scene or Play:  any object for which getSpeeches()
#' returns a list of speeches.
#' @section Python Functions:
#' speechTokens(speeches)
#' @export
speechTokens_Python <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

speechTokens_Python <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function speechTokens() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function speechTokens() only allows 1 argument; got ", 
            nPyArgs)
    .ev$Import("thePlay", "speechTokens")
    .ev$Call("speechTokens", ..., .get = .get)
}
    , name = "speechTokens"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "A dictionary whose keys are the names of all speakers with speeches in the list.\nThe corresponding element is a list of all the speeches spoken by that speaker, with\neach speech converted into a list of its tokens.\n\nThe argument can be from the \"speeches\" field of a Play object or the result\nof any other computation.\nThe argument could also be an Act, Scene or Play:  any object for which getSpeeches()\nreturns a list of speeches."
    , serverArgs = "speeches"
)

#' Python Dictionary of the Speakers in a List of Speeches
#' 
#' [Python Documentation]
#' Returns a list of character strings describing the personae in the play.  In the style of
#' the XML coding, each string is the name of the person as it will appear in speeches given
#' by that character, followed by a description.  <NOT YET>:For personae listed in a group rather than
#' separately, this function inserts the group description, in square brackets.
#' @section Python Functions:
#' getPersonae(play)
#' @export
getPersonae <- function(..., .ev = XR::getInterface(), .get = TRUE)
    NULL

getPersonae <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = TRUE) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function getPersonae() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function getPersonae() only allows 1 argument; got ", 
            nPyArgs)
    .ev$Import("thePlay", "getPersonae")
    .ev$Call("getPersonae", ..., .get = .get)
}
    , name = "getPersonae"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "Returns a list of character strings describing the personae in the play.  In the style of\nthe XML coding, each string is the name of the person as it will appear in speeches given\nby that character, followed by a description.  <NOT YET>:For personae listed in a group rather than\nseparately, this function inserts the group description, in square brackets."
    , serverArgs = "play"
)

#' Python Function to Parse XML File
#' 
#' @section Python Functions:
#' parse(source, parser =)
#' @export
parseXML <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

parseXML <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function parse() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function parse() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$Import("xml.etree.ElementTree", "parse")
    .ev$Call("parse", ..., .get = .get)
}
    , name = "parse"
    , module = "xml.etree.ElementTree"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = character(0)
    , serverArgs = c("source", "parser =")
)

#' Python List of the Distinct Words in a List of Tokens
#' 
#' [Python Documentation]
#' Given a list of tokens, returns a list of the distinct words included.
#' Words are converted to lower case for comparison.
#' Common words are excluded by default, being defined as the stopwords set from
#' NLTK supplemented with a few common words in Elizabethan English.
#' Punctuation is also excluded by default.  Optional second & third arguments in
#' the call can override if supplied as True.
#' 
#' The function can also be called with a dictionary whose elements are token lists,
#' as returned by the tokens() function. In this case, it calls iself recursively to in
#' effect apply the function to each element, returning a corresponding dictionary.
#' @section Python Functions:
#' wordsUsed(tokens, includeCommon =, includePunctuation =)
#' @export
wordsUsed <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

wordsUsed <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function wordsUsed() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 3) 
        stop("Python function wordsUsed() only allows 3 arguments; got ", 
            nPyArgs)
    .ev$Import("thePlay", "wordsUsed")
    .ev$Call("wordsUsed", ..., .get = .get)
}
    , name = "wordsUsed"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "Given a list of tokens, returns a list of the distinct words included.\nWords are converted to lower case for comparison.\nCommon words are excluded by default, being defined as the stopwords set from\nNLTK supplemented with a few common words in Elizabethan English.\nPunctuation is also excluded by default.  Optional second & third arguments in\nthe call can override if supplied as True.\n\nThe function can also be called with a dictionary whose elements are token lists,\nas returned by the tokens() function. In this case, it calls iself recursively to in\neffect apply the function to each element, returning a corresponding dictionary."
    , serverArgs = c("tokens", "includeCommon =", "includePunctuation =")
)

#' List of Lines Matching Specified Text in a List of Speeches
#' 
#' [Python Documentation]
#' Given a character string, text, and a list of speeches, returns a parallel list
#' each element of which is the list of matching lines in the speech, as returned by the
#' findText() method.  The arguments token and ignoreCase are passed to that method.
#' If token is True, the match will be against the word tokens constructed for the speech list when
#' the corresponding play was intialized.  Otherwise the match is against the text of the lines.
#' The default for argument ignoreCase is True if tokens is True else False.
#' @section Python Functions:
#' searchSpeeches(text, speeches, tokens =, ignoreCase =)
#' @export
searchSpeeches <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

searchSpeeches <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 2) 
        stop("Python function searchSpeeches() requires at least 2 arguments; got ", 
            nPyArgs)
    if (nPyArgs > 4) 
        stop("Python function searchSpeeches() only allows 4 arguments; got ", 
            nPyArgs)
    .ev$Import("thePlay", "searchSpeeches")
    .ev$Call("searchSpeeches", ..., .get = .get)
}
    , name = "searchSpeeches"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "Given a character string, text, and a list of speeches, returns a parallel list\neach element of which is the list of matching lines in the speech, as returned by the\nfindText() method.  The arguments token and ignoreCase are passed to that method.\nIf token is True, the match will be against the word tokens constructed for the speech list when\nthe corresponding play was intialized.  Otherwise the match is against the text of the lines.\nThe default for argument ignoreCase is True if tokens is True else False."
    , serverArgs = c("text", "speeches", "tokens =", "ignoreCase =")
)

#' List of Speeches Constructed with Fragments
#' 
#' [Python Documentation]
#' Given some a list of speeches and a parallel list of matches to lines within each speech, returns a
#' constructed list of speech fragments for any of the speeches that have nonempty matches.  All matched lines will
#' be included plus some preceding and following lines as specified by the before=
#' and after= arguments.
#' The list of matched lines will typically come from a call to searchSpeeches().
#' @section Python Functions:
#' speechFragments(speeches, matches, before =, after =, filler =)
#' @export
speechFragments <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

speechFragments <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 2) 
        stop("Python function speechFragments() requires at least 2 arguments; got ", 
            nPyArgs)
    if (nPyArgs > 5) 
        stop("Python function speechFragments() only allows 5 arguments; got ", 
            nPyArgs)
    .ev$Import("thePlay", "speechFragments")
    .ev$Call("speechFragments", ..., .get = .get)
}
    , name = "speechFragments"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "Given some a list of speeches and a parallel list of matches to lines within each speech, returns a\nconstructed list of speech fragments for any of the speeches that have nonempty matches.  All matched lines will\nbe included plus some preceding and following lines as specified by the before=\nand after= arguments.\nThe list of matched lines will typically come from a call to searchSpeeches()."
    , serverArgs = c("speeches", "matches", "before =", "after =", "filler =")
)

#' List of the Distinct String Values for a Specified Python Field
#' 
#' [Python Documentation]
#' Given a list of objects, all of which have a string-valued field specified by what,
#' returns a list of the distinct strings found in all the elements of objects.
#' @section Python Functions:
#' allFieldStrings(objects, what)
#' @export
allFieldStrings <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

allFieldStrings <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 2) 
        stop("Python function allFieldStrings() requires at least 2 arguments; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function allFieldStrings() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$Import("thePlay", "allFieldStrings")
    .ev$Call("allFieldStrings", ..., .get = .get)
}
    , name = "allFieldStrings"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "Given a list of objects, all of which have a string-valued field specified by what,\nreturns a list of the distinct strings found in all the elements of objects."
    , serverArgs = c("objects", "what")
)

