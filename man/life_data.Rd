\name{life_data}
\encoding{UTF-8}
\alias{life_data}
\title{1977 US State Data (Tidy Version of state.x77)}
\usage{
life_data()
}
\value{
A data frame with 50 rows and 8 columns: \code{Population}, \code{Income},
\code{Illiteracy}, \code{Life.Exp}, \code{Murder}, \code{HS.Grad}, \code{Frost}
and \code{Area}.
}
\description{
Converts the built-in \code{datasets::state.x77} matrix into a data frame and
renames the two column names that contain a space to \code{Life.Exp} and
\code{HS.Grad}, so that the formula \code{Life.Exp ~ .} can be used directly.
中文说明: 把内置矩阵转成 data frame, 并把两个带空格的列名改掉, 方便直接写公式。
}
\examples{
str(life_data())
}
