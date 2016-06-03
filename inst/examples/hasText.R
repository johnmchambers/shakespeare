require(shakespeare)
tp <- Play("tempest")
tp$speeches
last <- tp$speeches$el(639)
ev <- XRPython::RPython()
printSpeech(last)
last$hasText("free")
last$hasText("deliver")
last$hasText("Promise")
sps <- vector("list", tp$speeches$.proxyObject@size)
for(i in seq_along(sps)) sps[[i]] <- tp$speeches$el(i-1)
sizes <- sapply(sps, function(x)x$lines$.proxyObject@size)
which.max(sizes)
sps[[571]]$hasText("free", .get=TRUE)
sps[[571]]$hasText("that", .get=TRUE)
printSpeech(sps[[571]])
sp0 <- tp$speeches$el(570)
act5 <- getActs(tp)$el(4)
sp5 <- getSpeeches(act5)
yy = speechSearch("free", sp5)
for(i in 0:4) printSpeech(yy$el(i))
hp = Play("hamlet")
hpfree <- speechSearch("nunnery", hp$speeches)
for(i in 0:2) printSpeech(hpfree$el(i))