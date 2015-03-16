\name{GP map analysis}
\alias{linearGPmapanalysis}

\title{ Noia analysis of genotype-to-phenotype (GP) maps in ideal populations }
\description{ Functions for doing a NOIA analysis of a GP map for \eqn{L} loci in a population where the loci are in complete linkage equilibrium. }
\usage{
linearGPmapanalysis(gmap, reference="F2", freqmat=NULL, 
                    max.level=NULL , S_full=NULL)
}

\arguments{
  \item{gmap}{ Vector of length \eqn{3^L} with genotypic values for all possible genotypes in the order defined by \code{\link{genNames}}. }
  \item{reference}{ The reference population in which the analysis is done. By default, the \code{"F2"} population is used. Other possibilities are \code{"noia"}, \code{"G2A"}, \code{"UWR"}. }
  \item{freqmat}{ For \code{reference="G2A"}: A vector of length \eqn{L} containing allele frequencies such that 
                  \code{freqmat[i]=frequency(allele 1)} for locus \code{i}.
                  
                  For \code{reference="noia"}: A \eqn{(L\times3)}{(Lx3)} matrix of genotype frequencies such that 
                  \code{freqmat[i,]=[frequency(1) frequency(2) frequency(3)]} for locus \code{i}. }
  \item{max.level}{ Maximum level of interactions. }
  \item{S_full}{ Boolean argument indicating whether to keep full \code{S} matrix \eqn{(3^L\times3^L)}{(3^Lx3^L)} in memory or alternatively to keep 
    \eqn{L} single locus \code{S} matrices \eqn{(3\times3)}{(3x3)} and compute single row and columns of the full matrix. }
}

\details{
    The algebraic framework is described extensively in Alvarez-Castro & Carlborg 2007. When analysing GP maps in ideal populations
    we can work directly with the \code{S} matrix and do not have to consider the \code{X} and \code{Z} matrices used in \code{\link{linearRegression}}.
    When it comes to the \code{S_full} argument keeping the multilocus \code{S} matrix in memory is generally fastest for computing all \eqn{3^L} 
    genetic effects. However it does not allow for computing only a subset of the effects and also runs out of memory for \eqn{L>8} on a typical desktop machine.
    For S_full=NULL in \code{linearGPmapanalysis} a full \code{S} matrix is used if \eqn{L<=8} and max.level=NULL, while \eqn{L} single locus \code{S} matrices are used otherwise.  
}

\value{
\code{linearGPmapanalysis} returns an object of class \code{"noia.linear.gpmap"} , with its own \code{\link{print}} method: \code{\link{print.noia.linear.gpmap}}. 
}

\references{ 
Alvarez-Castro JM, Carlborg O. (2007). A unified model for functional 
    and statistical epistasis and its application in quantitative trait 
    loci analysis. Genetics 176(2):1151-1167.
    
Cheverud JM, Routman, EJ. (1995). Epistasis and its contribution to 
    genetic variance components. Genetics 139:1455-1461.
    
    
Le Rouzic A, Alvarez-Castro JM. (2008). Estimation of genetic effects and
    genotype-phenotype maps. Evolutionary Bioinformatics 4. 
    
Zeng ZB, Wang T, Zou W. (2005). Modelling quantitative trait loci and 
    interpretation of models. Genetics 169: 1711-1725. 
 }
 
\author{ Arne B. Gjuvsland <arne.gjuvsland@umb.no> }

\seealso{ \code{\link{varianceDecomposition}} }

\examples{
map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)

# Genotype-to-phenotype map analysis
linearGP <- linearGPmapanalysis(map, reference="F2")

# Linear effects in ideal F2 population
linearGP

}

\keyword{ models }
\keyword{ regression }
\keyword{ nonlinear }

