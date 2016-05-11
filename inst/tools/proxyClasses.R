require(XRPython)

## the classes in this package
con <- file("R/proxyClasses.R", "w")
setPythonClass(save = con, "Act", "thePlay", docText = "Python Class for an Act")
setPythonClass(save = con, "Scene", "thePlay", docText = "Python Class for a Scene")
setPythonClass(save = con, "Speech", "thePlay", docText = "Python Class for a Speech")

ev <- XRPython::RPython()

h <- shakespeare::getPlay("hamlet")

XRPython::setPythonClass("ElementTree", "xml.etree.ElementTree", example = h,
                         save = con,
                         docText = "Proxy for Python Class ElementTree in Module xml.etree.ElementTree")

hr <- ev$MethodCall(h, "getroot")

XRPython::setPythonClass("Element", "xml.etree.ElementTree", example = hr,
                         save = con,
                         docText = "Proxy for Python Class Element in Module xml.etree.ElementTree")

close(con)
