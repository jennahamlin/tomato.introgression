#!/usr/bin/env bash

#Load python 3
module unload python/2.7.16
module load python/3.6.1

#Create files
python scripts/admix_prop/mvf2nex.py results/genetrees/trio1_genetrees.txt scripts/admix_prop/nex_files/trio1.nex "(((LA0483.sorted.bam,((LA1044.sorted.bam,(LA0746.sorted.bam)#H1))),#H1),Out)" P1P3 
echo "File 1 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio2_genetrees.txt scripts/admix_prop/nex_files/trio2.nex "(((LA2172.sorted.bam,((LA2157.sorted.bam,(LA2147.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 2 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio3_genetrees.txt scripts/admix_prop/nex_files/trio3.nex "(((LA1246.sorted.bam,((LA1375.sorted.bam,(LA2133.sorted.bam)#H1))),#H1),Out)" P1P3
echo "File 3 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio5_genetrees.txt scripts/admix_prop/nex_files/trio5.nex "(((LA0400.sorted.bam,((LA1269.sorted.bam,(LA0118.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 4 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio6_genetrees.txt scripts/admix_prop/nex_files/trio6.nex "(((LA1617.sorted.bam,((LA1521.sorted.bam,(LA0118.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 5 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio7_genetrees.txt scripts/admix_prop/nex_files/trio7.nex "(((LA1595.sorted.bam,((LA1341.sorted.bam,(LA1278.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 6 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio8_genetrees.txt scripts/admix_prop/nex_files/trio8.nex "(((LA1617.sorted.bam,((LA1269.sorted.bam,(LA1278.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 7 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio9_genetrees.txt scripts/admix_prop/nex_files/trio9.nex "(((LA0417.sorted.bam,((LA0442.sorted.bam,(LA1777.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 8 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio10_genetrees.txt scripts/admix_prop/nex_files/trio10.nex "(((LA1245.sorted.bam,((LA1269.sorted.bam,(LA1272.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 9 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio11_genetrees.txt scripts/admix_prop/nex_files/trio11.nex "(((LA2157.sorted.bam,((LA2172.sorted.bam,(LA1718.sorted.bam)#H1))),#H1),Out)" P1P3
echo "File 10 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio12_genetrees.txt scripts/admix_prop/nex_files/trio12.nex "(((LA1777.sorted.bam,((LA1718.sorted.bam,(LA2133.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 11 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio13_genetrees.txt scripts/admix_prop/nex_files/trio13.nex "(((LA0407.sorted.bam,((LA1777.sorted.bam,(LA0118.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 12 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio14_genetrees.txt scripts/admix_prop/nex_files/trio14.nex "(((LA1983.sorted.bam,((LA1365.sorted.bam,(LA1718.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 13 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio15_genetrees.txt scripts/admix_prop/nex_files/trio15.nex "(((LA2172.sorted.bam,((LA2157.sorted.bam,(LA0373.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 14 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio16_genetrees.txt scripts/admix_prop/nex_files/trio16.nex "(((LA2172.sorted.bam,((LA2157.sorted.bam,(LA0400.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 15 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio19_genetrees.txt scripts/admix_prop/nex_files/trio19.nex "(((LA1278.sorted.bam,((PI128650.sorted.bam,(LA0373.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 16 finished"
python scripts/admix_prop/mvf2nex.py results/genetrees/trio20_genetrees.txt scripts/admix_prop/nex_files/trio20.nex "(((LA1278.sorted.bam,((PI128650.sorted.bam,(LA0400.sorted.bam)#H1))),#H1),Out)" P2P3
echo "File 17 finished"
