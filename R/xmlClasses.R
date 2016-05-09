#' Proxy for Python Class ElementTree in Module xml.etree.ElementTree
#' 
ElementTree_Python <- setRefClass("ElementTree_Python", contains = c("ProxyClassObject"))
ElementTree_Python <- XR::setProxyClass("ElementTree", module = "xml.etree.ElementTree",
    evaluatorClass = "PythonInterface", language = "Python", proxyObjectClass = "PythonObject",
    methods = list()
    )

ElementTree_Python$methods(
initialize = function (..., evaluator, .serverObject) 
{
    if (missing(evaluator)) 
        evaluator <- XR::getInterface("PythonInterface")
    if (missing(.serverObject)) {
        evaluator$Import("xml.etree.ElementTree")
        .serverObject <- evaluator$New("ElementTree", "xml.etree.ElementTree", 
            ...)
    }
    if (is(.serverObject, "ProxyClassObject")) 
        proxy <- .serverObject$.proxyObject
    else proxy <- .serverObject
    .proxyObject <<- proxy
    .ev <<- evaluator
},

ServerClassInfo = function () 
list(ServerClass = "ElementTree", ServerModule = "xml.etree.ElementTree", 
    language = "Python", evaluatorClass = "PythonInterface", 
    proxyFields = NULL, proxyMethods = c("initialize", "ServerClassInfo", 
    "find", "findall", "findtext", "getiterator", "getroot", 
    "iter", "iterfind", "parse", "write", "write_c14n"), proxyContains = character(0), 
    proxyObjectClass = "PythonObject"),

find = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "find", ..., .get = .get)
}, name = "find", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

findall = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "findall", ..., .get = .get)
}, name = "findall", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

findtext = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "findtext", ..., .get = .get)
}, name = "findtext", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

getiterator = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "getiterator", ..., .get = .get)
}, name = "getiterator", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

getroot = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "getroot", ..., .get = .get)
}, name = "getroot", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

iter = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "iter", ..., .get = .get)
}, name = "iter", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

iterfind = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "iterfind", ..., .get = .get)
}, name = "iterfind", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

parse = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "parse", ..., .get = .get)
}, name = "parse", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

write = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "write", ..., .get = .get)
}, name = "write", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

write_c14n = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "write_c14n", ..., .get = .get)
}, name = "write_c14n", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")))


#' Proxy for Python Class Element in Module xml.etree.ElementTree
#' 
Element_Python <- setRefClass("Element_Python", contains = c("ProxyClassObject"), fields = c("attrib", "tag", "tail", "text"))
Element_Python <- XR::setProxyClass("Element", module = "xml.etree.ElementTree",
    evaluatorClass = "PythonInterface", language = "Python", proxyObjectClass = "PythonObject",
    methods = list(),
    fields = list(
      attrib = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.attrib", proxy)
          else {
              .ev$Command("%s.attrib = %s", proxy, value)
              invisible(value)
          }
      },
      tag = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.tag", proxy)
          else {
              .ev$Command("%s.tag = %s", proxy, value)
              invisible(value)
          }
      },
      tail = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.tail", proxy)
          else {
              .ev$Command("%s.tail = %s", proxy, value)
              invisible(value)
          }
      },
      text = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.text", proxy)
          else {
              .ev$Command("%s.text = %s", proxy, value)
              invisible(value)
          }
      }
      )
    )

Element_Python$methods(
initialize = function (..., evaluator, .serverObject) 
{
    if (missing(evaluator)) 
        evaluator <- XR::getInterface("PythonInterface")
    if (missing(.serverObject)) {
        evaluator$Import("xml.etree.ElementTree")
        .serverObject <- evaluator$New("Element", "xml.etree.ElementTree", 
            ...)
    }
    if (is(.serverObject, "ProxyClassObject")) 
        proxy <- .serverObject$.proxyObject
    else proxy <- .serverObject
    .proxyObject <<- proxy
    .ev <<- evaluator
},

ServerClassInfo = function () 
list(ServerClass = "Element", ServerModule = "xml.etree.ElementTree", 
    language = "Python", evaluatorClass = "PythonInterface", 
    proxyFields = c("attrib", "tag", "tail", "text"), proxyMethods = c("initialize", 
    "ServerClassInfo", "append", "clear", "copy", "extend", "find", 
    "findall", "findtext", "get", "getchildren", "getiterator", 
    "insert", "items", "iter", "iterfind", "itertext", "keys", 
    "makeelement", "remove", "set"), proxyContains = character(0), 
    proxyObjectClass = "PythonObject"),

append = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "append", ..., .get = .get)
}, name = "append", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

clear = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "clear", ..., .get = .get)
}, name = "clear", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

copy = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "copy", ..., .get = .get)
}, name = "copy", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

extend = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "extend", ..., .get = .get)
}, name = "extend", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

find = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "find", ..., .get = .get)
}, name = "find", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

findall = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "findall", ..., .get = .get)
}, name = "findall", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

findtext = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "findtext", ..., .get = .get)
}, name = "findtext", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

get = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "get", ..., .get = .get)
}, name = "get", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

getchildren = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "getchildren", ..., .get = .get)
}, name = "getchildren", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

getiterator = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "getiterator", ..., .get = .get)
}, name = "getiterator", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

insert = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "insert", ..., .get = .get)
}, name = "insert", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

items = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "items", ..., .get = .get)
}, name = "items", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

iter = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "iter", ..., .get = .get)
}, name = "iter", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

iterfind = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "iterfind", ..., .get = .get)
}, name = "iterfind", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

itertext = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "itertext", ..., .get = .get)
}, name = "itertext", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

keys = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "keys", ..., .get = .get)
}, name = "keys", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

makeelement = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "makeelement", ..., .get = .get)
}, name = "makeelement", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

remove = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "remove", ..., .get = .get)
}, name = "remove", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

set = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "set", ..., .get = .get)
}, name = "set", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")))


