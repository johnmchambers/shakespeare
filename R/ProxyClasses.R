#' Python Class for an Act
#' 
#' @export
Act_Python <- setRefClass("Act_Python", contains = c("ProxyClassObject"), fields = c("data", "playTitle", "title"))
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
      playTitle = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.playTitle", proxy)
          else {
              .ev$Command("%s.playTitle = %s", proxy, value)
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
initialize = function (..., .evaluator, .serverObject) 
{
    if (missing(.evaluator)) {
        if (missing(.serverObject)) 
            .evaluator <- XR::getInterface("PythonInterface", 
                .makeNew = FALSE)
        else .evaluator <- XR::proxyEvaluator(.serverObject)
    }
    if (!nargs() && is.null(.evaluator)) 
        return()
    if (missing(.serverObject)) {
        if (is.null(.evaluator)) 
            .evaluator <- XR::getInterface("PythonInterface")
        .evaluator$Import("thePlay")
        .serverObject <- .evaluator$New("Act", "thePlay", ...)
    }
    else if (!missing(...)) 
        initFields(...)
    if (is(.serverObject, "ProxyClassObject")) 
        proxy <- .serverObject$.proxyObject
    else proxy <- .serverObject
    .proxyObject <<- proxy
    .ev <<- .evaluator
},

ServerClassInfo = function () 
list(ServerClass = "Act", ServerModule = "thePlay", language = "Python", 
    evaluatorClass = "PythonInterface", proxyFields = c("data", 
    "playTitle", "title"), proxyMethods = c("initialize", "ServerClassInfo"
    ), proxyContains = character(0), proxyObjectClass = "PythonObject"))


#' Python Class for a Scene
#' 
#' @export
Scene_Python <- setRefClass("Scene_Python", contains = c("ProxyClassObject"), fields = c("actTitle", "data", "playTitle", "title"))
Scene_Python <- XR::setProxyClass("Scene", module = "thePlay",
    evaluatorClass = "PythonInterface", language = "Python", proxyObjectClass = "PythonObject",
    methods = list(),
    fields = list(
      actTitle = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.actTitle", proxy)
          else {
              .ev$Command("%s.actTitle = %s", proxy, value)
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
      playTitle = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.playTitle", proxy)
          else {
              .ev$Command("%s.playTitle = %s", proxy, value)
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
initialize = function (..., .evaluator, .serverObject) 
{
    if (missing(.evaluator)) {
        if (missing(.serverObject)) 
            .evaluator <- XR::getInterface("PythonInterface", 
                .makeNew = FALSE)
        else .evaluator <- XR::proxyEvaluator(.serverObject)
    }
    if (!nargs() && is.null(.evaluator)) 
        return()
    if (missing(.serverObject)) {
        if (is.null(.evaluator)) 
            .evaluator <- XR::getInterface("PythonInterface")
        .evaluator$Import("thePlay")
        .serverObject <- .evaluator$New("Scene", "thePlay", ...)
    }
    else if (!missing(...)) 
        initFields(...)
    if (is(.serverObject, "ProxyClassObject")) 
        proxy <- .serverObject$.proxyObject
    else proxy <- .serverObject
    .proxyObject <<- proxy
    .ev <<- .evaluator
},

ServerClassInfo = function () 
list(ServerClass = "Scene", ServerModule = "thePlay", language = "Python", 
    evaluatorClass = "PythonInterface", proxyFields = c("actTitle", 
    "data", "playTitle", "title"), proxyMethods = c("initialize", 
    "ServerClassInfo"), proxyContains = character(0), proxyObjectClass = "PythonObject"))


#' Python Class for a Speech
#' 
#' @export
Speech_Python <- setRefClass("Speech_Python", contains = c("ProxyClassObject"), fields = c("act", "lines", "playTitle", "scene", "speaker", "tokens"))
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
      playTitle = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.playTitle", proxy)
          else {
              .ev$Command("%s.playTitle = %s", proxy, value)
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
      },
      tokens = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.tokens", proxy)
          else {
              .ev$Command("%s.tokens = %s", proxy, value)
              invisible(value)
          }
      }
      )
    )

