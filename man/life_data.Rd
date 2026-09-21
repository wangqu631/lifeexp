\name{life_data}
\encoding{UTF-8}
\alias{life_data}
\title{1977 年美国各州数据 (state.x77 整理版)}
\usage{
life_data()
}
\value{
50 行 8 列的 data frame: \code{Population}, \code{Income}, \code{Illiteracy},
\code{Life.Exp}, \code{Murder}, \code{HS.Grad}, \code{Frost}, \code{Area}。
}
\description{
把 R 内置的 \code{datasets::state.x77} 矩阵转成 data frame, 并把两个带空格的
列名改成 \code{Life.Exp} 与 \code{HS.Grad}, 这样就能直接写公式
\code{Life.Exp ~ .}。
}
\examples{
str(life_data())
}
