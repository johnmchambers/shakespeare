#' Python Function to Parse XML File for Play
#' 
#' [Python Documentation]
#' Parse the file name, or if it's not a string, assume it's
#' a previously parsed tree.  (Should of course check that).
#'     
#' @section Proxy Function:
#' getPlay(what) [Python]
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
#' (the XML element for the scene).
#'     
#' @section Proxy Function:
#' getScenes(play) [Python]
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
    , serverDoc = "Return a list of the scenes in the XML object \"play\".  Each element of the list is\nan object of class \"Scene\" with fields \"title\", \"act\" and \"data\"\n(the XML element for the scene).\n    "
    , serverArgs = "play"
)

#' Python List of all Speeches of a Play
#' 
#' [Python Documentation]
#' Return a list of the speeches in the XML object "play".  Each element of the list is
#' an object of class "Speech" with fields "title", "act", "scene" and "data"
#' (the list of lines of text in the speech).
#'     
#' @section Proxy Function:
#' getSpeeches(play) [Python]
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
    , serverDoc = "Return a list of the speeches in the XML object \"play\".  Each element of the list is\nan object of class \"Speech\" with fields \"title\", \"act\", \"scene\" and \"data\"\n(the list of lines of text in the speech).\n    "
    , serverArgs = "play"
)

#' Python Function to Parse XML File
#' 
#' @section Proxy Function:
#' parse(source, parser =) [Python]
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

