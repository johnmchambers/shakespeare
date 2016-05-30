#' In the previous example, we divided the vocabulary of a particular speaker according to whether the words
#' were  also used by another speaker in the play.
#'
#' Let's expand that and look for words that no one else in \emph{any} play has used.  How to think about that?
#'
#' The vocabulary of the speaker can be broken down now into three distinct parts:
#'
#'   my_words == c(shared_with_others_in_my_play, shared_only_with_other_plays, my_words_only)
#'
#' It's the third piece we're after, but the advantage of the split is that the first piece can be computed (as we
#' did) from the data for this play only.  Once that piece is removed from my_words, the second piece requires data
#' from all the plays \emph{ other} than this one; namely, the total vocabulary of all those other plays.
#' That vocabulary is unrelated to any particular speaker, so we can precompute the 37 objects.
#'
#' Let's compute a list containing all the words used in each play
    playWords <- list()
    for(key in allKeys) {
         allTokens <- tokens(Play(key)$speeches)
         playWords[[key]] <- unlist(wordsUsed(allTokens, .get=TRUE))
     }
#' and now a corresponding list of words used in all OTHER plays.
#' This one is worth writing a function for:
makeOtherPlays <- function() {
     onlyPlayWords <- list()
     for(i in seq_along(allKeys)) {
         onlyPlayWords[[i]] <- unique(unlist(playWords[-i]))
     }
     names(onlyPlayWords) <- allKeys
     onlyPlayWords
 }
#' We only need to evaluate this list once.
otherPlays <- makeOtherPlays()

#' Next, let's turn the wordShare() function into a more  object-based version.  The
#' object that defines the result is really
#' the vector of words called onlyMine in the wordShare() function. Let's make that a function:
onlyMine <- function(speaker, play) {
    allWords <- wordsUsed(tokens(Play(play)$speeches), .get = TRUE)
    otherNames <- is.na(match(names(allWords), speaker))
    others <- unique(unlist(allWords[otherNames]))
    myWords <- unlist(allWords[[speaker]])
    noMatch <- is.na(match(myWords, others))
    list(myWords[noMatch], myWords[!noMatch])
}

#' Now we can define a function to return the unique words of a given speaker in a given play.
#' We use the onlyMine() function to eliminate any competitors in the speaker's own play,
#' then require that the words not appear in any of the other otherPlays vocabularies
speakerShared <- function(speaker, play) {
    ww <- onlyMine(speaker, play)
    uniqueInPlay <- ww[[1]]
    noMatch <- is.na(match(uniqueInPlay, otherPlays[[play]]))
    list(ww[[2]], uniqueInPlay[!noMatch], uniqueInPlay[noMatch])
}

allSpeakers <- function(play) {
    names(wordsUsed(tokens(Play(play)), .get=TRUE))
}

