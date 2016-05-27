## Example:  What words does only Hamlet use?

h <- Play("hamlet")

## first, tokenize the speeches using NLTK's tokenizer model,
## modified for shakespeare
allTokens <- tokens(h$speeches)

## now find the distinct words used for each speaker

allWords <- wordsUsed(allTokens, .get = TRUE)

## collect all the words except Hamlet's
otherNames <- is.na(match(names(allWords), "HAMLET"))
others <- unique(unlist(allWords[otherNames]))

hamletsWords <- unlist(allWords[["HAMLET"]])

## and, his words alone:
hamletOnly <- hamletsWords[is.na(match(hamletsWords, others))]

length(hamletOnly)/length(hamletsWords)

## hm, how about trying this for the other main characters:

talkers <- sort(sapply(allWords, length), decreasing = TRUE)[1:10]
talkers

# now make the computation into a function

wordShare <- function(speeches, people = bigTalkers(allWords)) {
  allTokens <- tokens(speeches)
  allWords <- wordsUsed(allTokens, .get = TRUE)
  value <- matrix(ncol = 2, nrow =0)
  for(who in people) {
    otherNames <- is.na(match(names(allWords), who))
    others <- unique(unlist(allWords[otherNames]))
    myWords <- unlist(allWords[[who]])
    onlyMine <- myWords[is.na(match(myWords, others))]
    value <- rbind(value, c(length(myWords), length(onlyMine)))
  }
  value <- cbind(value, value[,2]/value[,1])
  dimnames(value) <- list(people, c("myWords", "onlyMine", "ratio"))
  value
}

bigTalkers <- function(words, howMany = 10) {
  names(sort(sapply(words, length), decreasing = TRUE)[1:howMany])
}

wordShare(h$speeches)

