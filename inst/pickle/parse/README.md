# Pickle Versions of Plays

This directory contains serialized (Python "pickle"d) versions of the
parsed plays, indexed by the keys used for the XML files.

When a play is parsed via a call to getPlay(), the parsed object is
serialized to this directory, provided it doesn't already exist there
and provided that the user has permission to store the file.

The serialized file will automatically be unserialized when getPlay() is called
again in a *subsequent* R session for
the corresponding play, avoiding having to parse the text file
repeatedly.

(Regardless of permissions, parsed plays are stored for the *current*
session in .playsTable)

