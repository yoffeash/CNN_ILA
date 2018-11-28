### import and clean data ###

## local histogram data based on third training set ##
parenchyma_lh <- read_excel("data/raw_data/LHsubtypes_2016_09_21_v2.xlsx") # import data
parenchyma_lh <- clean_names(parenchyma_lh) # clean names
parenchyma_lh <- parenchyma_lh %>% rename(pct_ild_lh = percent_ild, pct_emph_lh = percent_emphysema, pct_norm_lh = percent_normal) # rename to be consistent with CNN below

## cnn data for first 2500 ##
parenchyma_cnn_pre <- read_csv("data/raw_data/INSP_SHARP_wc_COPD_first2500PostDenverQC_ILDLungPhenosv2.csv") # import data from second CNN analysis 
parenchyma_cnn_sid <- parenchyma_cnn_pre %>% dplyr::select("SID") # select only SID
parenchyma_cnn_values <- parenchyma_cnn_pre %>% # select only the whole lung volumes
  dplyr::select(contains("WholeLung")) %>% 
  dplyr::select(contains("Volume"))
parenchyma_cnn <- cbind(parenchyma_cnn_sid,parenchyma_cnn_values) # merge SID with whole lung volumes
parenchyma_cnn <- parenchyma_cnn %>% # simplify variable names
  rename_all(funs(str_replace_all(.,"WholeLung-",""))) %>% 
  rename_all(funs(str_replace_all(.,"-Volume","")))
parenchyma_cnn$SID <- substr(parenchyma_cnn$SID,0,6) # simplify CT ID to SId
parenchyma_cnn <- parenchyma_cnn %>% mutate(total_volume = # caculate parenchymal percentages
                                              NormalParenchyma + 
                                              PanlobularEmphysema +
                                              CentrilobularEmphysema +
                                              CentrilobularNodule +
                                              GroundGlass +
                                              Honeycombing +
                                              LinearScar +
                                              Nodular +
                                              Reticular +
                                              SubpleuralLine) %>% 
  mutate(pct_ild_cnn = ((CentrilobularNodule +
                          GroundGlass +
                          Honeycombing +
                          LinearScar +
                          Nodular +
                          Reticular +
                          SubpleuralLine)/total_volume)*100) %>% 
  mutate(pct_emph_cnn = ((PanlobularEmphysema +
                            CentrilobularEmphysema)/total_volume)*100) %>% 
  mutate(pct_norm_cnn = ((NormalParenchyma/total_volume)*100)) %>% 
  rename(sid=SID) %>% 
  dplyr::select(sid,pct_ild_cnn,pct_emph_cnn,pct_norm_cnn)

## merge parenchyma datasets and create cut offs ##
parenchyma <- inner_join(parenchyma_cnn,parenchyma_lh) %>% drop_na()
parenchyma <- parenchyma %>%
  mutate(pct_ild_lh_5=ifelse(pct_ild_lh>5,1,0)) %>% #5%
  mutate(pct_ild_cnn_5=ifelse(pct_ild_cnn>5,1,0)) %>% #5%
  mutate(pct_ild_lh_15=ifelse(pct_ild_lh>15,1,0)) %>%  #15%
  mutate(pct_ild_cnn_15=ifelse(pct_ild_cnn>15,1,0)) %>% #15%
  mutate(pct_ild_lh_quart=ntile(pct_ild_lh,4)) %>% #quartile
  mutate(pct_ild_cnn_quart=ntile(pct_ild_cnn,4)) #quartile

## import and clean clinical dataset ##
clinical_pre <- read_delim("data/raw_data/COPDGene_P1P2_All_Visit_09OCT17.txt","\t", escape_double = FALSE, trim_ws = TRUE)
clinical <- clinical_pre %>% 
  filter(visitnum==1)

## import and clean mortality dataset ##
mortality <- read_delim("data/raw_data/COPDGene_Mort_COD_Adjud_oct18.txt","\t", escape_double = FALSE, trim_ws = TRUE) 

## import and clean visual ##
visual_pre <- read_excel("data/raw_data/COPDGGene_visual_round1_2017_05_30.xlsx")
visual <- clean_names(visual_pre)
visual <- visual %>% 
  mutate(ila_d_01_23=ifelse(ila_visual<2,0,1)) %>% 
  mutate(ila_d_0_123=ifelse(ila_visual<1,0,1))

## import and clean HAA data ##
haa_data <- read_csv("data/raw_data/COPDGeneHAAPhenos.csv")
haa_pre <- clean_names(haa_data)
haa_data <- haa_pre %>% 
  mutate(haa_pct = (whole_lung_wild_card_haa600-whole_lung_wild_card_haa250)*100) %>% 
  mutate(haa_pct_quart = ntile(haa_pct,4)) %>% 
  dplyr::select(sid,haa_pct,haa_pct_quart)

## merge parenchyma, clinical and mortality datasets ##
clin_mort <- left_join(mortality,clinical)
clin_mort_visual <- inner_join(visual,clin_mort)
clin_mort_visual_haa <- inner_join(clin_mort_visual,haa_data)
final_data <- left_join(parenchyma,clin_mort_visual_haa) %>% drop_na(ila_visual,haa_pct)
