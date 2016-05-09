## setup script to write Python class definitions for xml.etree.ElementTree
## to R/xmlClasses.R

con <- file("R/xmlClasses.R", "w")
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


