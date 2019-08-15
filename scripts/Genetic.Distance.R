data<-read.csv("~/Desktop/solanum.all.genetic.distance.csv", 
               header = T)

#LA1044.LA0483.LA0746
galgal<-sum(data$LA0483.sorted.bam.LA1044.sorted.bam.ndiff)/sum(data$LA0483.sorted.bam.LA1044.sorted.bam.ntotal)

galche<-(sum(data$LA0746.sorted.bam.LA1044.sorted.bam.ndiff)/sum(data$LA0746.sorted.bam.LA1044.sorted.bam.ntotal))+
  (sum(data$LA0483.sorted.bam.LA0746.sorted.bam.ndiff))/sum(data$LA0483.sorted.bam.LA0746.sorted.bam.ntotal)/2

#LA2172.LA2157.LA2147
arcarc<-sum(data$LA2157.sorted.bam.LA2172.sorted.bam.ndiff)/sum(data$LA2157.sorted.bam.LA2172.sorted.bam.ntotal)
  
arcpim<-(sum(data$LA2147.sorted.bam.LA2157.sorted.bam.ndiff)/sum(data$LA2147.sorted.bam.LA2157.sorted.bam.ntotal))+
  (sum(data$LA2147.sorted.bam.LA2172.sorted.bam.ndiff))/sum(data$LA2147.sorted.bam.LA2172.sorted.bam.ntotal)/2

#LA1375.LA1246.LA2133
#pim.pim.neo

pimpim<-sum(data$LA1246.sorted.bam.LA1375.sorted.bam.ndiff)/sum(data$LA1246.sorted.bam.LA1375.sorted.bam.ntotal)

pimneo<-(sum(data$LA1246.sorted.bam.LA2133.sorted.bam.ndiff)/sum(data$LA1246.sorted.bam.LA2133.sorted.bam.ntotal))+
  (sum(data$LA1375.sorted.bam.LA2133.sorted.bam.ndiff))/sum(data$LA1375.sorted.bam.LA2133.sorted.bam.ntotal)/2

#LA1582.LA1933.LA1969
#pim.pim.chi

pimpim2<-sum(data$LA1582.sorted.bam.LA1933.sorted.bam.ndiff)/sum(data$LA1582.sorted.bam.LA1933.sorted.bam.ntotal)

pimchi<-(sum(data$LA1582.sorted.bam.LA1933.sorted.bam.ndiff)/sum(data$LA1582.sorted.bam.LA1933.sorted.bam.ntotal))+
  (sum(data$LA1933.sorted.bam.LA1969.sorted.bam.ndiff))/sum(data$LA1933.sorted.bam.LA1969.sorted.bam.ntotal)/2

#LA0400.LA1269.LA0118
#pim.pim.cor1

pimpim3<-sum(data$LA0400.sorted.bam.LA1933.sorted.bam.ndiff)/sum(data$LA0400.sorted.bam.LA1933.sorted.bam.ntotal)

pimcor1<-(sum(data$LA0118.sorted.bam.LA0400.sorted.bam.ndiff)/sum(data$LA0118.sorted.bam.LA0400.sorted.bam.ntotal))+
  (sum(data$LA0118.sorted.bam.LA1269.sorted.bam.ndiff))/sum(data$LA0118.sorted.bam.LA1269.sorted.bam.ntotal)/2

#LA1617.LA1521.LA0118
#pim.pim.cor2

pimpim4<-sum(data$LA1521.sorted.bam.LA1617.sorted.bam.ndiff)/sum(data$LA1521.sorted.bam.LA1617.sorted.bam.ntotal)

pimcor2<-(sum(data$LA0118.sorted.bam.LA1617.sorted.bam.ndiff)/sum(data$LA0118.sorted.bam.LA1617.sorted.bam.ntotal))+
  (sum(data$LA0118.sorted.bam.LA1521.sorted.bam.ndiff))/sum(data$LA0118.sorted.bam.LA1521.sorted.bam.ntotal)/2

#LA1595.LA1341.LA1278
#pim.pim.per1

pimpim5<-sum(data$LA1341.sorted.bam.LA1595.sorted.bam.ndiff)/sum(data$LA1341.sorted.bam.LA1595.sorted.bam.ntotal)

pimper1<-(sum(data$LA1278.sorted.bam.LA1341.sorted.bam.ndiff)/sum(data$LA1278.sorted.bam.LA1341.sorted.bam.ntotal))+
  (sum(data$LA1278.sorted.bam.LA1595.sorted.bam.ndiff))/sum(data$LA1278.sorted.bam.LA1595.sorted.bam.ntotal)/2

