# Implementation of PAVA (pooled adjacent violators algorithm)
# for isotonic regression.
# jan.vanhove@students.unibe.ch based on pseudocode by Lutz Dümbgen

pava <- function(x, y, plot = TRUE) {
  y <- y[order(x)]
  y_all <- y
  x <- sort(x)
  y <- tapply(y, x, mean)
  w <- tapply(x, x, length)
  m <- length(y)
  k <- 0
  b <- 0
  s <- integer(m)
  g <- numeric(m)
  v <- numeric(m)
  
  while (k < m) {
    k <- k + 1
    vnew <- w[k]
    Gnew <- w[k] * y[k]
    
    while (k < m && y[k + 1] <= y[k]) {
      k <- k + 1
      vnew <- vnew + w[k]
      Gnew <- Gnew + w[k] * y[k]
    }
    
    b <- b + 1
    s[b] <- k
    g[b] <- Gnew / vnew
    v[b] <- vnew
    
    while (b > 1 && g[b] <= g[b - 1]) {
      s[b - 1] <- k
      vtemp <- v[b - 1] + v[b]
      g[b - 1] <- (v[b - 1] * g[b - 1] + v[b] * g[b]) / vtemp
      v[b - 1] <- vtemp
      b <- b - 1
    }
  }
  
  f <- numeric(m)
  start <- 1
  for (a in 1:b) {
    end <- s[a]
    f[start:end] <- g[a]
    start <- end + 1
  }
  
  if (plot) {
    plot(x, y_all, xlab = "x", ylab = "y")
    lines(unique(x), f, col = "blue")
  }
  
  f
}
