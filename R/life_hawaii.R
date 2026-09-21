#' Expected lifetime of a state, with confidence and prediction intervals
#'
#' Returns both `interval = "confidence"` (the conditional interval for the
#' expected value) and `interval = "prediction"` (the interval for one further
#' state). For Hawaii with the AIC-optimal model the fit is 72.09317 years.
#'
#' 中文说明: 用优化后的模型估计某州预期寿命, 同时给出条件置信区间与预测区间。
#'
#' @param best An `lm` object, usually `life_step()$best`.
#' @param data The data `best` was fitted to.
#' @param state Name of the state, default `"Hawaii"`.
#' @return A 3 x 2 matrix: rows `fit`, `lwr`, `upr`; columns `confidence` and
#'   `prediction`.
#' @examples
#' life_hawaii(life_step(trace = FALSE)$best)
#' @export
life_hawaii <- function(best, data = life_data(), state = "Hawaii") {
  sapply(c(confidence = "confidence", prediction = "prediction"),
         function(k) stats::predict(best, data[state, , drop = FALSE],
                                    interval = k)[1, ])
}
