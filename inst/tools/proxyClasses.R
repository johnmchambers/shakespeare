require(XRPython)

## the classes in this package
con <- file("/tmp/proxyClasses.R", "w")
setPythonClass(save = con, "Act", "thePlay", docText = "Python Class for an Act")
setPythonClass(save = con, "Scene", "thePlay", docText = "Python Class for a Scene")
setPythonClass(save = con, "Speech", "thePlay", docText = "Python Class for a Speech")
close(con)
