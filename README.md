# General Linear Model
Lecture notes and datasets for the summer school module on the general linear model.

## Lectures

1. Nuts and bolts: General linear model equation; optimisation criteria (least absolute deviations, least squares, maximum likelihood); estimating uncertainty (bootstrapping, i.i.d. normality assumption).
2. Adding a predictor: Interpretation of parameter estimates and regression lines; confidence bands.
3. Group differences: Dummy variables (treatment coding, sum coding); bootstrapping without homoskedasticity.
4. Interactions.
5. Multiple predictors: Confounding variables; control variables; posttreatment variables.
6. The basic of logistic regression: Linear probability model; odds, odds ratios, log-odds.

## Setting up a project in RStudio
In RStudio, go to `File > New Project...`. Select `New Directory`, then `New Project`. Specify the new project's name (e.g., `GeneralLinearModel`) and select the directory it should be a subdirectory of. Don't tick any of the available options, and then click `Create Project`.

In the directory you've just created, you'll find a `.Rproj` file (e.g., `GeneralLinearModel.Rproj`). You can open your project by double-clicking this file. Alternatively, in RStudio, go `File > Open Project...`. In the directory with the `.Rproj` file, create two subdirectory: `data` and `functions`. Copy the datasets from the present repository's `data` directory into your `data` directory. Also copy the `scatterplot_matrix.R` file from the `functions` directory into your own `functions` directory.

If you haven't already, install the `here` and `tidyverse` packages. To that end, type `install.packages(c("here", "tidyverse"))` at the R console.
