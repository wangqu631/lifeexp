\name{life_step}
\encoding{UTF-8}
\alias{life_step}
\title{建模与 AIC 优化}
\usage{
life_step(data = life_data(), trace = TRUE)
}
\arguments{
  \item{data}{data frame, 默认 \code{\link{life_data}()}。}
  \item{trace}{逻辑值; 是否打印逐步 AIC 表, 默认打印。}
}
\value{
列表: \code{full} (全变量模型), \code{best} (AIC 最优模型),
\code{anova} (精简模型 vs 全模型的 F 检验表)。
}
\description{
先拟合全变量模型 \code{Life.Exp ~ .}, 再用 \code{stats::step()} 按 AIC 逐步
剔除变量, 最后用嵌套 F 检验 (\code{stats::anova()}) 检验精简是否合理
(p 值大 = 删掉的变量确实没有贡献, 精简合理)。
}
\examples{
fit <- life_step(trace = FALSE)
formula(fit$best)
fit$anova
}
