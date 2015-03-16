\name{plot.noia}

\alias{plot.noia.linear}
\alias{barplot.noia.gpmap}

\title{ Graphical display of genetic regressions and genotype-phenotype 
    maps }
    
\description{ These functions allow a graphic representation of the 
    result of genetic regressions from \code{\link{linearRegression}}
    and \code{\link{GPmap}}.
  } 

\usage{
\method{plot}{noia.linear}(x, loc = 1:x$nloc, effect=TRUE, epistasis = TRUE, 
ylim=range(GPmap(x)[,1]) + c(-1,1)*max(GPmap(x)[,2]), ...)
\method{barplot}{noia.gpmap}(height, GPcol = c("indianred", "palegreen", "royalblue"), 
arrowscol = "purple", stderr = TRUE , main=NA, ylab=NA, ...)
}

\arguments{
  \item{x}{ An object of class \code{"noia.linear"} for the 
    \code{\link{plot}} function, or of class \code{"noia.gpmap"} for the
    \code{\link{barplot}} function. }
  \item{loc}{ The vector loci to plot (by default, all of them are 
    displayed).}
  \item{effect}{ Whether genetic effects have to be plotted for each
    locus.}
  \item{epistasis}{ Whether pairwise effects have to be plotted. }
  \item{height}{ An object of class \code{"noia.gpmap"}. }
  \item{GPcol}{ Colors for each of the three genotypes. }
  \item{arrowscol}{Color of the error bars.}
  \item{stderr}{ If \code{TRUE}, error bars stand for starndard errors.
    Otherwise, error bars are 95\% condidence intervals.}
  \item{main}{ The same as in \code{\link{plot}}.}   
  \item{ylab}{ The same as in \code{\link{plot}}.} 
  \item{ylim}{ The same as in \code{\link{plot}}.}  
  \item{\dots}{ Additional options for the \code{\link{plot}} and 
    \code{\link{barplot}} routines. }
}

\author{ Olivier Ariste, Arnaud Le Rouzic <lerouzic@legs.cnrs-gif.fr> }

\keyword{ plot }
