
#' Structure and Tools for Text Analysis of Shakespeare's Plays
#'
#' This package contains classes and functions to support text analysis of
#' Shakespeare's plays.  The package is based on the XML encoding of the plays
#' created by Jon Bosak and available, for example, from
#' \url{http://www.ibiblio.org/xml/examples/shakespeare/}.
#'
#' The package also is an example of an interface from R to Python using the XR
#' interface structure described in the book \emph{Extending R}.
#'
#' The structure and tools occupy a middle ground between the highly recursive
#' format of XML and the unstructured text typically used in Python natural language
#' tools.  Functions and classes in the package \dQuote{flatten} the XML structure
#' to make analysis in R easier, while retaining structural information about acts,
#' scenes and speakers.
#'
#' @template reference
#' @docType package
#' @name shakespeare
#' @import methods
#' @import XRPython
NULL
