\name{print.noia}

\alias{print.noia.common}
\alias{print.noia.linear}
\alias{print.noia.multilinear}
\alias{print.noia.linear.gpmap}

\title{ Printing Genetic Regressions and GP map analyses }
\description{
  Display the output of functions \code{\link{linearRegression}},
  \code{\link{multilinearRegression}} and \code{\link{linearGPmapanalysis}} 
}
\usage{
\method{print}{noia.linear}(x, ...)
\method{print}{noia.multilinear}(x, ...)
\method{print}{noia.common}(x, ...)
\method{print}{noia.linear.gpmap}(x, ...)
}

\arguments{
  \item{x}{ An object of class \code{"noia.linear"}, class \code{"noia.linear.gpmap"} or class \code{"noia.multilinear"}. }
  \item{\dots}{ No effect for the moment. }
}
\details{
  The \code{print} method being actually very similar for the linear and 
  multilinear regressions, both call the common method \code{print.noia.common}. 
}

\references{ 
	
Le Rouzic A, Alvarez-Castro JM. (2008). Estimation of genetic effects and
	genotype-phenotype maps. Evolutionary Bioinformatics, 4. 
}
\author{ Arnaud Le Rouzic, Arne B. Gjuvsland }

\keyword{ print }
