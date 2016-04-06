.myLoadAction <- function(ns) {
    assign("parseXML",
           PythonFunction("parse", "xml.etree.ElementTree"),
           envir = ns)
}

.setupPlaysTable <- function(ns) {
    ptable <- new.env(parent = emptyenv(), size = 80L)
    tbl <- read.csv(system.file("plays", "titleTable.csv",
                        package = packageName(ns), mustWork = TRUE),
                    header = FALSE, stringsAsFactors = FALSE)
    assign("keys", gsub("[.]xml$", "", tbl[,1]), envir = ptable)
    assign("titles", tbl[,2], envir = ptable)
    assign(".playsTable", ptable, envir = ns)
}

## XRPython will create load actions for the path, imports
pythonAddToPath() # by default, the "python" directory
pythonImport("thePlay")


setLoadActions(.myLoadAction, .setupPlaysTable)

