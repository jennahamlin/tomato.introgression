#!/bin/bash

cd /N/dc2/scratch/mhibbins/introgression_tomato/

for i in {1..100}
do
msdir/ms 4 10000 -T -I 4 1 1 1 1 -ej 4.0 2 1 -ej 0.6 3 2 -ej 0.3 4 3 -es 0.01 3 0.35 -ej 0.01 5 2 | tail -n +4 | grep -v // >results/admix_prop/newmethod_sims/timing_sims/gamma_0.65/gamma_0.65_trees_timing_$i.txt
Seq-Gen-1.3.4/source/seq-gen -m HKY -l 10000 -s 0.001 <results/admix_prop/newmethod_sims/timing_sims/gamma_0.65/gamma_0.65_trees_timing_$i.txt >results/admix_prop/newmethod_sims/timing_sims/gamma_0.65/gamma_0.65_seqs_timing_$i.txt
done
