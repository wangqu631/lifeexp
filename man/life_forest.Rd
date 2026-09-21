\name{life_forest}
\encoding{UTF-8}
\alias{life_forest}
\title{Standardised-Coefficient Forest Plot}
\usage{
life_forest(best, data = life_data(), xlab = "Standardised beta (95\% CI)")
}
\arguments{
  \item{best}{An \code{lm} object, usually \code{life_step()$best}.}
  \item{data}{The data \code{best} was fitted to.}
  \item{xlab}{Label for the x axis.}
}
\value{
Invisibly, a data frame with the columns \code{term}, \code{beta}
(standardised), \code{lower}, \code{upper} (95\% confidence limits) and
\code{p} (two-tailed p-value).
}
\description{
All variables are standardised before refitting, so the plotted coefficients
are standardised betas: in the original units \code{Population} is of order
1e-5 and \code{Murder} of order 1e-1, so a forest plot of the raw coefficients
would squeeze almost every other variable onto zero. Error bars are 95\%
confidence intervals and the dashed line marks zero (no effect).
中文说明: 标准化后重新拟合, 系数即标准化 β, 量纲统一才可比; 误差线是 95\% CI, 虚线是 0。
}
\examples{
life_forest(life_step(trace = FALSE)$best)
}
