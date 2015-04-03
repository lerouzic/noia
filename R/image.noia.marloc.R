image.noia.marloc <- 
function(x, xlab=NULL, ylab=NULL, zlim=NULL, main=attr(x, "what"), col.max="red", col.min="blue", col.zero="white", n.cols=1000, zeropart=0.01, contour.levels=10, contour.options=list(), ...) 
{
	frq <- function(lab) as.numeric(strsplit(lab, split="|", fixed=TRUE)[[1]][2])
	allele <- function(lab) strsplit(lab, split="|", fixed=TRUE)[[1]][1]
	if (length(dim(x)) > 2) {
		stop("Impossible to represent arrays of dimensions > 2.")
	}
	if (length(dim(x)) < 2) {
		stop("Use image for 2 loci only. Try plot instead.")
	}
	if(is.null(xlab)) xlab <- allele(rownames(x)[1])
	if(is.null(ylab)) ylab <- allele(colnames(x)[1])
	if(is.null(zlim)) {
		zlim <- range(x)
		if (attr(x, "what") %in% c("varA","varG")) zlim[1] <- 0 
	}
	
	cols <- colorRampPalette(c(col.min,col.zero,col.max))(n.cols)
	absl <- max(abs(range(x)))
	brks <- if (attr(x, "what") %in% c("varA","varG", "dvarA.dt")) {
				c(seq(-absl, -zeropart*absl, length=n.cols/4), 
				seq(-zeropart*absl, 0, length=n.cols/4),
				0,
				seq(0, zeropart*absl, length=n.cols/4),
				seq(zeropart*absl, absl, length=n.cols/4))
			} else {
				c(seq(zlim[1], zlim[2], length=n.cols+1))
			}
	
	image(x=sapply(rownames(x), frq), y=sapply(colnames(x), frq), z=x, xlab=xlab, ylab=ylab, zlim=zlim, col=cols, breaks=brks, ...)
	
	if(contour.levels > 0) { 
		do.call(contour, c(list(x=sapply(rownames(x), frq), y=sapply(colnames(x), frq), z=x, nlevels=contour.levels, add=TRUE), as.list(contour.options)))
	}
	
}
