#' Estimated Dates for Specified Plays
#'
#' The vector \code{text} specifies one or more plays; used internally these will be the keys identifying the
#' various plays.  Otherwise they should match the title of the desired play, as for \code{\link{findPlay}()}.
#'
#' The dates are taken from those given on opensourceshakespeare.org.  The actual dates of first performance of the plays
#' is not always known, and some are debated.
#' Our philosophy is just to regard these as useful calibration when looking for style changes or other
#' indicators of the changing environment in which the plays appeared.
#' @param text character vector. Either the key(s) for the plays or some text that uniquely matches the corresponding title.  Call
#' \code{\link{playTitles}()} to see the table of keys and titles.
#' @return the years as a character vector.
playDates <- function(text) {
    keys <- .playDates[,3] # in the order of the dates
    which <- match(text, keys)
    if(any(is.na(which))) {
        ii <- seq(along = text)
        for(i in ii)  # find the key; will fail if no match
            which[[i]] <- match(findPlay(text[[i]], ask = FALSE, get =FALSE), keys) 
    }
    .playDates[which,1]
}

## the rest of the file constructs a matrix of asserted dates for the plays,
## following the dates given on opensourceshakespeare.org.
## The Titles column is their titles, not the titles in the plays.
## The third column gives the corresponding keys; i.e., the codes for the xml files
## and subsequent objects created in this package.

.playDates <- matrix(c("1589", "Comedy of Errors",
"1590", "Henry VI, Part II",
"1590", "Henry VI, Part III",
"1591", "Henry VI, Part I",
"1592", "Richard III",
"1593", "Taming of the Shrew",
"1593", "Titus Andronicus",
"1594", "Romeo and Juliet",
"1594", "Two Gentlemen of Verona",
"1594", "Love's Labour's Lost",
"1595", "Richard II",
"1595", "Midsummer Night's Dream",
"1596", "King John",
"1596", "Merchant of Venice",
"1597", "Henry IV, Part I",
"1597", "Henry IV, Part II",
"1598", "Henry V",
"1598", "Much Ado about Nothing",
"1599", "Twelfth Night",
"1599", "As You Like It",
"1599", "Julius Caesar",
"1600", "Hamlet",
"1600", "Merry Wives of Windsor",
"1601", "Troilus and Cressida",
"1602", "All's Well That Ends Well",
"1604", "Othello",
"1600", "Measure for Measure",
"1605", "King Lear",
"1605", "Macbeth",
"1606", "Antony and Cleopatra",
"1607", "Coriolanus",
"1607", "Timon of Athens",
"1608", "Pericles",
"1609", "Cymbeline",
"1610", "Winter's Tale",
"1611", "Tempest",
"1612", "Henry VIII"), ncol = 2, by = TRUE)
pk <- rep("", 37)
pt <- playTitles()
keys <- as.character(pt[,2])
for(i in 1:37) {
    ii <- grep(.playDates[i,2], pt[,1], fixed = TRUE)
    if(length(ii) == 1)
        pk[[i]] <- keys[[ii]]
}
## after that,  ..
## pk <- c("comedy", "", "", "", "", "taming", "titus", "r_and_j", "two_gentlemen",
## "", "", "dream", "john", "merchant", "", "", "", "much_ado",
## "twelfth_night", "as_you", "julius_caesar", "hamlet", "merry_wives",
## "troilus", "alls_well", "othello", "m_for_m", "lear", "macbeth",
## "a_and_c", "coriolanus", "timon", "pericles", "cymbeline", "winters_tale",
##         "tempest", "")

pk[2:4] <- paste0("henry_vi_",c(2L,3L,1L))
pk[[5]] <- "richard_iii"
pk[[10]] <- "loves_labor"
pk[[11]] <- "richard_ii"
pk[[15]] <- "henry_iv_1"
pk[[16]] <- "henry_iv_2"
pk[[17]] <- "henry_v"
pk[[37]] <- "henry_viii"
.playDates <- cbind(.playDates, pk)
rm(pk,pt,keys)
colnames(.playDates) <- c("Year", "Title", "Key")
