\name{Genetic regression}
\alias{linearRegression}
\alias{multilinearRegression}

\title{ Linear and Multilinear Genetic Regressions }
\description{
  The regression aims at estimating genetic effects from a population in which the genotypes and phenotypes are known. 
}
\usage{
linearRegression(phen, gen=NULL, genZ=NULL, 
    reference="noia", max.level=NULL, max.dom=NULL, fast=FALSE)
multilinearRegression(phen, gen=NULL, genZ=NULL, 
    reference="noia", max.level=NULL, max.dom=NULL, fast=FALSE, 
    e.unique=FALSE, start.algo = "linear", start.values=NULL, 
    robust=FALSE, bilinear.steps=1, ...)
}

\arguments{
  \item{phen}{ The vector of individual phenotypes measured in the population. }
  \item{gen}{ The matrix of individual genotypes in the population, one column per locus. See \code{\link{genNames}} for the genotype encoding. Not necessary if \code{genZ} is provided. }
  \item{genZ}{ The matrix of individual genotypic probabilities in the population, 3 columns per locus, corresponding of the probability of each of the 3 genotypes (the sum must be 1). Not necessary if \code{gen} is provided. }
  \item{reference}{ The reference point from which the regression is performed. By default, the \code{"noia"} reference point is used, since it provides a fairly good orthogonality. Other possibilities are \code{"G2A"}, \code{"F2"}, \code{"F1"}, \code{"Finf"}, \code{"UWR"}, \code{"P1"} and \code{"P2"}. }
  \item{max.level}{ Maximum level of interactions. }
  \item{max.dom}{ Maximum level for dominance effects. Does not have any effect if >= \code{max.level}. In the multilinear regression, the maximum level for dominance effects cannot be > 1. }
  \item{fast}{ This "fast" algorithm should be used when (i) the number of loci is high (> 8) and (ii) there are uncertainties in the dataset (missing values or Haley-Knott regression). This algorithm computes the regression matrix directly function, i.e. without computing \code{Z} nor \code{S} matrices.}  
  \item{e.unique}{ Whether the multilinear term is the same for all pairs. }
  \item{start.algo}{ Algorithm used to compute the starting values. Can be \code{"linear"}, \code{"multilinear"}, \code{"subset"} or \code{"bilinear"}. Ignored if \code{start.values} are provided.}
  \item{start.values}{ Vector of starting values. }
  \item{robust}{ Tries sequentially all starting values algorithms.}
  \item{bilinear.steps}{ Number of steps. Ignored if \code{start.algo} is not \code{"bilinear"}. If \code{NULL}, the bilinear algorithm is run until (almost) convergence.}
  \item{...}{ Extra parameters to the non-linear regression function \code{\link{nls}}, including \code{\link{nls.control}}. }
}
\details{
  If a \code{gen} data set is provided, it will be turned into a \code{genZ}. Missing data (unknown genotypes) are considered as loci for which genotypic probabilities are identical to the genotypic frequencies in the population. 
  
  The algebraic framework is described extensively in Alvarez-Castro & Carlborg 2007. The default reference point (\code{"noia"}) provides an orthogonal decomposition of genetic effects in the 1-locus case, whatever the genotypic frequencies. It remains a good approximation of orthogonality in the multi-locus case if linkage disequilibrium is small. Other optional reference points are those of the \code{"G2A"} model (Zeng et al. 2005), and the unweighted regression model \code{"UWR"} (Cheverud & Routman, 1995). Several key populations can be taken as reference as well: \code{"F2"}, \code{"F1"}, \code{"Finf"} (F infinity), and the two "parental" homozygous populations \code{"P1"} and \code{"P2"}. 
  
  The multilinear model for genetic interactions is an alternative way to model epistatic interactions between at least two loci (see Hansen & Wagner 2001). The computation of multilinear estimates requires a non-linear regression step that relies on the \code{\link{nls}} function. Providing good starting values for the non-linear regression is a key to ensure convergence, and different algorithms are provided, that can be specified by the \code{"start.algo"} option. \code{"linear"} performs a linear regression and approximates the genetic effects from it, while \code{"multilinear"} performs a simpler multilinear regression (without dominance) to initialize the genetic effects. \code{"subset"} estimate all genetic effects from a random subset (50\%) of the population, and \code{"bilinear"} estimate alternatively marginal and epistatic effects. 
}

\value{
\code{linearRegression} and \code{multilinearRegression} return an object of class \code{"noia.linear"} or \code{"noia.multilinear"}, both having their own \code{\link{print}} methods: \code{\link{print.noia.linear}} and \code{\link{print.noia.multilinear}}. 
}

\references{ 
Alvarez-Castro JM, Carlborg O. (2007). A unified model for functional 
    and statistical epistasis and its application in quantitative trait 
    loci analysis. Genetics 176(2):1151-1167.
    
Alvarez-Castro JM, Le Rouzic A, Carlborg O. (2008). How to perform meaningful
    estimates of genetic effects. PLoS Genetics 4(5):e1000062.
    
Cheverud JM, Routman, EJ. (1995). Epistasis and its contribution to 
    genetic variance components. Genetics 139:1455-1461.
    
Hansen TF, Wagner G. (2001) Modeling genetic architecture: A multilinear 
    theory of gene interactions. Theoretical Population Biology 59:61-86.
    
Le Rouzic A, Alvarez-Castro JM. (2008). Estimation of genetic effects and
    genotype-phenotype maps. Evolutionary Bioinformatics 4. 
    
Zeng ZB, Wang T, Zou W. (2005). Modelling quantitative trait loci and 
    interpretation of models. Genetics 169: 1711-1725. 
 }
 
\author{ Arnaud Le Rouzic }

\seealso{ \code{\link{geneticEffects}}, \code{\link{GPmap}}, \code{\link{varianceDecomposition}}. }

\examples{
set.seed(123456789)

map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)
pop <- simulatePop(map, N=500, sigmaE=0.2, type="F2")

# Regressions

linear <- linearRegression(phen=pop$phen, gen=cbind(pop$Loc1, pop$Loc2))

multilinear <- multilinearRegression(phen=pop$phen, 
    gen=cbind(pop$Loc1, pop$Loc2))

# Linear effects, associated variances and stderr
linear

# Multilinear effects
multilinear
}

\keyword{ models }
\keyword{ regression }
\keyword{ nonlinear }

