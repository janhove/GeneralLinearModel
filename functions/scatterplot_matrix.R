# Define panel with correlation coefficients
panel.cor <- function(x, y, ...)
{
  par(usr = c(0, 1, 0, 1))
  txt <- as.character(sprintf("%.2f", cor(x,y, use = "p"))) # round to two decimal places
  # text(0.5, 0.5, txt, cex = 2.5*sqrt(abs(cor(x,y, use = "p"))))
  text(0.5, 0.5, txt, cex = 1.3)
  text(0.5, 0.3, paste("n =", length(x[!is.na(x) & !is.na(y)])))
  # text(0.5, 0.1, paste("missing:", length(x[is.na(x) | is.na(y)])))
  ## uncomment these lines to also plot a 95% confidence interval
  #CI <- paste(paste(expression("95%")), 
  #            "-BI: ",
  #            "\n",
  #            as.character(sprintf("%.2f", cor.test(x,y)$conf.int[1])),
  #            " - ",
  #            as.character(sprintf("%.2f", cor.test(x,y)$conf.int[2])),
  #            sep = ""
  #)
  #text(0.5, 0.3, CI, cex=1.5)
}

# Scatterplot with lowess scatterplot smoother
panel.smooth <- function(x, y, span=2/3, iter=3, ...) {
  if (is.numeric(x) && is.numeric(y)) {
    points(x, y, pch = 1, col = "grey70", bg = "white", cex = 1.5)
    ok <- is.finite(x) & is.finite(y)
    if (any(ok)) 
      lines(stats::lowess(x[ok], y[ok], f = span, iter = iter), 
            col = "black", lwd = 1, ...)
  } 
}

# Histograms
panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr = usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks
  nB <- length(breaks)
  y <- h$counts
  y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col="grey", ...)
  text(max(range(x[!is.na(x)])), 1.45*max(y), paste("n =", length(x[!is.na(x)])), adj = c(1, 1))
}

scatterplot_matrix <- function(..., cex.labels = 1.5, top = panel.smooth, bottom = panel.cor, middle = panel.hist, las = 1, tcl = -0.2) {
  pairs(..., upper.panel = top, lower.panel = bottom, diag.panel = middle, 
  			las = las, tcl = tcl, 
  			cex.labels = cex.labels)
}
