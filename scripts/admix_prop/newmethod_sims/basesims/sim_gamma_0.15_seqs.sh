#!/bin/bash

cd /N/dc2/scratch/mhibbins/introgression_tomato/

for i in {1..100}
do
msdir/ms 4 10000 -T -I 4 1 1 1 1 -ej 4.0 2 1 -ej 0.6 3 2 -ej 0.3 4 3 -es 0.05 3 0.85 -ej 0.05 5 2 | tail -n +4 | grep -v // >results/admix_prop/newmethod_sims/rawsims/gamma_0.15/gamma_0.15_trees_$i.txt
Seq-Gen-1.3.4/source/seq-gen -m HKY -l 10000 -s 0.001 <results/admix_prop/newmethod_sims/rawsims/gamma_0.15/gamma_0.15_trees_$i.txt >results/admix_prop/newmethod_sims/rawsims/gamma_0.15/gamma_0.15_seqs_$i.txt
done
