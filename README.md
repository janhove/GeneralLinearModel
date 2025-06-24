# Introduction to the General Linear Model
Lecture notes and datasets for the [summer school](https://www.mils.ugent.be/) 
module on the general linear model.

## Lectures

1. Nuts and bolts: General linear model equation; optimisation criteria (least absolute deviations, least squares, maximum likelihood); estimating uncertainty (bootstrap, i.i.d. normality assumption).
2. Adding a predictor: Interpretation of parameter estimates and regression lines; confidence bands.
3. Group differences: Dummy variables (treatment coding, sum coding); bootstrapping without homoskedasticity.
4. Interactions.
5. Multiple predictors: Confounding variables; control variables; posttreatment variables.
6. The basics of logistic regression: Linear probability model; odds, odds ratios, log-odds.

## Prerequisites
### Installing R and RStudio
To install R, visit the [R Project website](https://www.r-project.org).

In addition, I recommend you install RStudio, 
which facilitates working with R. 
To do so, visit the [Posit website](https://posit.co) 
and download the open source desktop version of RStudio.

Once you've installed R and RStudio, open RStudio, 
and go to `Tools > Global options...`.
In the tab `General, Basic`, 
make sure to _untick_ the option 'Restore .RData into workspace at startup' 
and select the option 'never' for 'Save workspace to .RData on exit'.
These settings help ensure that you're starting from a clean slate each time you open RStudio 
and prevent the results of calculations in previous sessions from messing up your analyses.
Additionally, in the tab `Code, Editing`, 
tick the box next to 'Use native pipe operator, |>'. 
Finally, I recommend setting the default text encoding to UTF-8 (`Code, Saving`).

The functionality of R can be extended by installing further packages. 
The first of these we'll use is the `here` package, 
which makes it easier to read in data files if you're working in a complex file system.
Nothing in the lectures hinges on your using the `here` package or not;
I just find that it makes my life easier. 
To install the `here` package, type the following command at the R prompt:

```{r, eval = FALSE}
install.packages("here")
```

The second package isn't optional if you want to following 
along with the rest of this course: 
The `tidyverse` actually bundles a couple of package that are based 
on a set of shared principles and that facilitate working with datasets enormously. 
You can install it like so:

```{r, eval = FALSE}
install.packages("tidyverse")
```

<!-- other packages -->

### Setting up a project in RStudio
I recommmend you set up an R project for these lectures.
R projects aren't strictly necessary, but I find them helpful to manage different
research projects, publications, classes I teach, etc.

You can either set up a project manually or you can clone this project to your computer.

#### Setting up a project manually
In RStudio, go to `File > New Project...`. Select `New Directory`, then `New Project`. 
Specify the new project's name (e.g., `GeneralLinearModel`) 
and select the directory it should be a subdirectory of. 
Don't tick any of the available options.
Then click `Create Project`.

In the directory you've just created, 
you'll find a `.Rproj` file (e.g., `GeneralLinearModel.Rproj`). 
You can open your project by double-clicking this file. 
Alternatively, in RStudio, go `File > Open Project...`. 
In the directory with the `.Rproj` file, 
create two subdirectory: `data` and `functions`. 
Copy the datasets from the present repository's `data` directory into your `data` directory. 
Also copy the `scatterplot_matrix.R` file from the `functions` directory into your own `functions` directory.

#### Cloning the project
In RStudio, go to `File > New Project...`. Select `Version Control: Checkout a project from a version control repository`. Click on `Git: Clone a project from a repository`.
Use `https://github.com/janhove/GeneralLinearModel` as the repository URL.

## Working with scripts
With few exceptions, you should type the commands you want to execute in
an R script (`File > New File > R Script`) rather than directly in the R console.
While nothing terrible will happen if you do enter commands directly
into the console, entering them into the script editor first is a good
habit to get into: it's much easier to spot errors, save _and_ document your analysis,
make tweaks to your code, and reuse old code in the editor than in the console.

As a rule of thumb, for the analysis of large projects, 
I tend to create separate R scripts for different parts of the analysis
that are internally closely connected but more or less independent of the other
parts. For instance, I might have a script for cleaning the datasets,
another script for the analyses that are reported in Chapter 4,
and yet another script for the analyses reported in Chapter 5.

In the `templates` directory, you'll find two R files.
`bare_script.R` illustrates how I lay-out fairly short scripts without
any bells or whistles.
`script_with_markdown.R` is more elaborate and combines snippets of R
code with running text (including some mark-up such as headings and emphasis).

R scripts can be compiled as HTML files (i.e., web pages) that show both
the R commands as well as their output.
This only works if all the code is syntactically correct and if its proper
execution does not rely on objects that are not defined in the script.
Compiling scripts is a great way to verify that your scripts are syntactically
correct as well as self-contained. 
Compile the templates that I provided to check this for yourselves.
(RStudio may prompt you to install some further packages as you do so.)