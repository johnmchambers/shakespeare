# Pickle Versions of Speech Tokens

This directory contains serialized (Python "pickle"d) versions of the
list of tokenized speeches for the plays, indexed by the keys used for the XML files.

When the speeches for a play are generated, as lists of tokens, for a play,
the list of Speech objects is
serialized to this directory, provided it doesn't already exist there
and provided that the user has permission to store the file.

The serialized file will automatically be unserialized when getSpeeches() is called
again in a *subsequent* R session for
the corresponding play, avoiding having to scan the XML tree repeatedly.

(Regardless of permissions, parsed plays are stored for the *current*
session in .playsTable)

