\name{life_step}
\encoding{UTF-8}
\alias{life_step}
\title{Fit and Optimise the Life-Expectancy Model by AIC}
\usage{
life_step(data = life_data(), trace = TRUE)
}
\arguments{
  \item{data}{A data frame, default \code{\link{life_data}()}.}
  \item{trace}{Logical; print the stepwise AIC table? Default \code{TRUE}.}
}
\value{
A list with \code{full} (the full model), \code{best} (the AIC-optimal model)
and \code{anova} (the nested F test comparing the two).
}
\description{
Fits \code{Life.Exp ~ .} and simplifies it with \code{stats::step()} using AIC,
then checks the simplification with a nested F test (\code{stats::anova()}):
a large p-value means the dropped variables really carried no information.
中文说明: 先拟合全变量模型, 再按 AIC 逐步剔除变量, 最后用嵌套 F 检验判断精简是否合理。
}
\examples{
fit <- life_step(trace = FALSE)
formula(fit$best)
fit$anova
}
