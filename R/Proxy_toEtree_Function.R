#' Convert an Object to a Parsed Etree
#' 
#' [Python Documentation]
#' Parse the file name, or if it's not a string, assume it's
#' a previously parsed tree.  (Should of course check that).
#'     
#' @section Proxy Function:
#' toEtree(what) [Python]
toEtree <- new("PythonFunction"
    , .Data = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    nPyArgs <- nargs() - (!missing(.ev))
    if (nPyArgs < 1) 
        stop("Python function toEtree() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function toEtree() only allows 1 argument; got ", 
            nPyArgs)
    .ev$Import("thePlay", "toEtree")
    .ev$Call("toEtree", ..., .get = .get)
}
    , name = "toEtree"
    , module = "thePlay"
    , evaluatorClass = structure("PythonInterface", package = "XRPython")
    , serverDoc = "Parse the file name, or if it's not a string, assume it's\na previously parsed tree.  (Should of course check that).\n    "
    , serverArgs = "what"
)
