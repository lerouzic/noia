\name{Genotype names}
\alias{genNames}
\alias{genotypesNames}

\title{ Names of Genotypes }

\description{
  \code{genNames} provides the names of all possible genotypes in the 
  order required by the NOIA model (Alvarez-Castro and Carlborg 2007). The codes for the genotypes are
  stored in the vector \code{genotypesNames}. 
}
\usage{
genNames(nloc = 2)
}

\arguments{
  \item{nloc}{ Number of loci}
}
\details{
  The names of the genotypes are stored in the vector 
  \code{genotypesNames}. By default, they are \code{"1"}, \code{"2"}, and 
  \code{"3"}, the heterozygotes being \code{"2"}. The genotypes at different loci
  are then put together, such as \code{"123"} for 3 loci. 
}
\references{ 
Alvarez-Castro JM, Carlborg O. (2007). A unified model for functional 
    and statistical epistasis and its application in quantitative trait 
    loci analysis. Genetics 176(2):1151-1167.
    
Le Rouzic A, Alvarez-Castro JM. (2008). Estimation of genetic effects and
    genotype-phenotype maps. Evolutionary Bioinformatics, 4. 
}

\author{ Arnaud Le Rouzic <a.p.s.lerouzic@bio.uio.no> }

\examples{
    genNames(3)
}

\keyword{ internal }
\keyword{ character }
