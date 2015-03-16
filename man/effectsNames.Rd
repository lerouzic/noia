\name{Effects names}

\alias{effectsNamesGeneral}
\alias{effectsNamesMultilinear}

\title{Names of Genetic Effects}

\description{
  Provides and manipulates labels of genetic effects.
}
\usage{
effectsNamesGeneral(nloc = 2, max.level=NULL, max.dom=NULL) 
effectsNamesMultilinear(nloc=2, max.level=2, max.dom=2)

}

\arguments{
  \item{nloc}{ Number of loci. }
  \item{max.level}{ Maximum order of interactions. }
  \item{max.dom}{ Maximum order for dominance. }
}
\details{
    The codes for genetic effects are stored into a vector of length 4, 
    \code{effectsNames}. The first element of the vector is the code for 
    the absence of effect (default: \code{"."}). The three other elements are
    respectively additive effects (default: \code{"a"}) dominance effects 
    (default: \code{"d"}), and multilinear epistatic effects (default: 
    \code{"e"}). 
    
    The names of genetic effects contains as many characters as the number of
    loci in the system. The additive effect of the first locus in a 3-locus
    system will be \code{"a.."}, and the "Dominance by Dominance" between loci 2 
    and 4 in a 5-locus system will be \code{".d.d."}. Directionality of epistasis
    between two (or more) loci is indicated by as many \code{"e"} as necessary 
    (e.g. \code{".ee."} for the interaction between loci 2 and 3 in a 4-locus
    case). 

    \code{effectsNamesGeneral} and \code{effectsNamesMultilinear} provide 
    a list of the names of the genetic effects, in the correct order to be
    processed in the NOIA framework (Alvarez-Castro and Carlborg 2007). 
}

\seealso{ \code{\link{geneticEffects}},   \code{\link{genNames}},   
    \code{\link{linearRegression}},   \code{\link{multilinearRegression}}. }
    
\references{
Alvarez-Castro JM, Carlborg O. (2007). A unified model for functional 
    and statistical epistasis and its application in quantitative trait 
    loci analysis. Genetics 176(2):1151-1167.
    
Le Rouzic A, Alvarez-Castro JM. (2008). Estimation of genetic effects and
    genotype-phenotype maps. Evolutionary Bioinformatics, 4. 
}

\examples{
effectsNamesGeneral(3)
  }


\keyword{ internal }
\keyword{ character }

