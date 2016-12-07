# shakespeare Some Data Analysis of the Plays (& an example of interfacing)

This package provides some tools for asking text-based questions about
Shakespeare's plays, mainly directed at the lists of speeches.

The analysis is based on interfaces from R to XML (for the text of the
plays) and to Python (mainly for text search and use of the Natrual
Language Toolkit).

The package started as an example of the use of interfaces from R to
other languages, in the book *Extending R* (John M. Chambers, 2016,
Chapman & Hall).

The XML coding of the plays is used in Python to fill objects that
represent structural pieces, such as acts, scenes and especially
speeches. The objects from these classes retain information about
their origin in the plays.  The R code in the package has proxies for
these classes and for Python functions.

Use from R is mainly via searches over lists of speeches from some or
(by default) all of the plays.  Searches may be applied to the lines of text of the
speech or tokenized versions of these produced by the NLTK.
