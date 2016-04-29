#' Get the Python Tree for a Play
#' 
#' [Python Documentation]
#' Parse the file name, or if it's not a string, assume it's
#' a previously parsed tree.  (Should of course check that).
#'     
#' @section Proxy Function:
#' getPlay(what) [Python]
getPlay <- new("PythonFunction"
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
#' List (in Python) of the Acts of a Play
#' 
#' [Python Documentation]
#' Return a list of the acts in the XML object "play".  Each element of the list is
#' an object of class "Act" with fields "title" and "data" (the XML element for the act).
#'     
#' @section Proxy Function:
#' getActs(play) [Python]
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
