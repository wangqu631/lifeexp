# lifeexp

用 R 内置数据集 `state.x77`（1977 年美国 50 个州）分析**预期寿命的影响因素**，
六步一次跑完：

1. 见表 —— 读入数据、整理列名
2. 散点图 —— Life.Exp 为 y 轴，其余变量为 x 轴
3. 建模 —— 以 Life.Exp 为响应变量
4. 优化 —— AIC 逐步回归 + `anova` 检验精简是否合理
5. 分析回归系数 —— 标准化 β 森林图 + 双尾 p 值
6. 区间估计 —— Hawaii 的预期寿命、条件置信区间与预测区间

## 安装

```r
# 从 GitHub（把 <用户名> 换成仓库所有者）
remotes::install_github("<用户名>/lifeexp")

# 或者用本地下载的安装文件
install.packages("lifeexp_0.1.0.tar.gz", repos = NULL, type = "source")  # 源码包，跨平台
install.packages("lifeexp_0.1.0.zip",    repos = NULL)                   # Windows 二进制包
```

纯 R 实现，**没有 C/C++ 代码，装的时候不需要 Rtools**，只依赖 `stats`、`graphics`、
`datasets` 三个 R 自带包。

## 用法

```r
library(lifeexp)
life76()
```

这一句就按顺序跑完六步：控制台打印逐步 AIC 表、`anova` 检验、系数表（双尾 p 值）、
标准化 β 表和 Hawaii 的两类区间；绘图区依次出现散点图矩阵和森林图。

也可以分步调用：

```r
d   <- life_data()                  # 1 见表
fit <- life_step()                  # 3+4 建模、AIC 优化（打印逐步 AIC 表）
life_forest(fit$best)               # 5 森林图，返回标准化 β / 95% CI / 双尾 p 值
life_hawaii(fit$best)               # 6 Hawaii 的置信区间与预测区间
```

| 函数 | 作用 | 返回 |
|---|---|---|
| `life_data()` | 整理 `state.x77` | 50×8 data frame |
| `life_step(data, trace)` | 全模型 → `step()` → `anova` | `list(full, best, anova)` |
| `life_forest(best, data)` | 标准化系数森林图 | 变量 / β / CI / p 的 data frame |
| `life_hawaii(best, data, state)` | 条件置信区间与预测区间 | 3×2 矩阵 |
| `life76(data, state)` | 一步跑完六步 | 上面四样的列表 |

帮助页：`?life76`、`?life_forest`、`?lifeexp`。

## 结果

AIC 最优模型为 `Life.Exp ~ Population + Murder + HS.Grad + Frost`
（AIC 从全模型的 121.71 降到 115.73，`anova` 检验 p = 0.9993，说明删掉的
Income / Illiteracy / Area 确实没有贡献）：

| 变量 | 标准化 β | 95% CI | 双尾 p |
|---|---|---|---|
| Murder | −0.825 | [−1.028, −0.623] | 1.77e−10 |
| HS.Grad | +0.280 | [+0.101, +0.460] | 0.00297 |
| Frost | −0.230 | [−0.419, −0.041] | 0.0180 |
| Population | +0.167 | [−0.002, +0.335] | 0.0520 |

Hawaii 的预期寿命 **72.09317 岁**，条件置信区间 [71.38335, 72.80299]，
预测区间 [70.47917, 73.70717]。

## 两点说明

* 森林图用的是**标准化 β**：原始系数里 `Population` 是 1e−5 量级、`Murder` 是
  1e−1 量级，直接放在同一根数轴上会全挤在 0 附近，看不出大小。做法是把所有变量
  标准化后重新拟合，系数即为标准化 β（`life_forest()` 内部完成）。
* 这是观察性横截面数据，系数表示关联而不是因果；n = 50 属小样本，置信区间偏宽。