Speech_Python$methods(
initialize = function (..., .evaluator, .serverObject) 
{
    if (missing(.evaluator)) {
        if (missing(.serverObject)) 
            .evaluator <- XR::getInterface("PythonInterface", 
                .makeNew = FALSE)
        else .evaluator <- XR::proxyEvaluator(.serverObject)
    }
    if (!nargs() && is.null(.evaluator)) 
        return()
    if (missing(.serverObject)) {
        if (is.null(.evaluator)) 
            .evaluator <- XR::getInterface("PythonInterface")
        .evaluator$Import("thePlay")
        .serverObject <- .evaluator$New("Speech", "thePlay", 
            ...)
    }
    else if (!missing(...)) 
        initFields(...)
    if (is(.serverObject, "ProxyClassObject")) 
        proxy <- .serverObject$.proxyObject
    else proxy <- .serverObject
    .proxyObject <<- proxy
    .ev <<- .evaluator
},

ServerClassInfo = function () 
list(ServerClass = "Speech", ServerModule = "thePlay", language = "Python", 
    evaluatorClass = "PythonInterface", proxyFields = c("act", 
    "lines", "playTitle", "scene", "speaker", "tokens"), proxyMethods = c("initialize", 
    "ServerClassInfo", "findText", "getText", "tokenize"), proxyContains = character(0), 
    proxyObjectClass = "PythonObject"),

findText = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: findText(text, tokens =, ignoreCase =)\nSearches in the Speech object for occurences of the specified\ntext and returns a list of the lines in which that text appears.\nArgument `tokens' controls whether the search is in the tokens\nfield, in which case `text' must match a token exactly.  Otherwise\nthe search is in the speech text for a matching substring.\nIf `ignoreCase' is true, the text argument is converted\nto lower case.  Tokens are always lower-cased and the speech\ntext will be converted to lower as needed."
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function findText() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 3) 
        stop("Python function findText() only allows 3 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "findText", ..., .get = .get)
},

getText = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: getText()\nReturns the text of the speech, as an object that will be\nan R character vector when converted."
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 0) 
        stop("Python function getText() only allows 0 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "getText", ..., .get = .get)
},

tokenize = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: tokenize()\nReturns the set of tokens in the speech as a single\nstring, with \"$\" separating lines."
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 0) 
        stop("Python function tokenize() only allows 0 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "tokenize", ..., .get = .get)
})


#' Python Class for a Selected Excerpt of a Speech
#' 
#' @export
Excerpt_Python <- setRefClass("Excerpt_Python", contains = c("ProxyClassObject"), fields = c("act", "lines", "playTitle", "scene", "select", "speaker", "tokens"))
Excerpt_Python <- XR::setProxyClass("Excerpt", module = "thePlay",
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
      playTitle = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.playTitle", proxy)
          else {
              .ev$Command("%s.playTitle = %s", proxy, value)
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
      select = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.select", proxy)
          else {
              .ev$Command("%s.select = %s", proxy, value)
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
      },
      tokens = function (value) 
      {
          proxy <- get(".proxyObject", envir = .self)
          if (missing(value)) 
              .ev$Eval("%s.tokens", proxy)
          else {
              .ev$Command("%s.tokens = %s", proxy, value)
              invisible(value)
          }
      }
      )
    )

Excerpt_Python$methods(
initialize = function (..., .evaluator, .serverObject) 
{
    if (missing(.evaluator)) {
        if (missing(.serverObject)) 
            .evaluator <- XR::getInterface("PythonInterface", 
                .makeNew = FALSE)
        else .evaluator <- XR::proxyEvaluator(.serverObject)
    }
    if (!nargs() && is.null(.evaluator)) 
        return()
    if (missing(.serverObject)) {
        if (is.null(.evaluator)) 
            .evaluator <- XR::getInterface("PythonInterface")
        .evaluator$Import("thePlay")
        .serverObject <- .evaluator$New("Excerpt", "thePlay", 
            ...)
    }
    else if (!missing(...)) 
        initFields(...)
    if (is(.serverObject, "ProxyClassObject")) 
        proxy <- .serverObject$.proxyObject
    else proxy <- .serverObject
    .proxyObject <<- proxy
    .ev <<- .evaluator
},

ServerClassInfo = function () 
list(ServerClass = "Excerpt", ServerModule = "thePlay", language = "Python", 
    evaluatorClass = "PythonInterface", proxyFields = c("act", 
    "lines", "playTitle", "scene", "select", "speaker", "tokens"
    ), proxyMethods = c("initialize", "ServerClassInfo", "findText", 
    "getText", "highlight", "tokenize"), proxyContains = character(0), 
    proxyObjectClass = "PythonObject"),

findText = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: findText(text, tokens =, ignoreCase =)\nSearches in the Speech object for occurences of the specified\ntext and returns a list of the lines in which that text appears.\nArgument `tokens' controls whether the search is in the tokens\nfield, in which case `text' must match a token exactly.  Otherwise\nthe search is in the speech text for a matching substring.\nIf `ignoreCase' is true, the text argument is converted\nto lower case.  Tokens are always lower-cased and the speech\ntext will be converted to lower as needed."
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function findText() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 3) 
        stop("Python function findText() only allows 3 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "findText", ..., .get = .get)
},

