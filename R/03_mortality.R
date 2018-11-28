## mortality comparison ##

## create kaplan meier for each: LH and CNN ###
## LH
km_lh_fit <- survfit(Surv(days_followed, vital_status) ~ pct_ild_lh_quart, data=final_data)
km_lh_plot <- ggsurvplot(km_lh_fit, data=final_data, risk.table=TRUE, pval = TRUE, break.time.by = 500, 
                         ggtheme = theme_classic2(), risk.table.y.text.col = TRUE, risk.table.y.text = FALSE,
                         legend.labs=c("First","Second","Third","Fourth"), legend.title = "Quartile", legend = c(0.8,0.3),
                         title = "Survival by Local Histogram Interstitial Quartile") 
km_lh_plot

# cnn
km_cnn_fit <- survfit(Surv(days_followed, vital_status) ~ pct_ild_cnn_quart, data=final_data)
km_cnn_plot <- ggsurvplot(km_cnn_fit, data=final_data, risk.table=TRUE, pval = TRUE, break.time.by = 500, 
                          ggtheme = theme_classic2(), risk.table.y.text.col = TRUE, risk.table.y.text = FALSE,
                          legend.labs=c("First","Second","Third","Fourth"), legend.title = "Quartile", legend = c(0.8,0.3),
                          title = "Survival by CNN Interstitial Quartile")
km_cnn_plot 

# haa
km_haa_fit <- survfit(Surv(days_followed, vital_status) ~ haa_pct_quart, data=final_data)
km_haa_plot <- ggsurvplot(km_haa_fit, data=final_data, risk.table=TRUE, pval = TRUE, break.time.by = 500, 
                          ggtheme = theme_classic2(), risk.table.y.text.col = T, risk.table.y.text = FALSE,
                          legend.labs=c("First","Second","Third","Fourth"), legend.title = "Quartile", legend = c(0.8,0.3),
                          title = "Survival by HAA Quartile")
km_haa_plot 
