getPlays <- function(plays = character(), ask = interactive(),
                     currentOnly = FALSE, silent = FALSE, .ev = XRPython::RPython()) {
    value <- vector("list", length(plays))
    which <- character(length(plays))
    keys <- get("keys", envir = .playsTable)
    titles <- get("titles", envir = .playsTable)
    .ev$Import("xml.etree.ElementTree", "parse")
    if(!length(which)) {
        which <- keys
        if(currentOnly)
            which <- which[ which %in% objects(.playsTable, all = TRUE)]
    }
    else {
        xact <- plays %in% keys
        which[xact] <- plays[xact]
    }
    notFound <- character()
    for(i in seq_along(which)[!nzchar(which)]) {
        inTitle <- grep(plays[[i]], titles, fixed = TRUE)
        if(!length(inTitle))
            ## grr, grep won't take both fixed and ignore.case
            ## so we have to hope no special chars
            inTitle <- grep(plays[[i]], titles, ignore.case = TRUE)
        if(!length(inTitle)) {
            notFound <- c(notFound, plays[[i]])
            next
        }
        else if(length(inTitle) > 1) {
            if(ask) {
                pick <- menu(titles[inTitle], TRUE, "Matching titles:")
                if(pick > 0) {
                    which[[i]] <- keys[[inTitle[[pick]]]]
                    next
                }
            }
            if(!silent) {
                message(paste0("Several titles matched ", plays[[i]], ":"))
                for(what in titles[inTitle])
                    message(paste0("    ", what))
            }
            notFound <- c(notFound, plays[[i]])
        }
        else
            which[[i]] <- keys[[inTitle]]
    }
    ## For  those plays identified, return the saved object or parse
    for(i in seq_along(which)[nzchar(which)]) {
        key <- which[[i]]
        if(exists(key, envir = .playsTable))
            value[[i]] <- get(key, envir = .playsTable)
        else if(!currentOnly) {
            file <- system.file("plays", paste0(key, ".xml"),
                                package = .packageName, mustWork = TRUE)
            value[[i]] <- .ev$Call("parse", file)
            assign(key, value[[i]], envir = .playsTable)
        }
        ## else, leave value[[i]] as NULL
    }
    names(value) <- which
    if(!silent && length(notFound))
            message(paste("Unable to match:", paste(dQuote(notFound), collapse = ", ")))
    value
}
