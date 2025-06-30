# jan.vanhove@unifr.ch, https://janhove.github.io/posts/2024-09-10-contingency-p-value/
boschloo_test <- function(tab, alternative = "two.sided", pi_range = c(0, 1), stepsize = 0.01) {
  # This test assumes fixed row sums.
  # Nuisance parameter values in the interval pi_range are tried out.
  # stepsize governs granularity of search through nuisance parameter value candidates.
  
  if (!all(dim(tab) == c(2, 2))) stop("tab needs to be a 2*2 contingency table.")
  
  if (alternative == "two.sided") {
    # Truncate two-sided p-value at 1
    return(
      min(2 * min(boschloo_test(tab, alternative = "less", pi_range = pi_range, stepsize = stepsize),
                  boschloo_test(tab, alternative = "greater", pi_range = pi_range, stepsize = stepsize)), 
          1)
    )
  }
  
  # Use Fisher's exact test p-value as test statistic
  statistic <- function(x) fisher.test(x, alternative = alternative)$p.value
  
  # Construct grid with possible results
  row_sums <- rowSums(tab)
  my_grid <- expand.grid(n1 = 0:row_sums[1], n2 = 0:row_sums[2])
  my_grid$statistic <- NA
  for (i in 1:nrow(my_grid)) {
    my_tab <- rbind(c(my_grid$n1[i], row_sums[1] - my_grid$n1[i]),
                    c(my_grid$n2[i], row_sums[2] - my_grid$n2[i]))
    my_grid$statistic[i] <- statistic(my_tab)
  }
  
  # Compute observed test statistic
  obs_p <- statistic(tab)
  is_extreme <- my_grid$statistic <= obs_p
  
  # Maximise p-value over range
  pis <- seq(pi_range[1], pi_range[2], by = stepsize)
  max_p <- 0
  for (current_pi in pis) {
    current_p <- weighted.mean(x = is_extreme,
                               w = dbinom(my_grid$n1, row_sums[1], current_pi) * 
                                 dbinom(my_grid$n2, row_sums[2], current_pi))
    if (current_p > max_p) max_p <- current_p
  }
  max_p
}