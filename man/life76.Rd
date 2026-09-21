\name{life76}
\encoding{UTF-8}
\alias{life76}
\title{Run All Six Steps of the Analysis}
\usage{
life76(data = life_data(), state = "Hawaii")
}
\arguments{
  \item{data}{A data frame, default \code{\link{life_data}()}.}
  \item{state}{State to predict, default \code{"Hawaii"}.}
}
\value{
Invisibly, a list with \code{data}, \code{fit}, \code{coef} and
\code{interval}.
}
\description{
Runs the six steps in order:
\enumerate{
  \item read the table (\code{\link{life_data}});
  \item draw the scatterplot matrix, with \code{Life.Exp} first so that every
        panel has it on the y axis;
  \item fit the model and optimise it by AIC with an ANOVA check
        (\code{\link{life_step}});
  \item report the regression coefficients with two-tailed p-values and draw
        the forest plot (\code{\link{life_forest}});
  \item estimate the expected lifetime of Hawaii with confidence and prediction
        intervals (\code{\link{life_hawaii}}).
}
中文说明: 按作业顺序一次跑完六步, 绘图区依次给出散点图矩阵和森林图。
}
\examples{
\donttest{life76()}
}
