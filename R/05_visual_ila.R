### c index for visual ###

## local histogram ##
ila_vis_lh_logit <- glm(ila_d_01_23 ~ pct_ild_lh, data=final_data, family="binomial")
summary(ila_vis_lh_logit)
prob=stats::predict(ila_vis_lh_logit,type=c("response"))
pred <- prediction(prob, final_data$ila_d_01_23)    
perf <- performance(pred, measure = "tpr", x.measure = "fpr")
auc.tmp <- performance(pred,"auc")
auc <- as.numeric(auc.tmp@y.values)
plot(perf, col=rainbow(7), main="Visual ILA based on Local Histogram Predictor", xlab="Specificity", 
     ylab="Sensitivity")    
abline(0, 1)
text(x=0.7,y=0.4,"Area Under the Curve =")
text(x=0.7,y=0.35,auc)

## CNN ##
ila_vis_cnn_logit <- glm(ila_d_01_23 ~ pct_ild_cnn, data=final_data, family="binomial")
summary(ila_vis_cnn_logit)
prob=stats::predict(ila_vis_cnn_logit,type=c("response"))
pred <- prediction(prob, final_data$ila_d_01_23)    
perf <- performance(pred, measure = "tpr", x.measure = "fpr")
auc.tmp <- performance(pred,"auc")
auc <- as.numeric(auc.tmp@y.values)
plot(perf, col=rainbow(7), main="Visual ILA based on CNN Predictor", xlab="Specificity", 
     ylab="Sensitivity")    
abline(0, 1)
text(x=0.7,y=0.4,"Area Under the Curve =")
text(x=0.7,y=0.35,auc)
