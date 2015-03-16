\name{Simulate population}

\alias{simulatePop}

\title{ Simulates a Population from a Genotype-Phenotype Map }
\description{
  The \code{simulatePop} function takes a Genotype-to-Phenotype map (i.e. a vector
  defining the genotypic value of all possible genotypes) and 
  returns a data frame containing the simulated population. 
}
\usage{
simulatePop(gmap, N = 100, sigmaE = 1, type = "F2", freqmat=NULL)
}

\arguments{
  \item{gmap}{ The Genotype-to-phenotype map: a vector of size \eqn{3^L}, where L is
  the number of loci. The vector should be named with the code of each genotype
  (see \code{\link{genNames}}.}
  \item{N}{ Number of individuals. }
  \item{sigmaE}{ Standard deviation of the environmental noise (normally
  distributed). }
  \item{type}{ Type of population. \code{"F2"}, \code{"Finf"}, \code{"F1"}, \code{"UWR"}, \code{"G2A"}, and \code{"noia"} are possible. }
  \item{freqmat}{ For \code{type="G2A"}: A vector of length \code{nloc} containing allele frequencies such that 
                  \code{freqmat[i]=frequency(allele 1)} for locus \code{i}.
                  
                  For \code{type="noia"}: A \code{(nloc x 3)} matrix of genotype frequencies such that 
                  \code{freqmat[i,]=[frequency(1) frequency(2) frequency(3)]} for locus \code{i}. }

}

\value{
    Returns a data frame, in which the first column (\code{$phen}) contains the 
    phenotypes, and the following ones (\code{$Loc1}, \code{$loc2}, etc) the 
    genotypes of all individuals.
}

\details{
    The type of population refers to the expected allelic and genotypic frequences:
    \itemize{
    \item{"F1"}{First generation of an intercross between two parental populations fixed for alleles A and B respectively; expected genotypic frequencies are: AA: 0, AB: 1, BB: 0.}
    \item{"F2"}{Second generation of an intercross between two parental populations fixed for alleles A and B respectively; expected genotypic frequencies are AA: 0.25, AB: 0.5, BB: 0.25.}
    \item{"Finf"}{Theoretical population from an infinite number of generations after an intercross between two parental populations fixed for alleles A and B respectively; expected genotypic frequencies are AA: 0.5, AB: 0, BB: 0.5.}
    \item{"UWR"}{Theoretical population corresponding to ideal (but experimentally unrealistic) equal genotypic frequencies; expected genotypic frequencies are AA: 0.333, AB: 0.333, BB: 0.333. In such a population, the "UnWeighted Regression model" (UWR) by Cheverud \& Routman 1995 provides orthogonal estimates.}
    \item{"G2A"}{Population at Hardy-Weinberg frequencies; expected genotypic frequencies are: AA: p*p, AB: 2p(1-p), BB: (1-p)(1-p), the frequency of allele A (p) at locus i being provided by the i-th element of vector \code{freqmat}. "G2A" is the name of the statistical model by Zeng et al. (2005) in which genetic effects estimated from such a population are orthogonal.}
    \item{"noia"}{Population in which genotypic frequencies are arbitrary; expected genotypic frequencies are: AA: pAA, AB: pAB, BB: pBB, frequences pAA, pAB, and pBB at locus i being provided by the i-th line of matrix \code{freqmat}. "noia" is the name of the statistical model by Alvarez-Castro and Carlborg (2007) in which genetic effects estimated from such a population are orthogonal. In all populations, loci are considered as independent and are at linkage equilibrium.}         
    }
}


\references{    
Alvarez-Castro JM, Carlborg O. (2007). A unified model for functional 
    and statistical epistasis and its application in quantitative trait 
    loci analysis. Genetics 176(2):1151-1167.
    
Cheverud JM, Routman, EJ. (1995). Epistasis and its contribution to 
    genetic variance components. Genetics 139:1455-1461.
    
Le Rouzic A, Alvarez-Castro JM. (2008). Estimation of genetic effects and
    genotype-phenotype maps. Evolutionary Bioinformatics, 4. 
    
Zeng ZB, Wang T, Zou W. (2005). Modelling quantitative trait loci and 
    interpretation of models. Genetics 169: 1711-1725. 
}

\author{ Arnaud Le Rouzic <a.p.s.lerouzic@bio.uio.no>, Arne B. Gjuvsland <arne.gjuvsland@umb.no> } 

\seealso{ \code{\link{GPmap}},   \code{\link{genNames}} }

\examples{
set.seed(123456789)

map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)
pop <- simulatePop(map, N=500, sigmaE=0.2, type="F2")
str(pop)

## Create a "noia" population with genotype frequencies 1/3,1/3,1/3 for locus 1 
## and 0.2,0.6,0.2 for locus 2
pop = simulatePop(map, N=1000, sigma=1, type='noia', 
  freqmat=matrix(c(1/3,1/3,1/3,0.2,0.6,0.2),nrow=2, byrow=TRUE))
}

\keyword{ datagen }

