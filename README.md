# noia: Implementation of the Natural and Orthogonal InterAction (NOIA) model

## Description:

The NOIA model, as described extensively in Alvarez-Castro &
Carlborg (2007), is a framework facilitating the estimation of
geneticEffects and genotype-to-phenotype maps. This package
provides the basic tools to perform linear and multilinear
regressions from real populations, analyse pure
genotype-to-phenotype (GP) maps in ideal populations, estimating
the genetic effects from different reference points, the genotypic
values, and the decomposition of genetic variances in a
multi-locus, 2 alleles system. This package is extensively
described in Le Rouzic & Alvarez-Castro (2008).

## Details:
  
*Regression data set*: The user must provide (i) The vector of
phenotypes of all individuals measured in the population, and (ii)
The matrix of the genotypes. There are two input formats for the
genotype, see ‘linearRegression’.

*Regression functions*: ‘linearRegression’ and
‘multilinearRegression’.

*GP map data set*: The user must provide (i) The 3^L (where L is
the number of loci) vector of genotypic values (*G* in
Alvarez-Castro & Carlborg (2007)) (ii) Allele or genotype
frequencies in the reference population.

*GP map analysis function*: ‘linearGPmapanalysis’.

*Change of reference*: ‘geneticEffects’.

*Genotype-to-phenotype map*: ‘GPmap’.

*Decomposition of genetic variance*: ‘varianceDecomposition’.

## Author(s):

Arnaud Le Rouzic, Arne B. Gjuvsland

Maintainer: Arnaud Le Rouzic <arnaud.le-rouzic@universite-paris-saclay.fr>

## References:

Alvarez-Castro JM, Carlborg O. (2007). A unified model for
functional and statistical epistasis and its application in
quantitative trait loci analysis. Genetics 176(2):1151-1167.

Alvarez-Castro JM, Le Rouzic A, Carlborg O. (2008). How to perform
meaningful estimates of genetic effects. PLoS Genetics
4(5):e1000062.

Le Rouzic A, Alvarez-Castro JM. (2008). Estimation of genetic
effects and genotype-phenotype maps. Evolutionary Bioinformatics 4.

Examples:

     set.seed(123456789)
     
     map <- c(0.25, -0.75, -0.75, -0.75, 2.25, 2.25, -0.75, 2.25, 2.25)
     names(map) <- genNames(2)
     pop <- simulatePop(map, N=500, sigmaE=0.2, type="F2")
     
     # Regressions
     
     linear <- linearRegression(phen=pop$phen, gen=pop[2:3])
     
     multilinear <- multilinearRegression(phen=pop$phen, gen=cbind(pop$Loc1, 
             pop$Loc2))
     
     # Linear effects, associated variances and stderr
     linear
     
     # Multilinear effects
     multilinear
     
     # Genotype-to-phenotype map analysis
     linearGP <- linearGPmapanalysis(map, reference="F2")
     
     # Linear effects in ideal F2 population
     linearGP
     
     # Change of reference: geneticEffects in the "11" genotype (parental 1)
     geneticEffects(linear, ref.genotype="P1")
     
     # Variance decomposition
     varianceDecomposition(linear)
     varianceDecomposition(linearGP)
     
     # GP maps
     maps <- cbind(map, GPmap(linear)[,1], GPmap(multilinear)[,1])
     colnames(maps) <- c("Actual", "Linear", "Multilinear")
     maps


