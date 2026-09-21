\name{lifeexp-package}
\encoding{UTF-8}
\alias{lifeexp}
\alias{lifeexp-package}
\docType{package}
\title{1977 年美国各州预期寿命六步分析}
\description{
一个自包含的小工具包, 一次调用 \code{\link{life76}} 即可完成六步作业。
}
\details{
函数一览:
\itemize{
  \item \code{\link{life_data}}: 见表 (整理 state.x77)
  \item \code{\link{life_step}}: 建模 + AIC 优化 + anova 检验
  \item \code{\link{life_forest}}: 标准化系数森林图 (含双尾 p 值)
  \item \code{\link{life_hawaii}}: Hawaii 的条件置信区间与预测区间
  \item \code{\link{life76}}: 一步跑完以上全部
}
}
\keyword{package}
