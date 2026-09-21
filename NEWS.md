# lifeexp 0.1.1

* CRAN-ready variant: every user-visible string in the R code is now ASCII
  (English plot label and English column names of the returned data frames),
  so `R CMD check --as-cran` reports 0 errors and 0 warnings. Chinese comments
  and the Chinese paragraphs inside the help pages are kept.
* Added `URL` and `BugReports` fields pointing at the GitHub repository.

# lifeexp 0.1.0

* Six-step analysis of `datasets::state.x77`: read the table, scatterplot
  matrix, linear model for `Life.Exp`, AIC optimisation via `step()` with an
  ANOVA check, standardised-coefficient forest plot with two-tailed p-values,
  and the expected lifetime of Hawaii with conditional confidence and
  prediction intervals.
* Pure R, no compiled code; imports only `datasets`, `graphics` and `stats`.
