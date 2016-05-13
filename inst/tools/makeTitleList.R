## this script successfully creates the data/ object BUT:  not needed any more so this is just a demo of how data
## objects would be created in a setup script
stop("This scrlipt has been decomissioned in favor of the table constructed by R/getPlays.R")


## Setup script to create a data object "titleList" with a list of the titles and corresponding
## file names.
## NOTE:  this should be run after the setup to create proxy functions and classes
where <- system.file("plays", package = packageName())
    files <- list.files(where, pattern = "[.]xml$")
    titles <- character(length(files))
    for(i in seq_along(files)) {
        file <- file.path(where, files[[i]])
        play <- parseXML(file)
        titles[[i]] <- play$findtext("TITLE")
    }
titleList <- list(titles = titles, files = files)
devtools::use_data(titleList)

