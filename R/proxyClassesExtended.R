## class definitions that depend on the proxies to Python classes
## and need to come after proxyClasses.R in collation order

Personae <- setClass("Personae", contains = "character",
                     slots = c( description = "character"))

Play <- setRefClass("Play",
                    fields = c(xml = "ElementTree_Python",
                        personae = "Personae",
                        speeches = "list_Python",
                        title = "character"
                               ))

Play$lock("xml", "personae", "speeches", "title")

Play$methods(
    initialize = function(name, ...) {
        callSuper(...)
        if(is(xml, "uninitializedField"))
            xml <<- getPlay(name)
        if(is(personae, "uninitializedField"))
            personae <<- as.character(getPersonae(xml))
        if(is(title, "uninitializedField"))
            title <<- xml$findtext("TITLE")
        if(is(speeches, "uninitializedField"))
            speeches <<- getSpeeches(xml)
    }
    )


