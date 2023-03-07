effectsPvalues <-
function (reg) 
{
    if (!inherits(reg, "lm") && !inherits(reg, "nls")) {
        stop("Object of class \"lm\" expected\n")
    }
    summary.effects <- summary(reg)
    aliased <- summary.effects$aliased
    pvalues <- rep("NA", length(aliased))
    pvalues[!aliased] <- summary.effects$coefficients[, "Pr(>|t|)"]
    pvalues[pvalues == "NA"] <- NA
    return(as.numeric(pvalues))
}
