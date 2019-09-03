#!/usr/bin/env bash

module unload python/2.7.16
module load python/3.6.1

python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio1_genetrees.txt LA1044.sorted.bam LA0483.sorted.bam LA0746.sorted.bam P1P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio2_genetrees.txt LA2172.sorted.bam LA2157.sorted.bam LA2147.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio3_genetrees.txt LA1375.sorted.bam LA1246.sorted.bam LA2133.sorted.bam P1P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio5_genetrees.txt LA0400.sorted.bam LA1269.sorted.bam LA0118.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio6_genetrees.txt LA1617.sorted.bam LA1521.sorted.bam LA0118.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio7_genetrees.txt LA1595.sorted.bam LA1341.sorted.bam LA1278.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio8_genetrees.txt LA1617.sorted.bam LA1269.sorted.bam LA1278.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio9_genetrees.txt LA0417.sorted.bam LA0442.sorted.bam LA1777.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio10_genetrees.txt LA1245.sorted.bam LA1269.sorted.bam LA1272.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio11_genetrees.txt LA2172.sorted.bam LA2157.sorted.bam LA1718.sorted.bam P1P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio12_genetrees.txt LA1777.sorted.bam LA1718.sorted.bam LA2133.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio13_genetrees.txt LA0407.sorted.bam LA1777.sorted.bam LA0118.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio14_genetrees.txt LA1983.sorted.bam LA1365.sorted.bam LA1718.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio15_genetrees.txt LA2172.sorted.bam LA2157.sorted.bam LA0373.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio16_genetrees.txt LA2172.sorted.bam LA2157.sorted.bam LA0400.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio19_genetrees.txt LA1278.sorted.bam PI128650.sorted.bam LA0373.sorted.bam P2P3 >> tomato_D2.txt
python scripts/D2_statistic/calc_empirical_D2.py results/genetrees/trio20_genetrees.txt LA1278.sorted.bam PI128650.sorted.bam LA0400.sorted.bam P2P3 >> tomato_D2.txt 
