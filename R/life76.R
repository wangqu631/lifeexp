#' 一步跑完六步作业
#'
#' 按作业顺序依次执行: 1. 见表 ([life_data()]); 2. 散点图矩阵 (Life.Exp 在第 1
#' 位, 所以每张小图的 y 轴都是它); 3. 建模 + 4. AIC 优化与 anova 检验
#' ([life_step()]); 5. 回归系数 (双尾 p 值) 与森林图 ([life_forest()]);
#' 6. Hawaii 的预期寿命、条件置信区间与预测区间 ([life_hawaii()])。
#'
#' @param data data frame, 默认 [life_data()]。
#' @param state 要预测的州, 默认 `"Hawaii"`。
#' @return 不可见地返回列表: `data`, `fit`, `coef`, `interval`。
#' @examples
#' \donttest{life76()}
#' @export
life76 <- function(data = life_data(), state = "Hawaii") {
  graphics::plot(data[c("Life.Exp", setdiff(names(data), "Life.Exp"))])
  fit <- life_step(data)
  print(fit$anova)
  print(summary(fit$best))
  cf <- life_forest(fit$best, data)
  print(cf)
  iv <- life_hawaii(fit$best, data, state)
  print(iv)
  invisible(list(data = data, fit = fit, coef = cf, interval = iv))
}
