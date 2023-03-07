\name{Marginal locus calculation}
\alias{marginallocus}
\alias{plot.noia.marloc}
\alias{image.noia.marloc}

\title{ Estimation of parameters for specific allele frequencies }

\description{ 
This function computes some parameters of interest 
(mean phenotype, genetic variance, additive variance, and evolutionary change in additive variance)
for a combination of allele frequencies, based on a genotype-phenotype map.
}

\usage{
marginallocus(gmap, freq=NULL, what="mean", definition=11, mc.cores=1, ...)
\method{plot}{noia.marloc}(x, xlab=NULL, ylim=NULL, ylab=attr(x, "what"), ...)
\method{image}{noia.marloc}(x, xlab=NULL, ylab=NULL, zlim=NULL, 
      main=attr(x, "what"), col.max="red", col.min="blue", col.zero="white", 
      n.cols=1000, zeropart=0.01, contour.levels=10, contour.options=list(), ...) 
}

\arguments{
  \item{gmap}{ Either an object of class \code{noia.gpmap}, or a vector of phenotypic values in the order defined as in \code{\link{genotypesNames}} }.
  \item{freq}{ A vector indicating the loci that should be analysed. See Details. }
  \item{what}{ A character string among "mean", "varA", "varG", or "dvarA.dt". }
  \item{definition}{ The number of allele frequencies to try for each locus. }
  \item{mc.cores}{ If more than 1, the calculation is run on \code{mc.cores} cores via the library \code{\link{parallel}}. }
  \item{x}{ An object of class \code{noia.marloc} obtained after running \code{marginallocus}. }
  \item{col.max, col.min, col.zero}{ Colors standing for the maximal, minimal, and nil values, respectively. Setting \code{col.zero} to \code{NULL} generates a color gradient between \code{col.min} and \code{col.max}. }
  \item{n.cols}{ Number of colors in the gradient. }
  \item{zeropart}{ Width (relative to the full amplitude) of the region around zero which will be colored as \code{col.zero}. }
  \item{contour.levels}{ Number of contour lines. Setting this to 0 leads to no contour lines. }
  \item{contour.options}{ List of additional options to the \code{\link{contour}} function. }
  \item{xlab, ylab, ylim, zlim, main}{ Classical parameters passed to \code{\link{plot}} and \code{\link{image}}. }
  \item{\dots}{ Additional parameters to internal functions. }
}

\details{
	\code{marginallocus} computes a population parameter for a series of allele frequencies. The loci under investigation are provided through the \code{freq} vector, which need to have as many elements as loci in the system. Values of the \code{freq} vector indicate fixed allele frequencies, while \code{NA} indicate loci under investigation. For instance, \code{freq=c(NA, 1, NA, 0.5)}, will investigate the effect of varying loci 1 and 3, while keeping loci 2 and 4 at constant allele frequencies. The population is assumed to be at Hardy-Weinberg frequencies. If \code{freq} is not provided, all loci will be investigated.
}

\value{
	\code{marginallocus} returns an array with as many dimensions as loci under investigation. This array is an object of class \code{"noia.marloc"} which can be graphically illustrated through the provided \code{plot} (for 1-dimensional data) and \code{image} (for 2-dimensional data). Arrays of higher dimensionality cannot be represented graphically.
}

\author{ Arnaud Le Rouzic }

\seealso{ \code{\link{linearGPmapanalysis}} }
\examples{

map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)

mrg2D <- marginallocus(map)
mrg1D <- marginallocus(map, freq=c(NA, 0)) # the second locus is fixed for allele 1

image(mrg2D)
plot(mrg1D)
}

