#' Hawaii 的预期寿命: 条件置信区间与预测区间
#'
#' @param best `lm` 对象, 一般取 `life_step()$best`。
#' @param data 拟合 `best` 所用的数据。
#' @param state 州名, 默认 `"Hawaii"`。
#' @return 3 行 2 列矩阵: 行是 `fit` / `lwr` / `upr`, 列是条件置信区间与预测区间。
#' @examples
#' life_hawaii(life_step(trace = FALSE)$best)
#' @export
life_hawaii <- function(best, data = life_data(), state = "Hawaii") {
  sapply(c(条件置信区间 = "confidence", 预测区间 = "prediction"),
         function(k) stats::predict(best, data[state, , drop = FALSE],
                                    interval = k)[1, ])
}
