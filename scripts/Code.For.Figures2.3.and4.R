library(ggplot2)
library(ggbeeswarm)
library(grid)
library(gridBase)
tiff("Fig.2.tiff", units="in", width=11, height=8.5, res=300)

#####Figure 2 - Plot of all Genome-wide D values with mean and 95% confidence intervals for geographic trios

#####################geography trios and entire genomes
mydata<-read.csv('solanum.all.combined.windows.csv', header =T)
#only keep rows in which Dsites is greater than 20
mydata<- mydata[which(mydata$Dsites > 20),]

mydata$group<-factor(mydata$group, levels=c('gal.gal.che',"arc.arc.pim", "pim.pim.neo", 'pim.pim.chi', "pim.pim.cor1", "pim.pim.cor2",
                                            "pim.pim.per1", "pim.pim.per2", "pim.pim.hab", 'pim.pim.pen',"arc.arc.hab",
                                            "hab.hab.neo", 'hab.hab.cor', 'hua.hua.hab'))

my.labels<-c('gal\n\ngal\n\nche', 'arc\n\narc\n\npim', 'pim\n\npim\n\nneo', 'pim\n\npim\n\nchi', 
             'pim\n\npim\n\ncor1', 'pim\n\npim\n\ncor2','pim\n\npim\n\nper1', 'pim\n\npim\n\nper2', 
             'pim\n\npim\n\nhab', 'pim\n\npim\n\npen', 'arc\n\narc\n\nhab', 'hab\n\nhab\n\nneo',
             'hab\n\nhab\n\ncor',  'hua\n\nhua\n\nhab', 'per\n\nper\n\npen2') 
 
# Create a data frame 'estimates' to hold the means and 95% confidence intervals:
estimates <- expand.grid(group=levels(mydata$group))
#  mean D using tapply()
estimates$MeanD  <- tapply(mydata$Dstat.alwaysABBAminusBABA, mydata$group, mean)
##### Means with 95% CIs using a linear model 
lm1<-lm(Dstat.alwaysABBAminusBABA ~ group, data=mydata)
# add 95% CI upper and lower bounds to estimates dataframe
estimates$C95_lwr  <- predict(lm1, newdata= estimates, interval="confidence")[,2]
estimates$C95_upr  <- predict(lm1, newdata= estimates, interval="confidence")[,3]
#add the sum of each columns to estimate proportion of genome to experience introgression
estimates$sum.BBAA<-tapply(mydata$BBAA, mydata$group, sum)
estimates$sum.ABBA<-tapply(mydata$ABBA, mydata$group, sum)
estimates$sum.BABA<-tapply(mydata$BABA, mydata$group, sum)

ggplot()+
  geom_point(data=mydata, alpha = 1/3, color= ifelse(mydata$Pvalue<0.06, 'deepskyblue', 'lightgray'), 
             aes(x=group,y=Dstat.alwaysABBAminusBABA ), position = position_jitter(w = 0.4))+
  theme_bw()+
  theme(axis.title.x = element_blank())+
  labs(y="Genome-wide D-statistic (mean with 95% CI)")+
  theme(panel.border = element_blank(),panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), strip.text.x = element_blank(),
        panel.spacing.x = unit(0,"line"))+
  scale_x_discrete(labels = my.labels)+
  theme(text=element_text(size=18))+
  theme(axis.text.x = element_text(colour = 'black'))+
  theme(axis.text.y = element_text(colour = 'black'))+
  geom_point(data=estimates, aes(x=group, y=MeanD), size=3)+
  geom_errorbar(data=estimates, aes(x=group, ymin=MeanD- abs(C95_lwr), ymax=MeanD+ abs(C95_upr)), width=.1)+
  geom_hline(yintercept=c(0), linetype='dotted')+
  theme(plot.margin = unit(c(1, 9, 4, 1), "lines")) #extra space on the right 


##this is to add text to the right of the plot which shows the difference between +D and and -D with a bracket
grid.text(x = unit(0.93, "npc"), y = unit(0.725, "npc") ,label="+D\nGreater\n introgression\n between\n proximate pairs ")
grid.text(x = unit(0.93, "npc"), y = unit(0.4, "npc") ,label="-D\n Greater\n introgression\n between\n distant pairs ")

grid.lines(x = unit(c(0.85,0.84 ), "npc"), y = unit(c(0.94,0.94), "npc"))#horizontal top
grid.lines(x = unit(c(0.85,0.85 ), "npc"), y = unit(c(0.61,0.94), "npc"))
grid.lines(x = unit(c(0.85,0.84 ), "npc"), y = unit(c(0.61,0.61), "npc"))#horizontal bottom for greater than 

