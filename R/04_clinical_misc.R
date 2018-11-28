### other clinical comparison ###

## FEV1 ##
fev1_lh = ggplot(final_data, aes(as.factor(pct_ild_lh_quart),FEV1pp_utah)) + 
  geom_boxplot(fill="gray") + 
  ylab("FEV1%") +
  xlab("Local Histogram Percent ILD Quartile") +
  stat_compare_means(method="anova")     # Add global p-value

fev1_cnn = ggplot(final_data, aes(as.factor(pct_ild_cnn_quart),FEV1pp_utah)) + 
  geom_boxplot(fill="gray") + 
  ylab("FEV1%") +
  xlab("CNN Percent ILD Quartile") +
  stat_compare_means(method="anova")     # Add global p-value

## FVC ##
fvc_lh = ggplot(final_data, aes(as.factor(pct_ild_lh_quart),FVCpp_utah)) + 
  geom_boxplot(fill="gray") + 
  ylab("FVC%") +
  xlab("Local Histogram Percent ILD Quartile") +
  stat_compare_means(method="anova")     # Add global p-value

fvc_cnn = ggplot(final_data, aes(as.factor(pct_ild_cnn_quart),FVCpp_utah)) + 
  geom_boxplot(fill="gray") + 
  ylab("FVC%") +
  xlab("CNN Percent ILD Quartile") +
  stat_compare_means(method="anova")     # Add global p-value

## 6MWD ##
smwd_lh = ggplot(final_data, aes(as.factor(pct_ild_lh_quart),distwalked)) + 
  geom_boxplot(fill="gray") + 
  ylab("6MWD") +
  xlab("Local Histogram Percent ILD Quartile") +
  stat_compare_means(method="anova")     # Add global p-value

smwd_cnn = ggplot(final_data, aes(as.factor(pct_ild_cnn_quart),distwalked)) + 
  geom_boxplot(fill="gray") + 
  ylab("6MWD") +
  xlab("CNN Percent ILD Quartile") +
  stat_compare_means(method="anova")     # Add global p-value

## FEV1, FVC and 6MWD plot ##
plot_grid(fev1_lh,fev1_cnn,fvc_lh,fvc_cnn,smwd_lh,smwd_cnn,ncol=2)