getText = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: getText()\nReturns the text of the speech, as an object that will be\nan R character vector when converted."
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 0) 
        stop("Python function getText() only allows 0 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "getText", ..., .get = .get)
},

highlight = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: highlight(wrap =, mark =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 2) 
        stop("Python function highlight() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "highlight", ..., .get = .get)
},

tokenize = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: tokenize()\nReturns the set of tokens in the speech as a single\nstring, with \"$\" separating lines."
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 0) 
        stop("Python function tokenize() only allows 0 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "tokenize", ..., .get = .get)
})


#' Proxy for Python Class ElementTree in Module xml.etree.ElementTree
#' 
#' @export
ElementTree_Python <- setRefClass("ElementTree_Python", contains = c("ProxyClassObject"))
ElementTree_Python <- XR::setProxyClass("ElementTree", module = "xml.etree.ElementTree",
    evaluatorClass = "PythonInterface", language = "Python", proxyObjectClass = "PythonObject",
    methods = list()
    )

ElementTree_Python$methods(
initialize = function (..., .evaluator, .serverObject) 
{
    if (missing(.evaluator)) {
        if (missing(.serverObject)) 
            .evaluator <- XR::getInterface("PythonInterface", 
                .makeNew = FALSE)
        else .evaluator <- XR::proxyEvaluator(.serverObject)
    }
    if (!nargs() && is.null(.evaluator)) 
        return()
    if (missing(.serverObject)) {
        if (is.null(.evaluator)) 
            .evaluator <- XR::getInterface("PythonInterface")
        .evaluator$Import("xml.etree.ElementTree")
        .serverObject <- .evaluator$New("ElementTree", "xml.etree.ElementTree", 
            ...)
    }
    else if (!missing(...)) 
        initFields(...)
    if (is(.serverObject, "ProxyClassObject")) 
        proxy <- .serverObject$.proxyObject
    else proxy <- .serverObject
    .proxyObject <<- proxy
    .ev <<- .evaluator
},

ServerClassInfo = function () 
list(ServerClass = "ElementTree", ServerModule = "xml.etree.ElementTree", 
    language = "Python", evaluatorClass = "PythonInterface", 
    proxyFields = NULL, proxyMethods = c("initialize", "ServerClassInfo", 
    "find", "findall", "findtext", "getiterator", "getroot", 
    "iter", "iterfind", "parse", "write", "write_c14n"), proxyContains = character(0), 
    proxyObjectClass = "PythonObject"),

find = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: find(path, namespaces =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function find() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function find() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "find", ..., .get = .get)
},

findall = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: findall(path, namespaces =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function findall() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function findall() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "findall", ..., .get = .get)
},

findtext = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: findtext(path, default =, namespaces =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function findtext() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 3) 
        stop("Python function findtext() only allows 3 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "findtext", ..., .get = .get)
},

getiterator = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: getiterator(tag =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 1) 
        stop("Python function getiterator() only allows 1 argument; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "getiterator", ..., .get = .get)
},

getroot = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: getroot()\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 0) 
        stop("Python function getroot() only allows 0 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "getroot", ..., .get = .get)
},

iter = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: iter(tag =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 1) 
        stop("Python function iter() only allows 1 argument; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "iter", ..., .get = .get)
},

iterfind = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: iterfind(path, namespaces =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function iterfind() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function iterfind() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "iterfind", ..., .get = .get)
},

