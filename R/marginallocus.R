marginallocus <- 
function (gmap, freq=NULL, what="mean", definition=11, mc.cores=1, ...)
{
	# So far: only Hardy-Weinberg proportions (and thus, GTA model)
	# ...: arguments to linearGPmapanalysis
	if (class(gmap) == "noia.gpmap") gmap <- gmap$G.val
	nloc <- round(log(length(gmap))/log(3))
	if (is.null(freq)) freq <- rep(NA, nloc)
	if (length(freq) != nloc) stop("Invalid frequency vector (different length than the number of loci)")
	
	if (mc.cores > 1) {
		if (!require(parallel))
			mc.cores <- 1
	}
	if (mc.cores == 1)
		mclapply <- function(..., mc.cores) lapply(...)
	
	num.loctest <- sum(is.na(freq))
	freq.test <- seq(from=0, to=1, length.out=definition)
	freq.list <- as.data.frame(matrix(rep(freq.test, num.loctest), ncol=num.loctest))
	freq.list <- expand.grid(freq.list)
	freq.list <- lapply(1:nrow(freq.list), function(i) {tmp.freq <- freq; tmp.freq[is.na(freq)] <- unlist(freq.list[i,]); tmp.freq})
			
	ans <- mclapply(freq.list, function(frq) {
		return(lGPaextract(gmap=gmap, freq=frq, what=what, ...))
	}, mc.cores=mc.cores)
	return(array(unlist(ans), dim=rep(definition, num.loctest), dimnames=lapply(1:num.loctest, function(i) paste0("p",i,"|",format(freq.test, digits=2)))))
}
