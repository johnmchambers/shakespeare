## this setup script writes the file proxyFunctions.R in the R/ subdirectory of the package
## It should be run as XR::packageSetup("proxyFunctions.R")

tmp <- tempfile(fileext=".R")
con <- file(tmp, "w")

message(gettextf("Creating proxy functions on temp file %s",dQuote(tmp)))

XRPython::PythonFunction("getPlay", "thePlay", save = con, objName = "getPlay_Python",
                         docText = "Python Function to Parse XML File for Play")

XRPython::PythonFunction("getActs", "thePlay", save = con,
                         docText = "Python List of all Acts of a Play")

XRPython::PythonFunction("getScenes", "thePlay", save = con,
                         docText = "Python List of all Scenes of a Play")

XRPython::PythonFunction("getSpeeches", "thePlay", save = con,
                         docText = "Python List of all Speeches of a Play (or Act or Scene)")

XRPython::PythonFunction("speakers", "thePlay", save = con, .get = TRUE,
                         docText = "Python List of the Persons Listed for the Play")

XRPython::PythonFunction("tokens", "thePlay", save = con, objName = "tokens_Python",
                         docText = "Speeches Tokenized in a Python Dictionary by Speaker")

XRPython::PythonFunction("speechTokens", "thePlay", save = con, objName = "speechTokens_Python",
                         docText = "A Python Dictionary of all Speeches by Speaker")

XRPython::PythonFunction("getPersonae", "thePlay", save = con, .get = TRUE,
                         docText = "Python Dictionary of the Speakers in a List of Speeches")

XRPython::PythonFunction("parse", "xml.etree.ElementTree", save = con, objName = "parseXML",
                         docText = "Python Function to Parse XML File")

XRPython::PythonFunction("wordsUsed", "thePlay", save = con, objName = "wordsUsed_Python",
                         docText = "Python List of the Distinct Words in a List of Tokens")

close(con)

message("Copying temp file to shakespeare/R/proxyFunctions.R")

system(gettextf("cp %s ./R/proxyFunctions.R", tmp))
