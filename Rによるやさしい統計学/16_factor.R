source("reference_files/16_因子分析/gen_data.R")
subjects

correlation_matrix <- cor(subjects)
correlation_matrix

factor_matrix <- factanal(subjects, factors=2)
factor_matrix