grid.lines(x = unit(c(0.85,0.84 ), "npc"), y = unit(c(0.593,0.593), "npc"))
grid.lines(x = unit(c(0.85,0.85 ), "npc"), y = unit(c(0.26,0.593), "npc"))#vertical line 
grid.lines(x = unit(c(0.85,0.84 ), "npc"), y = unit(c(0.26,0.26), "npc"))


##this draws the phylogenetic tree with the words distant, proximate, and outgroup placed appropriately 
grid.text(x = unit(0.87, "npc"), y = unit(0.21, "npc") ,label="Distant")
grid.text(x = unit(0.87, "npc"), y = unit(0.16, "npc") ,label="Proximate")
grid.text(x = unit(0.87, "npc"), y = unit(0.11, "npc") ,label="Proximate")
grid.text(x = unit(0.87, "npc"), y = unit(0.06, "npc") ,label="Outgroup")

#draw phylogeny
grid.lines(x = unit(c(0.99,0.9), "npc"), y = unit(c(0.15,0.21), "npc")) # p1

grid.lines(x = unit(c(0.907,.93), "npc"), y = unit(c(0.160, 0.19), "npc")) # p2 

grid.lines(x = unit(c(0.91,.96), "npc"), y = unit(c(0.11, 0.17), "npc")) # p3 
grid.lines(x = unit(c(0.91,.99), "npc"), y = unit(c(0.06, 0.15), "npc")) # outgroup

dev.off()

#sympartic trios sliced independently in order to test if each trio mean is significantly different than zero
#and this is for site that are greater than 20
arc.arc.hab<-mydata %>%
  group_by(group) %>%
  filter(group == "arc.arc.hab")

arc.arc.pim<-mydata %>%
  group_by(group) %>%
  filter(group == "arc.arc.pim")

gal.gal.che<-mydata %>%
  group_by(group) %>%
  filter(group == "gal.gal.che")

hab.hab.cor<-mydata %>%
  group_by(group) %>%
  filter(group == "hab.hab.cor")

hab.hab.neo<-mydata %>%
  group_by(group) %>%
  filter(group == "hab.hab.neo")

hua.hua.hab<-mydata %>%
  group_by(group) %>%
  filter(group == "hua.hua.hab")

per.per.pen<-mydata %>%
  group_by(group) %>%
  filter(group == "per.per.pen")

pim.pim.chi<-mydata %>%
  group_by(group) %>%
  filter(group == "pim.pim.chi")

pim.pim.cor1<-mydata %>%
  group_by(group) %>%
  filter(group == "pim.pim.cor1")

pim.pim.cor2<-mydata %>%
  group_by(group) %>%
  filter(group == "pim.pim.cor2")

pim.pim.hab<-mydata %>%
  group_by(group) %>%
  filter(group == "pim.pim.hab")

pim.pim.neo<-mydata %>%
  group_by(group) %>%
  filter(group == "pim.pim.neo")

pim.pim.pen<-mydata %>%
  group_by(group) %>%
  filter(group == "pim.pim.pen")

pim.pim.per1<-mydata %>%
  group_by(group) %>%
  filter(group == "pim.pim.per1")

pim.pim.per2<-mydata %>%
  group_by(group) %>%
  filter(group == "pim.pim.per2")

##determine if mean value of D is significantly different than zero for each trio
## using a chi squared goodness of fit test and 1 degree of freedom

arcA<-sum(arc.arc.hab$Dleft)
arcB<-sum(arc.arc.hab$Dright)
arcchi<-((arcA-arcB)^2)/(arcA+arcB)
arcchi
pchisq(arcchi, df=1, lower.tail = F)

arcA2<-sum(arc.arc.pim$Dleft)
arcB2<-sum(arc.arc.pim$Dright)
arcchi2<-((arcA2-arcB2)^2)/(arcA2+arcB2)
arcchi2
pchisq(arcchi2, df=1, lower.tail = F)

galA<-sum(gal.gal.che$Dleft)
galB<-sum(gal.gal.che$Dright)
galchi<-((galA-galB)^2)/(galA+galB)
galchi
pchisq(galchi, df=1, lower.tail = F)

habA<-sum(hab.hab.cor$Dleft)
habB<-sum(hab.hab.cor$Dright)
habchi<-((habA-habB)^2)/(habA+habB)
habchi
pchisq(habchi, df=1, lower.tail = F)

