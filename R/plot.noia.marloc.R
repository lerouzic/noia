plot.noia.marloc <- 
function(x, xlab=NULL, ylim=NULL, ylab=attr(x, "what"), ...) 
{
	frq <- function(lab) as.numeric(strsplit(lab, split="|", fixed=TRUE)[[1]][2])
	allele <- function(lab) strsplit(lab, split="|", fixed=TRUE)[[1]][1]
	if (length(dim(x)) > 1) {
		stop("Impossible to plot an array. For two dimensions, try image.")
	}
	
	if(is.null(xlab)) xlab <- allele(names(x)[1])
	if(is.null(ylim)) {
		ylim <- range(x)
		if (attr(x, "what") %in% c("varA","varG")) 
			ylim[1] <- 0
	}
	plot(x=sapply(rownames(x), frq), y=x, xlab=xlab, ylim=ylim, ylab=ylab, type="l", ...)
}
