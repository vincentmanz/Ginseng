# load tidyverse package
library(tidyverse)


setwd("~/Desktop/panax_SNP_stats/80%/DV_MD/vcftools/")

#Variant quality
pdf(file="Variant_quality_non_filtered.pdf")
var_qual_nonF <- read_delim("deepvariant.cohort.lqual", delim = "\t",
                       col_names = c("chr", "pos", "qual"), skip = 1)

a <- ggplot(var_qual_nonF, aes(qual)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
a + theme_light()
dev.off()

#Variant mean depth
pdf(file="Variant_mean_depth_non_filtered.pdf ")
var_depth_nonF <- read_delim("deepvariant.cohort.ldepth.mean", delim = "\t",
                        col_names = c("chr", "pos", "mean_depth", "var_depth_nonF"), skip = 1)
b <- ggplot(var_depth_nonF, aes(mean_depth)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
b + theme_light() + xlim(0, 100)
dev.off()

summary(var_depth_nonF$mean_depth)



#Variant missingness
pdf(file="Variant_missingness_non_filtered.pdf ")
var_miss_nonF <- read_delim("deepvariant.cohort.lmiss", delim = "\t",
                       col_names = c("chr", "pos", "nchr", "nfiltered", "nmiss", "fmiss"), skip = 1)

c <- ggplot(var_miss_nonF, aes(fmiss)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
c + theme_light()
dev.off()

summary(var_miss_nonF$fmiss)


#Minor allele frequency
pdf(file="Minor_allele_frequency_non_filtered.pdf ")
var_freq_nonF <- read_delim("deepvariant.cohort.frq", delim = "\t",
                       col_names = c("chr", "pos", "nalleles", "nchr", "a1", "a2"), skip = 1)
# find minor allele frequency
var_freq_nonF$maf <- var_freq_nonF %>% select(a1, a2) %>% apply(1, function(z) min(z))
d <- ggplot(var_freq_nonF, aes(maf)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
d + theme_light()
dev.off()

summary(var_freq_nonF$maf)

#####################################################################################################################################
#####################################################################################################################################

setwd("~/DV_MD/vcftools/vcftools")

#Variant quality
pdf(file="Variant_quality_filtered.pdf")
var_qual_F <- read_delim("deepvariant.cohort.lqual", delim = "\t",
                       col_names = c("chr", "pos", "qual"), skip = 1)

e <- ggplot(var_qual_F, aes(qual)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
e + theme_light()
dev.off()

#Variant mean depth
pdf(file="Variant_mean_depth_filtered.pdf ")
var_depth_F <- read_delim("deepvariant.cohort.ldepth.mean", delim = "\t",
                        col_names = c("chr", "pos", "mean_depth", "var_depth"), skip = 1)
f <- ggplot(var_depth_F, aes(mean_depth)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
f + theme_light() + xlim(0, 100)
dev.off()

summary(var_depth_F$mean_depth)



#Variant missingness
pdf(file="Variant_missingness_filtered.pdf ")
var_miss_F <- read_delim("deepvariant.cohort.lmiss", delim = "\t",
                       col_names = c("chr", "pos", "nchr", "nfiltered", "nmiss", "fmiss"), skip = 1)

g <- ggplot(var_miss_F, aes(fmiss)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
g + theme_light()
dev.off()

summary(var_miss_F$fmiss)


#Minor allele frequency
pdf(file="Minor_allele_frequency_filtered.pdf ")
var_freq_F <- read_delim("deepvariant.cohort.frq", delim = "\t",
                       col_names = c("chr", "pos", "nalleles", "nchr", "a1", "a2"), skip = 1)
# find minor allele frequency
var_freq_F$maf <- var_freq_F %>% select(a1, a2) %>% apply(1, function(z) min(z))
h <- ggplot(var_freq_F, aes(maf)) + geom_density(fill = "dodgerblue1", colour = "black", alpha = 0.3)
h + theme_light()
dev.off()

summary(var_freq_F$maf)

#####################################################################################################################################
#####################################################################################################################################
#Variant quality
require(ggplot2)

pdf(file="Variant_quality_before_after.pdf")
var_qual_F$TAG <- 'Filtered'
var_qual_nonF$TAG <- 'Non_Filtered'
df<-merge(var_qual_F,var_qual_nonF,all=TRUE)      
p<-ggplot(df, aes(x=qual, fill=TAG,color=TAG)) +
  geom_density(alpha=0.3)
p+ theme_light()+ geom_vline(xintercept = 30)
dev.off()

#Variant mean depth
pdf(file="Variant_mean_depth_before_after.pdf ")
var_depth_F$TAG <- 'Filtered'
var_depth_nonF$TAG <- 'Non_Filtered'
df<-merge(var_depth_F,var_depth_nonF,all=TRUE)      
p<-ggplot(df, aes(x=mean_depth, fill=TAG,color=TAG)) +
  geom_density(alpha=0.3)
p + theme_light() + xlim(0, 100) + geom_vline(xintercept = 10)
dev.off()

#Variant missingness
pdf(file="Variant_missingness_before_after.pdf ")
var_miss_F$TAG <- 'Filtered' 
var_miss_nonF$TAG <- 'Non_Filtered'
df<-merge(var_miss_F,var_miss_nonF,all=TRUE)      
p<-ggplot(df, aes(x=fmiss, fill=TAG, color=TAG)) + geom_density(alpha=.2) 
p + theme_light() + geom_vline(xintercept = 0.20)
dev.off()

#Minor allele frequency
pdf(file="Minor_allele_frequency_before_after.pdf ")
var_freq_F$TAG <- 'Filtered' 
var_freq_nonF$TAG <- 'Non_Filtered'
df<-merge(var_freq_F,var_freq_nonF,all=TRUE)      
p<-ggplot(df, aes(x=maf, fill=TAG, color=TAG)) + geom_density(alpha=.2) 
p + theme_light()+ geom_vline(xintercept = 0.05)
dev.off()

