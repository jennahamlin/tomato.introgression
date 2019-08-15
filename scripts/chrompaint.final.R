##########CHROMOPAINTING FROM D-STAT DATA##########
##LOAD LIBRARIES
library(dplyr)
library(tidyr)
library(ggplot2)

##READ IN THE APPROPRIATE FUNCTION(s)
##READ IN GGPLOT2 THEME FUNCTION 
theme_my_own <- function(){
    theme_void()+
    theme(plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), units = , "cm"), #Add a 0.5cm margin around the plot
          strip.text.x = element_text(hjust = 0.05, size =16),#facet labels along horizontal direction 
          legend.position = "bottom", 
          legend.text = element_text(size=10)) 
}

#FUNCTION FOR THE 'MOST PROBABLE' WINDOW
probwindows<- function(inputdat){inputdat%>%transmute(group, contig, winstart, BBAA=pBBAA, BABA=pBABA, ABBA=pABBA)%>%na.omit()%>% #keep only these columns and rename
    gather(key=tree, value =prob, -contig, -winstart, -group)%>% #use key:value pair to convert and format for tidy data
    group_by(contig, winstart)%>% #group data by contig and winstart
    arrange(desc(prob))%>% # arrange in descending order
    slice(1)%>% # only keep to row with highest value
    ungroup()%>% #ungroup
    mutate(treeint = as.integer(factor(tree)))} #add interger value for each possible tree (n =3)

##READ IN DATA
rawdat<-read.csv('~/Desktop/tomato.introgression/data/solanum.mating.LA0373.combined.windows.csv', header =T)

##FILTER THE DATA TO SPECIFIC TRIOS
dat.arc.pim<-filter(rawdat, group == 'arcSI.arcSC.pimSC') #1 
dat.hab.pim<-filter(rawdat, group == 'habSI.habSC.pimSC') #2
dat.per.pim<-filter(rawdat, group == 'perSI.perSC.pimSC') #3



##RUN FUNCTION AND ASSIGN OUTPUT TO VARIABLE FOR PLOTTING
arcSI.arcSC.pimSC<-probwindows(dat.arc.pim) #here arc.arc.hab is our inputdat but could loop through here
habSI.habSC.pimSC<-probwindows(dat.hab.pim)
perSI.perSC.pimSC<-probwindows(dat.per.pim)


##PLOT THE OUTPUT OF THE FUNCTION FOR VISUAL INSPECTION. CAN MAKE MULTIPLE PLOTS VIA LOOPING
#arc.pim.plot<-ggplot(arcSI.arcSC.pimSC, aes(x=winstart, xend=winstart, y=treeint, yend=treeint+1, color=tree, alpha = prob))+
#  geom_segment()+
#  facet_wrap(~contig)+
#  theme_my_own()+
#  ggtitle("LA2172.LA2157.LA0373\narc.arc.hab")+
#  theme(plot.title = element_text(size = 16))

##MAKE A LIST OF THE ASSOCIATED DATA
trio_list<-list(arcSI.arcSC.pimSC, habSI.habSC.pimSC,perSI.perSC.pimSC)

##LOOP THROUGH LIST AND PLOT
for (i in 1:length(trio_list)) {                          
  data <- as.data.frame(trio_list[i])                     # Create a dataframe for each species
  trio.name <- unique(data$group)                         # Create an object that holds the trio name, so that we can title each graph
  plot <- ggplot(data, aes(x=winstart, xend=winstart, y=treeint, yend=treeint+1, color=tree, alpha = prob))+  # Make the plots and add our customised theme
    geom_segment()+
    facet_wrap(~contig)+
    theme_my_own()+
    labs(title = trio.name)+
    theme(plot.title = element_text(size = 18, face="bold"))
  
  ggsave(plot, file = paste(trio.name, ".pdf", sep = ''), scale = 1)  # Save plots as .pdf, can change to .png. Also option to adjust width by height
  
  print(plot)                                                         # Print plots to screen
}
  