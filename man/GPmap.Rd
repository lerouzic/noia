\name{Genotype-to-Phenotype map}
\alias{GPmap}

\title{ Genotype-to-Phenotype Mapping }

\description{
  The Genotype-to-Phenotype map is a vector providing the estimate of 
  the genotypic value for any multi-locus genotype. The estimates may
  be computed from \code{\link{linearRegression}} or 
  \code{\link{multilinearRegression}}. 
}
\usage{
GPmap(obj)
}

\arguments{
  \item{obj}{ An object of class \code{"noia.linear"} or 
  \code{"noia.multilinear"}. }
}

\value{
	Returns a matrix with two columns: the first one is the estimate of genotypic
	effects, the second one the standard error of this estimate.
}

\references{
Le Rouzic A, Alvarez-Castro JM. (2008). Estimation of genetic effects and
	genotype-phenotype maps. Evolutionary Bioinformatics, 4. 
}

\author{ Arnaud Le Rouzic <a.p.s.lerouzic@bio.uio.no> }

\seealso{ \code{\link{linearRegression}}, \code{\link{multilinearRegression}}, 
	\code{\link{genNames}}. }
	
	
\examples{
set.seed(123456789)

map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)
pop <- simulatePop(map, N=500, sigmaE=0.2, type="F2")

# Regression
linear <- linearRegression(phen=pop$phen, gen=cbind(pop$Loc1, pop$Loc2))

# GP map
GPmap(linear)
}

\keyword{ regression }

