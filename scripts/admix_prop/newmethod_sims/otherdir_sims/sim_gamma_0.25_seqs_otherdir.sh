#!/bin/bash

cd /N/dc2/scratch/mhibbins/introgression_tomato/

for i in {1..100}
do
msdir/ms 4 10000 -T -I 4 1 1 1 1 -ej 4.0 2 1 -ej 0.6 3 2 -ej 0.3 4 3 -es 0.05 2 0.75 -ej 0.05 5 3 | tail -n +4 | grep -v // >results/admix_prop/newmethod_sims/otherdir_sims/gamma_0.25/gamma_0.25_trees_otherdir_$i.txt
Seq-Gen-1.3.4/source/seq-gen -m HKY -l 10000 -s 0.001 <results/admix_prop/newmethod_sims/otherdir_sims/gamma_0.25/gamma_0.25_trees_otherdir_$i.txt >results/admix_prop/newmethod_sims/otherdir_sims/gamma_0.25/gamma_0.25_seqs_otherdir_$i.txt
done
