\name{life_hawaii}
\encoding{UTF-8}
\alias{life_hawaii}
\title{Hawaii 的预期寿命: 条件置信区间与预测区间}
\usage{
life_hawaii(best, data = life_data(), state = "Hawaii")
}
\arguments{
  \item{best}{\code{lm} 对象, 一般取 \code{life_step()$best}。}
  \item{data}{拟合 \code{best} 所用的数据。}
  \item{state}{州名, 默认 \code{"Hawaii"}。}
}
\value{
3 行 2 列矩阵: 行是 \code{fit} / \code{lwr} / \code{upr},
列是条件置信区间与预测区间。
}
\description{
用 AIC 优化后的模型估计原数据中某个州的预期寿命, 同时给出
\code{interval = "confidence"} 的条件置信区间 (均值的区间) 与
\code{interval = "prediction"} 的预测区间 (单个州的区间)。
}
\examples{
life_hawaii(life_step(trace = FALSE)$best)
}
