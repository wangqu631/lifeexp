\name{life_hawaii}
\encoding{UTF-8}
\alias{life_hawaii}
\title{Expected Lifetime of a State with Confidence and Prediction Intervals}
\usage{
life_hawaii(best, data = life_data(), state = "Hawaii")
}
\arguments{
  \item{best}{An \code{lm} object, usually \code{life_step()$best}.}
  \item{data}{The data \code{best} was fitted to.}
  \item{state}{Name of the state, default \code{"Hawaii"}.}
}
\value{
A 3 x 2 matrix: rows \code{fit}, \code{lwr} and \code{upr}; columns
\code{confidence} (interval for the expected value) and \code{prediction}
(interval for one further state). For Hawaii the fit is 72.09317 years.
}
\description{
Estimates the life expectancy of a state with the AIC-optimal model and returns
both \code{interval = "confidence"}, the conditional interval for the expected
value, and \code{interval = "prediction"}, the interval for a single further
state.
中文说明: 用优化后的模型估计某州预期寿命, 同时给出条件置信区间与预测区间。
}
\examples{
life_hawaii(life_step(trace = FALSE)$best)
}
