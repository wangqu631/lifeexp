#' Standardised-coefficient forest plot
#'
#' All variables are standardised before refitting, so the plotted coefficients
#' are standardised betas. In the original units `Population` is of order 1e-5
#' and `Murder` of order 1e-1, so a forest plot of the raw coefficients would
#' squeeze almost every other variable onto zero. Error bars are 95% confidence
#' intervals, the dashed line marks zero (no effect).
#'
#' 中文说明: 先把所有变量标准化再重新拟合, 得到的就是标准化 β —— 量纲统一, 才能放在
#' 同一张森林图上比较。误差线为 95% 置信区间, 虚线为 0 (无效应)。
#'
#' @param best An `lm` object, usually `life_step()$best`.
#' @param data The data `best` was fitted to.
#' @param xlab Label for the x axis.
#' @return Invisibly, a data frame with the columns `term`, `beta`
#'   (standardised), `lower`, `upper` (95% confidence limits) and `p`
#'   (two-tailed p-value).
#' @examples
#' life_forest(life_step(trace = FALSE)$best)
#' @export
life_forest <- function(best, data = life_data(), xlab = "Standardised beta (95% CI)") {
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
  invisible(data.frame(term = rownames(cf), beta = cf[, 1], lower = ci[, 1],
                       upper = ci[, 2], p = cf[, 4], row.names = NULL))
}
