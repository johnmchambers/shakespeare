#' Python Function to Parse XML File for Play
#' 
#' [Python Documentation]
#' Parse the file name, or if it's not a string, assume it's
#' a previously parsed tree.  (Should of course check that).
#'     
#' @section Proxy Function:
#' getPlay(what) [Python]
#' @export
getPlay_Python <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

getPlay_Python <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- nargs() - (!missing(.ev))
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
#' @section Proxy Function:
#' getActs(play) [Python]
#' @export
getActs <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

getActs <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- nargs() - (!missing(.ev))
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
#' @section Proxy Function:
#' getScenes(play) [Python]
#' @export
getScenes <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

getScenes <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- nargs() - (!missing(.ev))
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
#' @section Proxy Function:
#' getSpeeches(play) [Python]
#' @export
getSpeeches <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

getSpeeches <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- nargs() - (!missing(.ev))
    if (nPyArgs < 1) 
        stop("Python function getSpeeches() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function getSpeeches() only allows 1 argument; got ", 
            nPyArgs)
    .ev$Import("thePlay", "getSpeeches")
    .ev$Call("getSpeeches", ..., .get = .get)
}
    , name = "getSpeeches"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "Return a list of the speeches in the XML object \"play\".  Each element of the list is\nan object of class \"Speech\" with fields \"title\", \"act\", \"scene\" and \"data\"\n(the list of lines of text in the speech).  The argument can alternatively be an Act  or Scene\nobject to obtain a list of speeches from just that act or scene."
    , serverArgs = "play"
)

#' Python List of the Persons Listed for the Play
#' 
#' [Python Documentation]
#' A dictionary whose keys are all the names of speakers with speeches in the list.  The entry will be
#' the total character count of the speeches if argument count is True, else just True.
#' The list of speeches can come from the "speeches" field of a Play object or as the result of calling
#' getSpeeches() for a whole play, an act or a scene.
#' @section Proxy Function:
#' speakers(speeches, count =) [Python]
#' @export
speakers <- function(..., .ev = XR::getInterface(), .get = TRUE)
    NULL

speakers <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = TRUE) 
{
    nPyArgs <- nargs() - (!missing(.ev))
    if (nPyArgs < 1) 
        stop("Python function speakers() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function speakers() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$Import("thePlay", "speakers")
    .ev$Call("speakers", ..., .get = .get)
}
    , name = "speakers"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "A dictionary whose keys are all the names of speakers with speeches in the list.  The entry will be\nthe total character count of the speeches if argument count is True, else just True.\nThe list of speeches can come from the \"speeches\" field of a Play object or as the result of calling\ngetSpeeches() for a whole play, an act or a scene."
    , serverArgs = c("speeches", "count =")
)

#' Python Dictionary of the Speakers in a List of Speeches
#' 
#' [Python Documentation]
#' Returns a list of character strings describing the personae in the play.  In the style of
#' the XML coding, each string is the name of the person as it will appear in speeches given
#' by that character, followed by a description.  <NOT YET>:For personae listed in a group rather than
#' separately, this function inserts the group description, in square brackets.
#' @section Proxy Function:
#' getPersonae(play) [Python]
#' @export
getPersonae <- function(..., .ev = XR::getInterface(), .get = TRUE)
    NULL

getPersonae <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = TRUE) 
{
    nPyArgs <- nargs() - (!missing(.ev))
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
#' @section Proxy Function:
#' parse(source, parser =) [Python]
#' @export
parseXML <- function(..., .ev = XR::getInterface(), .get = NA)
    NULL

parseXML <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- nargs() - (!missing(.ev))
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

