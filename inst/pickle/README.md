# Pickle Versions of Plays

If your version of the shakesepare package was installed with the
PICKLE_PLAYS environment variable *not* set to "NONE", this directory
will contain pickled (i.e., Python serialized) versions of the plays.

These will automatically be unserialized when getPlay() is called for
the corresponding play, avoiding having to parse the text file for
that play.
