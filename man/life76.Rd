\name{life76}
\encoding{UTF-8}
\alias{life76}
\title{一步跑完六步作业}
\usage{
life76(data = life_data(), state = "Hawaii")
}
\arguments{
  \item{data}{data frame, 默认 \code{\link{life_data}()}。}
  \item{state}{要预测的州, 默认 \code{"Hawaii"}。}
}
\value{
不可见地返回列表: \code{data}, \code{fit}, \code{coef}, \code{interval}。
}
\description{
按作业顺序依次执行六步:
\enumerate{
  \item 见表 (\code{\link{life_data}});
  \item 散点图矩阵 (Life.Exp 在第 1 位, 所以每张小图的 y 轴都是它);
  \item 建模 + \item AIC 优化与 anova 检验 (\code{\link{life_step}});
  \item 回归系数 (双尾 p 值) 与森林图 (\code{\link{life_forest}});
  \item Hawaii 的预期寿命、条件置信区间与预测区间 (\code{\link{life_hawaii}})。
}
}
\examples{
\donttest{life76()}
}