habA2<-sum(hab.hab.neo$Dleft)
habB2<-sum(hab.hab.neo$Dright)
habchi2<-((habA2-habB2)^2)/(habA2+habB2)
habchi2
pchisq(habchi2, df=1, lower.tail = F)

huaA<-sum(hua.hua.hab$Dleft)
huaB<-sum(hua.hua.hab$Dright)
huachi<-((huaA-huaB)^2)/(huaA+huaB)
huachi
pchisq(huachi, df=1, lower.tail = F)

perA<-sum(per.per.pen$Dleft)
perB<-sum(per.per.pen$Dright)
perchi3<-((perA-perB)^2)/(perA+perB)
perchi3
pchisq(perchi3, df=1, lower.tail = F)

pimA<-sum(pim.pim.chi$Dleft)
pimB<-sum(pim.pim.chi$Dright)
pimchi<-((pimA-pimB)^2)/(pimA+pimB)
pimchi
pchisq(pimchi, df=1, lower.tail = F)

pimA2<-sum(pim.pim.cor1$Dleft)
pimB2<-sum(pim.pim.cor1$Dright)
pimchi2<-((pimA2-pimB2)^2)/(pimA2+pimB2)
pimchi2
pchisq(pimchi2, df=1, lower.tail = F)

pimA3<-sum(pim.pim.cor2$Dleft)
pimB3<-sum(pim.pim.cor2$Dright)
pimchi3<-((pimA3-pimB3)^2)/(pimA3+pimB3)
pimchi3
pchisq(pimchi3, df=1, lower.tail = F)

pimA4<-sum(pim.pim.hab$Dleft)
pimB4<-sum(pim.pim.hab$Dright)
pimchi4<-((pimA4-pimB4)^2)/(pimA4+pimB4)
pimchi4
pchisq(pimchi4, df=1, lower.tail = F)

pimA5<-sum(pim.pim.neo$Dleft)
pimB5<-sum(pim.pim.neo$Dright)
pimchi5<-((pimA5-pimB5)^2)/(pimA5+pimB5)
pimchi5
pchisq(pimchi5, df=1, lower.tail = F)

pimA6<-sum(pim.pim.pen$Dleft)
pimB6<-sum(pim.pim.pen$Dright)
pimchi6<-((pimA6-pimB6)^2)/(pimA6+pimB6)
pimchi6
pchisq(pimchi6, df=1, lower.tail = F)

pimA7<-sum(pim.pim.per1$Dleft)
pimB7<-sum(pim.pim.per1$Dright)
pimchi7<-((pimA7-pimB7)^2)/(pimA7+pimB7)
pimchi7
pchisq(pimchi7, df=1, lower.tail = F)

pimA8<-sum(pim.pim.per2$Dleft)
pimB8<-sum(pim.pim.per2$Dright)
pimchi8<-((pimA8-pimB8)^2)/(pimA8+pimB8)
pimchi8
pchisq(pimchi8, df=1, lower.tail = F)

#padjust for all sites
p<-c(3.65e-99, 4.03e-231, 2.01e-25, 0, 5.24e-27,
     6.10e-13, 3.00e-19, 1.76e-05, 2.46e-29,
     1.07e-22, 3.70e-24, 1.34e-17, 3.64e-06, 2.30e-20)


#padjust for sites greater than 20
p<-c(2.265e-06, 0, 0.323, 6.395e-37, 6.014e-12, 2.407e-81,
     0.092, 0.0013, 2.46e-29, 1.067e-22, 3.649e-24,
     1.337e-17, 3.641e-06, 2.291e-20)

p.adjust(p, method = "bonferroni", n = length(p))

#####Figure 3 - Plot of all Genome-wide D values with mean and 95% confidence intervals for mating system trios

tiff("Fig.3.tiff", units="in", width=11, height=8.5, res=300)

#####################mating system trios and entire genomes
mydata<-read.csv('/Users/jhamlin/Desktop/solanum.mating.LA0373.combined.windows.csv', header = T)
#only keep rows in which Dsites is greater than 20
mydata<- mydata[which(mydata$Dsites > 20),]

