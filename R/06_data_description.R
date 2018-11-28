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

plot_grid(corr_plot,corr_log_plot)

## Bland Altman ##
blandr.draw(final_data$pct_ild_cnn,final_data$pct_ild_lh,"CNN","Local Histogram",
            "Bland Altman: CNN and LH Methods for Interstitial Features",
            plotProportionalBias = TRUE)

