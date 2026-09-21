\name{life_forest}
\encoding{UTF-8}
\alias{life_forest}
\title{标准化系数森林图}
\usage{
life_forest(best, data = life_data(), xlab = "标准化 β (95\% CI)")
}
\arguments{
  \item{best}{\code{lm} 对象, 一般取 \code{life_step()$best}。}
  \item{data}{拟合 \code{best} 所用的数据。}
  \item{xlab}{x 轴标题。}
}
\value{
不可见地返回 data frame: 变量、标准化 beta、95\% CI 上下限、双尾 p 值。
}
\description{
先把所有变量标准化再重新拟合, 得到的就是标准化 β —— 量纲统一, 才能放在同一张
森林图上比较 (原始系数里 Population 是 1e-5 量级、Murder 是 1e-1 量级, 直接画
会全挤在 0 上)。误差线为 95\% 置信区间, 虚线为 0 (无效应)。
}
\examples{
life_forest(life_step(trace = FALSE)$best)
}
