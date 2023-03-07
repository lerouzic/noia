effectsVariances <-
function (obj) 
{
    if (!inherits(obj,"noia.linear") && !inherits(obj, "noia.linear.gpmap")) {
        stop("Unexpected object of class \"", class(obj), "\"\n")
    }
    v <- NULL
    if (inherits(obj, "noia.linear") && is.null(obj$zmat)) || 
        is.null(obj$smat)) {
        v <- rep(NA, length(obj$E))
    }
    else {
        if (inherits(obj, "noia.linear")) {
            freq <- Z2freq(obj$zmat)
        }
        else {
            freq <- as.vector(obj$genofreq)
        }
        v <- apply(obj$smat * obj$smat * freq, 2, "sum") * obj$E * 
            obj$E
        v[1] <- 0
    }
    names(v) <- names(obj$E)
    return(v)
}