parse = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: parse(source, parser =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function parse() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function parse() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "parse", ..., .get = .get)
},

write = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: write(file_or_filename, encoding =, xml_declaration =, default_namespace =, method =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function write() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 5) 
        stop("Python function write() only allows 5 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "write", ..., .get = .get)
},

write_c14n = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: write_c14n(file)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function write_c14n() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function write_c14n() only allows 1 argument; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "write_c14n", ..., .get = .get)
})


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
initialize = function (..., .evaluator, .serverObject) 
{
    if (missing(.evaluator)) {
        if (missing(.serverObject)) 
            .evaluator <- XR::getInterface("PythonInterface", 
                .makeNew = FALSE)
        else .evaluator <- XR::proxyEvaluator(.serverObject)
    }
    if (!nargs() && is.null(.evaluator)) 
        return()
    if (missing(.serverObject)) {
        if (is.null(.evaluator)) 
            .evaluator <- XR::getInterface("PythonInterface")
        .evaluator$Import("xml.etree.ElementTree")
        .serverObject <- .evaluator$New("Element", "xml.etree.ElementTree", 
            ...)
    }
    else if (!missing(...)) 
        initFields(...)
    if (is(.serverObject, "ProxyClassObject")) 
        proxy <- .serverObject$.proxyObject
    else proxy <- .serverObject
    .proxyObject <<- proxy
    .ev <<- .evaluator
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

append = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: append(element)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function append() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function append() only allows 1 argument; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "append", ..., .get = .get)
},

clear = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: clear()\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 0) 
        stop("Python function clear() only allows 0 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "clear", ..., .get = .get)
},

copy = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: copy()\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 0) 
        stop("Python function copy() only allows 0 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "copy", ..., .get = .get)
},

extend = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: extend(elements)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function extend() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function extend() only allows 1 argument; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "extend", ..., .get = .get)
},

find = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: find(path, namespaces =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function find() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function find() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "find", ..., .get = .get)
},

findall = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: findall(path, namespaces =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function findall() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function findall() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "findall", ..., .get = .get)
},

findtext = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: findtext(path, default =, namespaces =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function findtext() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 3) 
        stop("Python function findtext() only allows 3 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "findtext", ..., .get = .get)
},

get = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: get(key, default =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function get() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function get() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "get", ..., .get = .get)
},

getchildren = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: getchildren()\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 0) 
        stop("Python function getchildren() only allows 0 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "getchildren", ..., .get = .get)
},

getiterator = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: getiterator(tag =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 1) 
        stop("Python function getiterator() only allows 1 argument; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "getiterator", ..., .get = .get)
},

insert = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: insert(index, element)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 2) 
        stop("Python function insert() requires at least 2 arguments; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function insert() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "insert", ..., .get = .get)
},

items = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: items()\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 0) 
        stop("Python function items() only allows 0 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "items", ..., .get = .get)
},

iter = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: iter(tag =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 1) 
        stop("Python function iter() only allows 1 argument; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "iter", ..., .get = .get)
},

iterfind = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: iterfind(path, namespaces =)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function iterfind() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function iterfind() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "iterfind", ..., .get = .get)
},

itertext = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: itertext()\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 0) 
        stop("Python function itertext() only allows 0 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "itertext", ..., .get = .get)
},

keys = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: keys()\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs > 0) 
        stop("Python function keys() only allows 0 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "keys", ..., .get = .get)
},

makeelement = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: makeelement(tag, attrib)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 2) 
        stop("Python function makeelement() requires at least 2 arguments; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function makeelement() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "makeelement", ..., .get = .get)
},

remove = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: remove(element)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 1) 
        stop("Python function remove() requires at least 1 argument; got ", 
            nPyArgs)
    if (nPyArgs > 1) 
        stop("Python function remove() only allows 1 argument; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "remove", ..., .get = .get)
},

set = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    "Python Method: set(key, value)\n"
    nPyArgs <- length(substitute(c(...))) - 1
    if (nPyArgs < 2) 
        stop("Python function set() requires at least 2 arguments; got ", 
            nPyArgs)
    if (nPyArgs > 2) 
        stop("Python function set() only allows 2 arguments; got ", 
            nPyArgs)
    .ev$MethodCall(.proxyObject, "set", ..., .get = .get)
})


