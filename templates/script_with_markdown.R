#' ---
#' author: 'Your name'
#' title: 'Some title'
#' date: 'yyyy/mm/dd'
#' output: 
#'  html_document:
#'    toc: true
#'    toc_float: true
#'    number_sections: true
#'    theme: sandstone
#'    highlight: tango
#'    dev: svg
#'    df_print: paged
#' ---

#' # Writing reports with R Markdown
#' If you open this file in RStudio, you can compile it into a report
#' by clicking `File > Compile Report...`.
#' Any text preceded by `#' ` (i.e., a hash, a straight single quotation mark and a single space), 
#' such as this paragraph, will be shown as normal text in the report. 
#' I changed some of the default settings to make
#' the report easier to read, but feel free to customise this template
#' in whatever way you see fit.
#' 
#' You can use Markdown mark-up (see what they did there?) to _emphasise_
#' certain **words**. You can also include links, such as this one to the
#' [Markdown help page](https://bookdown.org/yihui/rmarkdown/html-document.html).
#' 
#' You can also insert headings to make the structure of your report clearer.
#' For instance, like so:
#' 
#' # Section
#' ## Subsection
#' ## Subsection
#' 
#' # Section
#' ## Subsection
#' ### Subsubsection

#' The R commands that occur in the script (and which are not preceded by `#' `)
#' are executed at compile time and their results are shown in the script.
#' This offers some quality control: If a command cannot be executed because
#' of a syntax error, the script won't compile.
#' Moreover, at compile time, the commands only take into account the information
#' that is present in the script, not on any information that is still lingering
#' in your working environment but isn't present in the script.
#' 
#' I recommend including any packages that you've used (or will use) in the script
#' at the top of the script, for instance like so:
#' 
#' # Preliminaries
#' ## Packages
library(tidyverse)

#' Don't include the `install.packages()` commands, though.
#' And while we're at it, don't include `View()` commands either - their output
#' won't be shown, anyway.
#' 
#' ## Graphical parameters
#' This is entirely optional.
par(las = 1,
    bty = "l",
    mar = c(3, 3.5, 2, 1),
    mgp = c(2, 0.3, 0),
    tck = -.01,
    cex = 0.8)

#' # Graphs
#' You can draw graphs as usual, including `ggplot2` graphs.
#' You can also specify their size manually (here: in inches). 
#' Note that the line that specifies the graph size is prefixed with `#+ `.
#+ fig.width = 5, fig.height = 4
curve(2^(-x^2/2) * x/(1 + x^2)
      , from = -5, to = 5
      , xlab = "x", ylab = "f(x)"
  )

#+ fig.width = 8, fig.height = 6
swiss |> 
  mutate(District = rownames(swiss)) |> 
  ggplot(aes(x = Agriculture,
             y = Fertility,
             label = District)) +
  geom_text()

#' # Printing tibbles
#' I've set the `df_print` setting to `paged`. This way, you can browse
#' through the dataframes and tibbles that you want to display. For instance,
swiss

#' # Software versions
devtools::session_info(pkgs = "attached")
# alternatively, use sessionInfo()