# Create a data frame 'estimates' to holdnthe means and 95% confidence intervals:
estimates <- expand.grid(group=levels(mydata$group))
#  mean D using tapply()
estimates$MeanD  <- tapply(mydata$Dstat.alwaysABBAminusBABA, mydata$group, mean)
#add the sum of each columns to estimate proportion of genome to experience introgression
estimates$sum.BBAA<-tapply(mydata$BBAA, mydata$group, sum)
estimates$sum.ABBA<-tapply(mydata$ABBA, mydata$group, sum)
estimates$sum.BABA<-tapply(mydata$BABA, mydata$group, sum)

##### Means with 95% CIs
lm1<-lm(Dstat.alwaysABBAminusBABA ~ group, data=mydata)
# add 95% CI upper and lower bounds to estimates dataframe
estimates$C95_lwr  <- predict(lm1, newdata= estimates, interval="confidence")[,2]
estimates$C95_upr  <- predict(lm1, newdata= estimates, interval="confidence")[,3]

my.labels<-c('arc.SI\n\narc.SC\n\npim.SC','hab.SI\n\nhab.SC\n\npim.SC',
             'per.SI\n\nper.SI\n\npim.SC')  

ggplot()+
  geom_point(data=mydata, alpha = 1/3, color= ifelse(mydata$Pvalue<0.06, 'deepskyblue', 'lightgray'), 
             aes(x=group,y=Dstat.alwaysABBAminusBABA ), position = position_jitter(w = 0.4))+
  theme_bw()+
  theme(axis.title.x = element_blank())+
  labs(y="Genome-wide D-statistic (mean with 95% CI)")+
  theme(panel.border = element_blank(),panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), strip.text.x = element_blank(),
        panel.spacing.x = unit(0,"line"))+
  scale_x_discrete(labels = my.labels)+
  theme(text=element_text(size=18))+
  theme(axis.text.x = element_text(colour = 'black'))+
  theme(axis.text.y = element_text(colour = 'black'))+
  geom_point(data=estimates, aes(x=group, y=MeanD), size=3)+
  geom_errorbar(data=estimates, aes(x=group, ymin=MeanD- abs(C95_lwr), ymax=MeanD+ abs(C95_upr)), width=.1)+
  geom_hline(yintercept=c(0), linetype='dotted')

dev.off()

#mating systems trios sliced independently in order to test if each trio mean is significantly different than zero
##adjusted based on removing rows with less than 20 Dsites.
arcSI.arcSC.pimSC<-mydata %>%
  group_by(group) %>%
  filter(group == "arcSI.arcSC.pimSC")

habSI.habSC.pimSC<-mydata %>%
  group_by(group) %>%
  filter(group == "habSI.habSC.pimSC")

perSI.perSC.pimSC<-mydata %>%
  group_by(group) %>%
  filter(group == "perSI.perSC.pimSC")

arcA<-sum(arcSI.arcSC.pimSC$Dleft)
arcB<-sum(arcSI.arcSC.pimSC$Dright)
arcchi<-((arcA-arcB)^2)/(arcA+arcB)
arcchi
pchisq(arcchi, df=1, lower.tail = F)

habA<-sum(habSI.habSC.pimSC$Dleft)
habB<-sum(habSI.habSC.pimSC$Dright)
habchi<-((habA-habB)^2)/(habA+habB)
habchi
pchisq(habchi, df=1, lower.tail = F)

perA<-sum(perSI.perSC.pimSC$Dleft)
perB<-sum(perSI.perSC.pimSC$Dright)
perchi<-((perA-perB)^2)/(perA+perB)
perchi
pchisq(perchi, df=1, lower.tail = F)

#padjust for only >greater than 20 sites
p<-c(4.35E-162, 0, 0.00302)

p.adjust(p, method = "bonferroni", n = length(p))

#####Figure 4 - Absolute value of Genome-wide D statistic regressed againist Genetic Distance for all 17 comparisons

gen.dis<-c(0.34, 2.95, 2.95, 3.02, 
           3.60, 3.53, 3.54, 3.44, 
           3.83, 3.52, 3.77, 4.01,
           3.74, 3.92, 2.88, 3.83,
           3.35)

mean.d<-abs(c(-0.027, 0.032, -0.089, -0.010,
              0.016, 0.09, 0.004, 0.082, 
              0.042, 0.068, -0.015, 0.048, 
              0.057, 0.053, 0.035, 0.0356, 
              0.15))

geoplot<-plot(x=gen.dis, y=mean.d, xlab = "Genetic Distance (%)", ylab= "Mean D statistic",cex =1,
              pch=16, font.lab=2,  xlim=c(0,4) )
lm1<-lm(mean.d ~  gen.dis)
summary(lm1)

