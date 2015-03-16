\name{Variance decomposition}
\alias{varianceDecomposition}
\alias{print.noia.vardec}

\title{ Decomposition of Genetic Variance }
\description{
  Variance decomposition in a classical operation in quantitative genetics
  (e.g. Fisher 1918, Lynch and Walsh 1998).
  The genetic variance, i.e. the part of phenotypic variance that can be
  identify as due to genetic factors, can be decomposed into several
  orthogonal components (generally, the part due to additive factors Var(A), 
  to dominance factors Var(D), and to genetic interactions Var(I)).
}
\usage{
varianceDecomposition(obj)
\method{print}{noia.vardec}(x, ...)
}

\arguments{
  \item{obj}{ An object of class \code{"noia.linear"}, the output of 
  \code{\link{linearRegression}} or of class \code{"noia.linear.gpmap"}, the output of 
  \code{\link{linearGPmapanalysis}}. }
  \item{x}{ An object of class \code{"noia.vardec"}, the output of 
  \code{\link{varianceDecomposition}}. }
  \item{\dots}{ No effect for the moment. }
}
\details{
  The details of the variance decomposition are provided for all levels of
  interaction: Var(A) and Var(D) for marginal effects, Var(AA), Var(AD) and Var(DD) 
  for 2nd order interactions, etc.
}
\value{
	\code{varianceDecomposition} returns a list of vectors. Each element of the list corresponds
	to an order of interactions, and the vectors detail the variance 
	decomposition within each level. 
	\code{print.noia.vardec} prints the previous list in a nice way, and computed the percentage of
	genetic variance explained by each variance component. 
}
\references{ 
Alvarez-Castro JM, Carlborg O. (2007). A unified model for functional 
	and statistical epistasis and its application in quantitative trait 
	loci analysis. Genetics 176(2):1151-1167.

Fisher RA. (1918). The correlation between relatives on the supposition of 
	Mendelian inheritance. Thans. Roy. Soc. Edinburgh 52:339-433. 
	
Le Rouzic A, Alvarez-Castro JM. (2008). Estimation of genetic effects and
	genotype-phenotype maps. Evolutionary Bioinformatics, 4. 

Lynch M, Walsh B (1998) Genetics and Analysis of Quantitative Traits. 
Sunderland, MA; Sinauer Associates. 
 }
 
\author{ Arnaud Le Rouzic <a.p.s.lerouzic@bio.uio.no> }

\seealso{ \code{\link{linearRegression}} }
\examples{

map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)
pop <- simulatePop(map, N=500, sigmaE=0.2, type="F2")

# Regression

linear <- linearRegression(phen=pop$phen, gen=cbind(pop$Loc1, pop$Loc2))

# Variance decomposition
varianceDecomposition(linear)
}

\keyword{ models }
\keyword{ regression }

