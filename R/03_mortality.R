## mortality comparison ##

## create kaplan meier for each: LH and CNN ###
## LH
km_lh_fit <- survfit(Surv(days_followed, vital_status) ~ pct_ild_lh_quart, data=final_data)
km_lh_plot <- ggsurvplot(km_lh_fit, data=final_data, risk.table=TRUE, pval = TRUE, break.time.by = 500, ggtheme = theme_minimal(), risk.table.y.text.col = T, risk.table.y.text = FALSE)
km_lh_plot

# cnn
km_cnn_fit <- survfit(Surv(days_followed, vital_status) ~ pct_ild_cnn_quart, data=final_data)
km_cnn_plot <- ggsurvplot(km_cnn_fit, data=final_data, risk.table=TRUE, pval = TRUE, break.time.by = 500, ggtheme = theme_minimal(), risk.table.y.text.col = T, risk.table.y.text = FALSE)
km_cnn_plot 
