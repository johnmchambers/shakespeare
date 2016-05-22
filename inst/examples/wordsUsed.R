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


