## this setup script writes the file proxyFunctions.R in the R/ subdirectory of the package
## It should be run as XR::packageSetup("proxyFunctions.R")

con <- file("R/proxyFunctions.R","w")

XRPython::PythonFunction("getPlay", "thePlay", save = con, objName = "getPlay_Python",
                         docText = "Python Function to Parse XML File for Play")

XRPython::PythonFunction("getActs", "thePlay", save = con,
                         docText = "Python List of all Acts of a Play")

XRPython::PythonFunction("getScenes", "thePlay", save = con,
                         docText = "Python List of all Scenes of a Play")

XRPython::PythonFunction("getSpeeches", "thePlay", save = con,
                         docText = "Python List of all Speeches of a Play")

XRPython::PythonFunction("getPersonae", "thePlay", save = con, .get = TRUE,
                         docText = "Python List of the Persons Listed for the Play")

XRPython::PythonFunction("parse", "xml.etree.ElementTree", save = con, objName = "parseXML",
                         docText = "Python Function to Parse XML File")

close(con)
