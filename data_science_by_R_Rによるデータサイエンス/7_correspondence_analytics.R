# やれることは主成分分析や因子分析とそんな変わらない
library(MASS)
caith

caith.ca <- corresp(caith, nf = 4)
summary(caith.ca)

caith.eig <- caith.ca$cor^2
round(caith.eig, 3)


# 多重対応分析（使い所がわからない）
a_answers <- c("A1","A1","A1","A1","A1","A2","A2","A2","A2","A2")
b_answers <- c("B1","B2","B3","B1","B1","B2","B2","B1","B3","B2")
c_answers <- c("C2","C3","C1","C3","C2","C1","C3","C1","C1","C2")
questionnaire_answers_list <- data.frame(cbind(a_answers, b_answers, c_answers))

(questionnaire_answers_list.mca <- mca(questionnaire_answers_list))

# 20210828 これ以上色々できそうだけど、課題もなく、他の手法でもできるから、実際必要になってからやる