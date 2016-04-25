parseXML <- new("PythonFunction", .Data = function (..., .ev = XRPython::RPython(), 
    .get = NA) 
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
}, serverDoc = character(0), serverArgs = c("source", "parser ="), name = "parse", 
    module = "xml.etree.ElementTree", evaluatorClass = structure("PythonInterface", package = "XRPython"))

