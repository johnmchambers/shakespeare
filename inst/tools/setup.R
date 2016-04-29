require(XRPython)
loadNamespace("shakespeare")
## the classes
con <- file("/tmp/proxyClasses.R", "w")
setPythonClass(save = con, "Act", "thePlay", docText = "Python Class for an Act")
setPythonClass(save = con, "Scene", "thePlay", docText = "Python Class for a Scene")
setPythonClass(save = con, "Speech", "thePlay", docText = "Python Class for a Speech")
close(con)

## the functions
con <- file("/tmp/proxyFunctions.R", "w")
PythonFunction("getPlay", "thePlay", docText = "Get the Python Tree for a Play", save = con)
PythonFunction("getActs","thePlay", docText = "List (in Python) of the Acts of a Play", save = con)
close(con)

roxygen2::roxygenize()
