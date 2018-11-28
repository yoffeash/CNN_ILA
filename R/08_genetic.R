## genetic analysis ##

#subdivide by race
final_data_nhw <- final_data %>% filter(race==1)
final_data_black <- final_data %>% filter(race==2)

## LH NHW
muc5_lh_nhw_fit <- lm(pct_ild_lh ~ muc5 + ccenter + gender + SmokCigNow + FEV1pp_utah + BMI + pctEmph_Slicer, data=final_data_nhw)
summary(muc5_lh_nhw_fit)

## CNN NHW
muc5_cnn_nhw_fit <- lm(pct_ild_cnn ~ muc5 + ccenter + gender + SmokCigNow + FEV1pp_utah + BMI + pctEmph_Slicer, data=final_data_nhw)
summary(muc5_cnn_nhw_fit)

