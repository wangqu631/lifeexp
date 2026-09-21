#' 1977 年美国各州数据 (state.x77 整理版)
#'
#' 把 R 内置的 [datasets::state.x77] 矩阵转成 data frame, 并把两个带空格的
#' 列名改成 `Life.Exp` 与 `HS.Grad`, 这样就能直接写公式 `Life.Exp ~ .`。
#'
#' @return 50 行 8 列的 data frame: `Population`, `Income`, `Illiteracy`,
#'   `Life.Exp`, `Murder`, `HS.Grad`, `Frost`, `Area`。
#' @examples
#' str(life_data())
#' @export
life_data <- function() {
  state <- as.data.frame(datasets::state.x77)
  names(state)[c(4L, 6L)] <- c("Life.Exp", "HS.Grad")
  state
}
