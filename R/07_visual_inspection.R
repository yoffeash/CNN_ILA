### identify visual cases that are outliers based on CNN ###

# identify those with the top 5% CNN ILD values
parenchyma_top5pct <- parenchyma %>% 
  mutate(pct_ild_cnn_decile=ntile(pct_ild_cnn,20)) %>%
  filter(pct_ild_cnn_decile==20)

# Notes
# Highest CNN value is for 14098R_INSP_SHARP_BWH_COPD which has very high BMI and lots of noise.  LH for that patient is 36.098364, which is also an over estimate.
# Second highest CNN value is for 10400W_INSP_SHARP_MSM_COPD which has a high background attenuation (visually).  The patient does have ILA which a fair amount of ground glass and reticular.
# Third highest CNN value is for 13296Q_INSP_SHARP_COL_COPD which has significant motion and streak artifact as well as compressive atelectasis.
