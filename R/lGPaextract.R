lGPaextract <-
function(gmap, freqmat, what="mean", reference="G2A", ...) {
	# what = "mean", "varG", "varA", dvarA.dt
	mask <- function(effect='a', nloc) {
		sapply(1:nloc, function(i) {
				tmp.mask <- paste0(rep(".",nloc), collapse="")
				substr(tmp.mask, i, i) <- effect
				tmp.mask })
	}
	
	lGPa <- linearGPmapanalysis(gmap=gmap, freqmat=freqmat, reference=reference, ...)
	ans <- switch(what, 
		mean={
			lGPa$E[1]
		},
		varG={
			sum(lGPa$variances)
		},
		varA={ 
			sum(lGPa$variances[mask('a', lGPa$nloc)])
		},
		dvarA.dt={
			if (!require(numDeriv)) stop("Library numDeriv is necessary to compute gradients")
			dvarA.dp <- 
				grad(function(frq) lGPaextract(gmap, frq, what="varA", reference=reference, ...), freqmat)
			alphas <- lGPa$E[mask('a', lGPa$nloc)]
			dp.dt <- alphas*freqmat*(1-freqmat)
			sum(dvarA.dp * dp.dt)
		},
		stop("Unknown \"what\" value")
	)
	return(ans)
}
