\name{lifeexp-package}
\encoding{UTF-8}
\alias{lifeexp}
\alias{lifeexp-package}
\docType{package}
\title{Six-Step Analysis of 1977 US State Life Expectancy}
\description{
A small self-contained toolkit for the six-step analysis of the built-in
\code{state.x77} data set: \code{\link{life76}} runs all six steps in one call.
中文说明: 一个自包含的小工具包, 一次调用 \code{\link{life76}} 即可完成六步作业。
}
\details{
Functions:
\itemize{
  \item \code{\link{life_data}}: read the table
  \item \code{\link{life_step}}: model, AIC optimisation, ANOVA check
  \item \code{\link{life_forest}}: standardised-coefficient forest plot
  \item \code{\link{life_hawaii}}: confidence and prediction intervals
  \item \code{\link{life76}}: all of the above in one call
}
}
\keyword{package}