#LA1595.LA1341.LA1278
#pim.pim.per1

pimpim5<-sum(data$LA1341.sorted.bam.LA1595.sorted.bam.ndiff)/sum(data$LA1341.sorted.bam.LA1595.sorted.bam.ntotal)

pimper1<-(sum(data$LA1278.sorted.bam.LA1341.sorted.bam.ndiff)/sum(data$LA1278.sorted.bam.LA1341.sorted.bam.ntotal))+
  (sum(data$LA1278.sorted.bam.LA1595.sorted.bam.ndiff))/sum(data$LA1278.sorted.bam.LA1595.sorted.bam.ntotal)/2

#LA1617.LA1269.LA1278
#pim.pim.per2

pimpim6<-sum(data$LA1269.sorted.bam.LA1617.sorted.bam.ndiff)/sum(data$LA1269.sorted.bam.LA1617.sorted.bam.ntotal)

pimper2<-(sum(data$LA1278.sorted.bam.LA1617.sorted.bam.ndiff)/sum(data$LA1278.sorted.bam.LA1617.sorted.bam.ntotal))+
  (sum(data$LA1269.sorted.bam.LA1278.sorted.bam.ndiff))/sum(data$LA1269.sorted.bam.LA1278.sorted.bam.ntotal)/2

#LA0417.LA0442.LA1777
#pim.pim.hab

pimpim7<-sum(data$LA0417.sorted.bam.LA0442.sorted.bam.ndiff)/sum(data$LA0417.sorted.bam.LA0442.sorted.bam.ntotal)

pimhab<-(sum(data$LA0442.sorted.bam.LA1777.sorted.bam.ndiff)/sum(data$LA0442.sorted.bam.LA1777.sorted.bam.ntotal))+
  (sum(data$LA0417.sorted.bam.LA1777.sorted.bam.ndiff))/sum(data$LA0417.sorted.bam.LA1777.sorted.bam.ntotal)/2

#LA1245.LA1269.LA1272
#pim.pim.pen

pimpim8<-sum(data$LA1245.sorted.bam.LA1269.sorted.bam.ndiff)/sum(data$LA1245.sorted.bam.LA1269.sorted.bam.ntotal)

pimpen<-(sum(data$LA1245.sorted.bam.LA1272.sorted.bam.ndiff)/sum(data$LA1245.sorted.bam.LA1272.sorted.bam.ntotal))+
  (sum(data$LA1269.sorted.bam.LA1272.sorted.bam.ndiff))/sum(data$LA1269.sorted.bam.LA1272.sorted.bam.ntotal)/2

#LA2172.LA2157.LA1718
#arc.arc.hab

arcarc2<-sum(data$LA2157.sorted.bam.LA2172.sorted.bam.ndiff)/sum(data$LA2157.sorted.bam.LA2172.sorted.bam.ntotal)

archab<-(sum(data$LA1718.sorted.bam.LA2172.sorted.bam.ndiff)/sum(data$LA1718.sorted.bam.LA2172.sorted.bam.ntotal))+
  (sum(data$LA1718.sorted.bam.LA2157.sorted.bam.ndiff))/sum(data$LA1718.sorted.bam.LA2157.sorted.bam.ntotal)/2

#LA1777.LA1718.LA2133
#hab.hab.neo

habhab<-sum(data$LA1718.sorted.bam.LA1777.sorted.bam.ndiff)/sum(data$LA1718.sorted.bam.LA1777.sorted.bam.ntotal)

habneo<-(sum(data$LA1718.sorted.bam.LA2133.sorted.bam.ndiff)/sum(data$LA1718.sorted.bam.LA2133.sorted.bam.ntotal))+
  (sum(data$LA1777.sorted.bam.LA2133.sorted.bam.ndiff))/sum(data$LA1777.sorted.bam.LA2133.sorted.bam.ntotal)/2

#LA0407.LA1777.LA0118
#hab.hab.cor

habhab2<-sum(data$LA0407.sorted.bam.LA1777.sorted.bam.ndiff)/sum(data$LA0407.sorted.bam.LA1777.sorted.bam.ntotal)

habcor<-(sum(data$LA0118.sorted.bam.LA0407.sorted.bam.ndiff)/sum(data$LA0118.sorted.bam.LA0407.sorted.bam.ntotal))+
  (sum(data$LA0118.sorted.bam.LA1777.sorted.bam.ndiff))/sum(data$LA0118.sorted.bam.LA1777.sorted.bam.ntotal)/2

