#setwd("G:\\FromDell-10_04_20\\Berkeley\\W203-Fall_20\\temp_w203\\section_06_fa_20\\live_session\\solutions_unit_08")
setwd("D:\\FromDell-10_04_20\\Berkeley\\W203-Spring_2021\\temp_203\\mids_w203_sp_21\\live_session\\unit_07")

library(moments)
load('GSS_w203.RData')


###############################################
summary(GSS$socrel)
summary(GSS$socommun)
table(as.numeric(GSS$socrel), GSS$socrel)
table(as.numeric(GSS$socommun), GSS$socommun)

more_relatives = sum( as.numeric(GSS$socrel) < as.numeric(GSS$socommun), na.rm=T)
trials = sum( as.numeric(GSS$socrel) < as.numeric(GSS$socommun) | as.numeric(GSS$socrel) > as.numeric(GSS$socommun), na.rm=T)
more_relatives/trials

binom.test(more_relatives , trials)

#r = (data in favor - data against)/(total data) 

# The two value  correlation
r<-( 1011 - (1323-1011)) / 1323
r

# Pets
#############################################
GSS$pets = GSS$numpets>0
summary(GSS$pets)

summary(GSS$happy)
table(GSS$happy, as.numeric(GSS$happy))
w<-wilcox.test(as.numeric(GSS$happy)~GSS$pets)
w

cor.test(as.numeric(GSS$happy), as.numeric(GSS$pets), method='spearman')

# Common language effect
sum(GSS$pets & !is.na(GSS$happy), na.rm=T)
sum(! GSS$pets  & !is.na(GSS$happy) , na.rm=T)

pairings<-sum(GSS$pets & !is.na(GSS$happy), na.rm=T) * sum(! GSS$pets  & !is.na(GSS$happy) , na.rm=T)
pairings

w$statistic/pairings





# TV watching with pets
######################################
summary(GSS$tvhours)
length(!is.na((GSS$tvhours[GSS$pets == T])))
length(!is.na((GSS$tvhours[GSS$pets == F])))

hist(GSS$tvhours)
skewness(GSS$tvhours, na.rm=T)

boxplot(GSS$tvhours ~ GSS$pets)

t.test(GSS$tvhours ~ GSS$pets)
?t.test

PractSign <-3.198718 - 3.316742

#Time email or web
########################################
sum(!is.na(GSS$wwwhr) & !is.na(GSS$emailhr))
hist(GSS$wwwhr)

hist(GSS$wwwhr)
skewness(GSS$wwwhr, na.rm=T)

hist(GSS$emailhr)
skewness(GSS$emailhr, na.rm=T)

t.test(GSS$wwwhr, GSS$emailhr, paired=T)

c(mean(GSS$wwwhr, na.rm=T), mean(GSS$emailhr, na.rm=T))


# Compare TV watching Econ or CS majors
############################################

sum(GSS$major1 == 'economics', na.rm=T)
sum(GSS$major1 == 'computer science', na.rm=T)

hist(GSS[GSS$major1 == 'economics',]$tvhours)
hist(GSS[GSS$major1 == 'computer science',]$tvhours)

w<-wilcox.test(GSS[GSS$major1 == 'economics',]$tvhours, GSS[GSS$major1 == 'computer science',]$tvhours)
w


pairings<-sum(GSS$major1 == 'economics' & !is.na(GSS$tvhours), na.rm=T) *
  sum(GSS$major1 == 'computer science' & !is.na(GSS$tvhours), na.rm=T)
pairings

w$statistic/pairings





cor.test(econ_cs$tvhours, as.numeric(econ_cs$major1), method = 'spearman')

# gun ownersand pets

#####################################################
summary(GSS$owngun)
summary(GSS$pets)


GSS$owngun[GSS$owngun == 'refused'] = NA
GSS$owngun = GSS$owngun == 'yes'

# Rows are gun ownership
# columns are pet ownership
tt<-table(GSS$owngun,GSS$pets)
tt

tF<-tt[1,2]/(tt[1,1]+tt[1,2])  
tT<-tt[2,2]/(tt[2,1]+tt[2,2])

# proportion own pet amongst non-gun owners
tF

# proportion own pet amongst gun owners
tT

t.test(GSS$pets ~ GSS$owngun)

tT - tF


