GPmap <-
function (obj) 
{
    if (inherits(obj, "noia.linear")) {
        if (is.null(obj$smat)) {
            stop("No GP map estimate with 'fast' algorith")
        }
        g <- cbind(obj$smat %*% obj$E, sqrt((obj$smat * obj$smat) %*% 
            (obj$std.err * obj$std.err)))
        colnames(g) <- c("G.val", "std.err")
        class(g) <- c("noia.gpmap", class(g))
        return(g)
    }
    else if (inherits(obj, "noia.multilinear")) {
        rec <- reconstructLinearEffects(obj)
        g <- cbind(obj$smat %*% rec[, 1], sqrt((obj$smat * obj$smat) %*% 
            (rec[, 2] * rec[, 2])))
        class(g) <- c("noia.gpmap", class(g))
        return(g)
    }
    else {
        stop("Class", class(obj), "unknown.\n")
    }
}
