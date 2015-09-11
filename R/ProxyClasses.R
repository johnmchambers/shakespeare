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
    "ServerClassInfo", "getText"), proxyContains = character(0), 
    proxyObjectClass = "PythonObject"),

getText = function (..., .ev = XRPython::RPython(), .get = NA) 
{
    .ev$MethodCall(.proxyObject, "getText", ..., .get = .get)
})