#LA1983.LA1365.LA1718
#hua.hua.hab

huahua<-sum(data$LA1365.sorted.bam.LA1983.sorted.bam.ndiff)/sum(data$LA1365.sorted.bam.LA1983.sorted.bam.ntotal)

huahab<-(sum(data$LA1365.sorted.bam.LA1718.sorted.bam.ndiff)/sum(data$LA1365.sorted.bam.LA1718.sorted.bam.ntotal))+
  (sum(data$LA1718.sorted.bam.LA1983.sorted.bam.ndiff))/sum(data$LA1718.sorted.bam.LA1983.sorted.bam.ntotal)/2

#LA2172.LA2157.LA0373
#arcSI.arcSC.pimSC

arcarc3<-sum(data$LA2157.sorted.bam.LA2172.sorted.bam.ndiff)/sum(data$LA2157.sorted.bam.LA2172.sorted.bam.ntotal)

arcpim<-(sum(data$LA0373.sorted.bam.LA2157.sorted.bam.ndiff)/sum(data$LA0373.sorted.bam.LA2157.sorted.bam.ntotal))+
  (sum(data$LA0373.sorted.bam.LA2172.sorted.bam.ndiff))/sum(data$LA0373.sorted.bam.LA2172.sorted.bam.ntotal)/2

#LA2172.LA2157.LA0400
#arcSI.arcSC.pimSC2	

arcarc4<-sum(data$LA2157.sorted.bam.LA2172.sorted.bam.ndiff)/sum(data$LA2157.sorted.bam.LA2172.sorted.bam.ntotal)

arcpim2<-(sum(data$LA0400.sorted.bam.LA2157.sorted.bam.ndiff)/sum(data$LA0400.sorted.bam.LA2157.sorted.bam.ntotal))+
  (sum(data$LA0400.sorted.bam.LA2172.sorted.bam.ndiff))/sum(data$LA0400.sorted.bam.LA2172.sorted.bam.ntotal)/2

#habSI.habSC.pimSC	
#LA1777.LA0407.LA0373

habhab3<-sum(data$LA0407.sorted.bam.LA1777.sorted.bam.ndiff)/sum(data$LA0407.sorted.bam.LA1777.sorted.bam.ntotal)

habpim<-(sum(data$LA0373.sorted.bam.LA1777.sorted.bam.ndiff)/sum(data$LA0373.sorted.bam.LA1777.sorted.bam.ntotal))+
  (sum(data$LA0373.sorted.bam.LA0407.sorted.bam.ndiff))/sum(data$LA0373.sorted.bam.LA0407.sorted.bam.ntotal)/2

#habSI.habSC.pimSC2	
#LA1777.LA0407.LA0400

habhab4<-sum(data$LA0407.sorted.bam.LA1777.sorted.bam.ndiff)/sum(data$LA0407.sorted.bam.LA1777.sorted.bam.ntotal)

habpim2<-(sum(data$LA0400.sorted.bam.LA1777.sorted.bam.ndiff)/sum(data$LA0400.sorted.bam.LA1777.sorted.bam.ntotal))+
  (sum(data$LA0400.sorted.bam.LA0407.sorted.bam.ndiff))/sum(data$LA0400.sorted.bam.LA0407.sorted.bam.ntotal)/2

#perSI.perSC.pimSC
#LA1278.PI128650.LA0373

perper<-sum(data$LA1278.sorted.bam.PI128650.sorted.bam.ndiff)/sum(data$LA1278.sorted.bam.PI128650.sorted.bam.ntotal)

perpim<-(sum(data$LA0373.sorted.bam.LA1278.sorted.bam.ndiff)/sum(data$LA0373.sorted.bam.LA1278.sorted.bam.ntotal))+
  (sum(data$LA0373.sorted.bam.PI128650.sorted.bam.ndiff))/sum(data$LA0373.sorted.bam.PI128650.sorted.bam.ntotal)/2

#perSI.perSC.pimSC
#LA1278.PI128650.LA0400
perper2<-sum(data$LA1278.sorted.bam.PI128650.sorted.bam.ndiff)/sum(data$LA1278.sorted.bam.PI128650.sorted.bam.ntotal)

perpim2<-(sum(data$LA0400.sorted.bam.LA1278.sorted.bam.ndiff)/sum(data$LA0400.sorted.bam.LA1278.sorted.bam.ntotal))+
  (sum(data$LA0400.sorted.bam.PI128650.sorted.bam.ndiff))/sum(data$LA0400.sorted.bam.PI128650.sorted.bam.ntotal)/2






































