#' 标准化系数森林图
#'
#' 先把所有变量标准化再重新拟合, 得到的就是标准化 β —— 量纲统一, 才能放在
#' 同一张森林图上比较 (原始系数里 Population 是 1e-5 量级、Murder 是 1e-1
#' 量级, 直接画会全挤在 0 上)。误差线为 95% 置信区间, 虚线为 0 (无效应)。
#'
#' @param best `lm` 对象, 一般取 `life_step()$best`。
#' @param data 拟合 `best` 所用的数据。
#' @param xlab x 轴标题。
#' @return 不可见地返回 data frame: 变量、标准化 β、95% CI 上下限、双尾 p 值。
#' @examples
#' life_forest(life_step(trace = FALSE)$best)
#' @export
life_forest <- function(best, data = life_data(), xlab = "标准化 β (95% CI)") {
  ms <- stats::update(best, data = as.data.frame(scale(data)))
  cf <- summary(ms)$coefficients[-1, , drop = FALSE]
  ci <- stats::confint(ms)[-1, , drop = FALSE]
  i  <- rev(seq_len(nrow(cf)))
  graphics::par(mar = c(4.5, 8, 3, 1))
  graphics::plot(cf[, 1], i, xlim = range(ci), yaxt = "n", pch = 19, cex = 1.3,
                 xlab = xlab, ylab = "")
  graphics::segments(ci[, 1], i, ci[, 2], i, lwd = 2)
  graphics::axis(2, i, rownames(cf), las = 1)
  graphics::abline(v = 0, lty = 2)
  invisible(data.frame(变量 = rownames(cf), 标准化beta = cf[, 1],
                       CI下限 = ci[, 1], CI上限 = ci[, 2], 双尾p值 = cf[, 4],
                       row.names = NULL))
}
