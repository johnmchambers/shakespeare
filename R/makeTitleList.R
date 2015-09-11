makeTitleList <- function(directory = "plays", package = packageName(),
                          pattern = "[.]xml$") {
    where <- system.file(directory, package = package)
    files <- list.files(where, pattern = pattern)
    titles <- character(length(files))
    importP("xml.etree.ElementTree", "parse")
    for(i in seq_along(files)) {
        file <- file.path(where, files[[i]])
        play <- callP("parse", file)
        titles[[i]] <- getP(methodP(play, "findtext", "TITLE", ""))
    }
    list(titles = titles, files = files)
}
