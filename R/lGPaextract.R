lGPaextract <-
function(gmap, freq, what="mean", reference="G2A", ...) {
	# what = "mean", "varG", "varA", dvarA.dt
	mask <- function(effect='a', nloc) {
		sapply(1:nloc, function(i) {
				tmp.mask <- paste0(rep(".",nloc), collapse="")
				substr(tmp.mask, i, i) <- effect
				tmp.mask })
	}
	
	lGPa <- linearGPmapanalysis(gmap=gmap, freqmat=freq, reference=reference, ...)
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
			if (!requireNamespace("numDeriv", quietly=TRUE)) 
				stop("Library numDeriv is necessary to compute gradients")
			dvarA.dp <- 
				numDeriv::grad(function(frq) lGPaextract(gmap, frq, what="varA", reference=reference, ...), freq)
			alphas <- lGPa$E[mask('a', lGPa$nloc)]
			# in NOIA, p is the frequency of allele 2,
			# and p decreases when alpha increases (I think)
			dp.dt <- -alphas*freq*(1-freq)
			sum(dvarA.dp * dp.dt)
		},
		stop("Unknown \"what\" value")
	)
	return(ans)
}
