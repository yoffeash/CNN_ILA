### description of LH and CNN data ###

## distributions ##
hist(final_data$pct_ild_lh, 
     breaks=100, 
     main="Histogram of Distribution of Percent Interstitial using Local Histogram", 
     xlab="Percent Interstitial",
     col="blue")
describe(final_data$pct_ild_lh, skew=TRUE, ranges =TRUE, quant=c(0.25,0.5,0.75))

hist(final_data$pct_ild_cnn, 
     breaks=100, 
     main="Histogram of Distribution of Percent Interstitial using CNN", 
     xlab="Percent Interstitial",
     col="blue")
describe(final_data$pct_ild_cnn, skew=TRUE, ranges =TRUE, quant=c(0.25,0.5,0.75))

## correlation ##
corr_plot <- ggplot(final_data, aes(x=pct_ild_lh, y=pct_ild_cnn)) +
  geom_point() + 
  geom_smooth(method=lm) +
  xlab("Local Histogram Percent Interstitial") +
  ylab("CNN Percent Interstitial") +
  ggtitle("Correlation between Measures") +
  xlim(0,100) +
  ylim(0,100)

corr_log_plot <- ggplot(final_data, aes(x=log(pct_ild_lh), y=log(pct_ild_cnn))) +
  geom_point() + 
  geom_smooth(method=lm) +
  xlab("ln Local Histogram Percent Interstitial") +
  ylab("ln CNN Percent Interstitial") +
  ggtitle("Log Transformed Correlation") +
  xlim(-0.5,5) +
  ylim(-0.5,5)

## Bland Altman ##
bland_alt <- blandr.draw(final_data$pct_ild_cnn,final_data$pct_ild_lh,"CNN","Local Histogram",
            "Bland-Altman: Method 1 = CNN, Method 2 = LH",
            plotProportionalBias = TRUE)

### plot correlation plots and Bland Altman Plots ###
plot_grid(corr_plot,corr_log_plot,bland_alt,ncol=2)

################## CNN subtypes ########################
## distributions - as percentage of total lung volume ##
hist(final_data$pct_panlobular_cnn, 
     breaks=100, 
     main="Distribution of Percent Panlobular Emphysema (of total lung volume) using CNN", 
     xlab="Percent Panlobular Emphysema",
     xlim=c(0,100),
     col="blue")
describe(final_data$pct_panlobular_cnn, skew=TRUE, ranges =TRUE, quant=c(0.25,0.5,0.75))

hist(final_data$pct_centri_emph_cnn, 
     breaks=100, 
     main="Distribution of Percent Centrilobular Emphysema (of total lung volume) using CNN", 
     xlab="Percent Centrilobular Emphysema",
     xlim=c(0,100),
     col="blue")
describe(final_data$pct_centri_emph_cnn, skew=TRUE, ranges =TRUE, quant=c(0.25,0.5,0.75))

hist(final_data$pct_centri_nod_cnn, 
     breaks=100, 
     main="Distribution of Percent Centrilobular Nodule (of total lung volume) using CNN", 
     xlab="Percent Centrilobular Nodule",
     xlim=c(0,100),
     col="blue")
describe(final_data$pct_centri_nod_cnn, skew=TRUE, ranges =TRUE, quant=c(0.25,0.5,0.75))

hist(final_data$pct_groundglass_cnn, 
     breaks=100, 
     main="Distribution of Percent Ground Glass (of total lung volume) using CNN", 
     xlab="Percent Ground Glass",
     xlim=c(0,100),
     col="blue")
describe(final_data$pct_groundglass_cnn, skew=TRUE, ranges =TRUE, quant=c(0.25,0.5,0.75))

hist(final_data$pct_honeycombing_cnn, 
     breaks=100, 
     main="Distribution of Percent Honeycombing (of total lung volume) using CNN", 
     xlab="Percent Honeycombing",
     xlim=c(0,100),
     col="blue")
describe(final_data$pct_honeycombing_cnn, skew=TRUE, ranges =TRUE, quant=c(0.25,0.5,0.75))

hist(final_data$pct_linearscar_cnn, 
     breaks=100, 
     main="Distribution of Percent Linear Scar (of total lung volume) using CNN", 
     xlab="Percent Linear Scar",
     xlim=c(0,100),
     col="blue")
describe(final_data$pct_linearscar_cnn, skew=TRUE, ranges =TRUE, quant=c(0.25,0.5,0.75))

hist(final_data$pct_reticular_cnn, 
     breaks=100, 
     main="Distribution of Percent Reticular (of total lung volume) using CNN", 
     xlab="Percent Reticular",
     xlim=c(0,100),
     col="blue")
describe(final_data$pct_reticular_cnn, skew=TRUE, ranges =TRUE, quant=c(0.25,0.5,0.75))

hist(final_data$pct_subpleuralline_cnn, 
     breaks=100, 
     main="Distribution of Percent Subpleural Line (of total lung volume) using CNN", 
     xlab="Percent Subpleural Line",
     xlim=c(0,100),
     col="blue")
describe(final_data$pct_subpleuralline_cnn, skew=TRUE, ranges =TRUE, quant=c(0.25,0.5,0.75))