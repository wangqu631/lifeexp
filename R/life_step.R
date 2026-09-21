#' 建模与 AIC 优化
#'
#' 先拟合全变量模型 `Life.Exp ~ .`, 再用 [stats::step()] 按 AIC 逐步剔除变量,
#' 最后用嵌套 F 检验 ([stats::anova()]) 检验精简是否合理 (p 值大 = 删掉的变量
#' 确实没有贡献, 精简合理)。
#'
#' @param data data frame, 默认 [life_data()]。
#' @param trace 逻辑值; 是否打印逐步 AIC 表, 默认打印。
#' @return 列表: `full` (全变量模型), `best` (AIC 最优模型), `anova` (F 检验表)。
#' @examples
#' fit <- life_step(trace = FALSE)
#' formula(fit$best)
#' @export
life_step <- function(data = life_data(), trace = TRUE) {
  full <- stats::lm(Life.Exp ~ ., data = data)
  best <- stats::step(full, trace = trace)
  list(full = full, best = best, anova = stats::anova(best, full))
}
