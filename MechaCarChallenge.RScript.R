library(dplyr)
df <- read.csv('MechaCar_mpg.csv')
head(df)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data = df)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data = df)) 

df_sc <- read.csv('Suspension_Coil.csv')
head(df_sc)

Mean = mean(df_sc$PSI)
Median = median(df_sc$PSI)
Variance = var(df_sc$PSI)
SD = sd(df_sc$PSI)
total_summary <- data.frame(Mean,Median,Variance,SD)

lot_summary <- df_sc %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median = median(PSI),Variance = var(PSI),SD = sd(PSI), .groups = 'keep') 

t.test((df_sc$PSI),mu = 1500)

t.test(subset(df_sc,Manufacturing_Lot =="Lot1")$PSI,mu = 1500)
t.test(subset(df_sc,Manufacturing_Lot =="Lot2")$PSI,mu = 1500)
t.test(subset(df_sc,Manufacturing_Lot =="Lot3")$PSI,mu = 1500)