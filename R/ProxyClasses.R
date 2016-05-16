#' Python Class for an Act
#' 
#' @export
Act_Python <- setRefClass("Act_Python", contains = c("ProxyClassObject"), fields = c("data", "title"))
Act_Python <- XR::setProxyClass("Act", module = "thePlay",
    evaluatorClass = "PythonInterface", language = "Python", proxyObjectClass = "PythonObject",
    methods = list(),
    fields = list(
      data = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.data", proxy)
          else {
              .ev$Command("%s.data = %s", proxy, value)
              invisible(value)
          }
      },
      title = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.title", proxy)
          else {
              .ev$Command("%s.title = %s", proxy, value)
              invisible(value)
          }
      }
      )
    )

Act_Python$methods(
initialize = function (..., evaluator, .serverObject) 
{
    if (missing(evaluator)) 
        evaluator <- XR::getInterface("PythonInterface")
    if (missing(.serverObject)) {
        evaluator$Import("thePlay")
        .serverObject <- evaluator$New("Act", "thePlay", ...)
    }
    if (is(.serverObject, "ProxyClassObject")) 
        proxy <- .serverObject$.proxyObject
    else proxy <- .serverObject
    .proxyObject <<- proxy
    .ev <<- evaluator
},

ServerClassInfo = function () 
list(ServerClass = "Act", ServerModule = "thePlay", language = "Python", 
    evaluatorClass = "PythonInterface", proxyFields = c("data", 
    "title"), proxyMethods = c("initialize", "ServerClassInfo"
    ), proxyContains = character(0), proxyObjectClass = "PythonObject"))


#' Python Class for a Scene
#' 
#' @export
Scene_Python <- setRefClass("Scene_Python", contains = c("ProxyClassObject"), fields = c("act", "data", "title"))
Scene_Python <- XR::setProxyClass("Scene", module = "thePlay",
    evaluatorClass = "PythonInterface", language = "Python", proxyObjectClass = "PythonObject",
    methods = list(),
    fields = list(
      act = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.act", proxy)
          else {
              .ev$Command("%s.act = %s", proxy, value)
              invisible(value)
          }
      },
      data = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.data", proxy)
          else {
              .ev$Command("%s.data = %s", proxy, value)
              invisible(value)
          }
      },
      title = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.title", proxy)
          else {
              .ev$Command("%s.title = %s", proxy, value)
              invisible(value)
          }
      }
      )
    )

Scene_Python$methods(
initialize = function (..., evaluator, .serverObject) 
{
    if (missing(evaluator)) 
        evaluator <- XR::getInterface("PythonInterface")
    if (missing(.serverObject)) {
        evaluator$Import("thePlay")
        .serverObject <- evaluator$New("Scene", "thePlay", ...)
    }
    if (is(.serverObject, "ProxyClassObject")) 
        proxy <- .serverObject$.proxyObject
    else proxy <- .serverObject
    .proxyObject <<- proxy
    .ev <<- evaluator
},

ServerClassInfo = function () 
list(ServerClass = "Scene", ServerModule = "thePlay", language = "Python", 
    evaluatorClass = "PythonInterface", proxyFields = c("act", 
    "data", "title"), proxyMethods = c("initialize", "ServerClassInfo"
    ), proxyContains = character(0), proxyObjectClass = "PythonObject"))


#' Python Class for a Speech
#' 
#' @export
Speech_Python <- setRefClass("Speech_Python", contains = c("ProxyClassObject"), fields = c("act", "lines", "scene", "speaker"))
Speech_Python <- XR::setProxyClass("Speech", module = "thePlay",
    evaluatorClass = "PythonInterface", language = "Python", proxyObjectClass = "PythonObject",
    methods = list(),
    fields = list(
      act = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.act", proxy)
          else {
              .ev$Command("%s.act = %s", proxy, value)
              invisible(value)
          }
      },
      lines = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.lines", proxy)
          else {
              .ev$Command("%s.lines = %s", proxy, value)
              invisible(value)
          }
      },
      scene = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.scene", proxy)
          else {
              .ev$Command("%s.scene = %s", proxy, value)
              invisible(value)
          }
      },
      speaker = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.speaker", proxy)
          else {
              .ev$Command("%s.speaker = %s", proxy, value)
              invisible(value)
          }
      }
      )
    )

Speech_Python$methods(
initialize = function (..., evaluator, .serverObject) 
{
    if (missing(evaluator)) 
        evaluator <- XR::getInterface("PythonInterface")
    if (missing(.serverObject)) {
        evaluator$Import("thePlay")
        .serverObject <- evaluator$New("Speech", "thePlay", ...)
    }
    if (is(.serverObject, "ProxyClassObject")) 
        proxy <- .serverObject$.proxyObject
    else proxy <- .serverObject
    .proxyObject <<- proxy
    .ev <<- evaluator
},

ServerClassInfo = function () 
list(ServerClass = "Speech", ServerModule = "thePlay", language = "Python", 
    evaluatorClass = "PythonInterface", proxyFields = c("act", 
    "lines", "scene", "speaker"), proxyMethods = c("initialize", 
    "ServerClassInfo", "getText", "tokenize"), proxyContains = character(0), 
    proxyObjectClass = "PythonObject"),

getText = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "getText", ..., .get = .get)
}, name = "getText", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")),

tokenize = structure(function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "tokenize", ..., .get = .get)
}, name = "tokenize", module = "", evaluatorClass = structure("PythonInterface", package = "XRPython"), serverDoc = character(0), serverArgs = character(0), class = structure("PythonFunction", package = "XRPython")))


#' Proxy for Python Class ElementTree in Module xml.etree.ElementTree
#' 
#' @export
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
#' @export
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


