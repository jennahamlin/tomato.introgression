import sys
from Bio import Phylo
from io import StringIO
import os

'''
This script estimates the empirical value of D2 given
the output gene trees with branch lengths from MVFtools.
'''

def parse_genetrees(genetree_file):

	'''
	Parses the output file from InferTree and returns the 
	gene trees in a list.
	'''

	genetrees = []

	with open(genetree_file) as treefile:
		for line in treefile:
			if 'topology' not in line:
				genetrees.append(line.split()[3]) #parse gene trees   

	return genetrees

def calc_D2(trees, P1, P2, P3, pair):

	'''
	Calculates the D2 statistic given the set of input gene trees,
	taxa, and introgression history.
	'''

	dAC_AB = 0
	dAC_AB_n = 0
	dAC_BC = 0
	dAC_BC_n = 0

	for i in range(len(trees)):

		tree = Phylo.read(StringIO(trees[i]), "newick") #convert newick string to Tree object
		tree.root_with_outgroup({'name': 'Potato.sorted.bam'}) #root the tree

		if pair == 'P1P3': #if introgression is between P1 and P3

			if len(tree.trace(P1,P2)) == 2: #if the topology is AB
				dAC_AB += tree.distance(P2, P3) #get AC distance
				dAC_AB_n += 1 #count tree
			elif len(tree.trace(P1,P3)) == 2: #if the topology is BC
				dAC_BC += tree.distance(P2,P3) #get AC distance
				dAC_BC_n += 1 #count tree

		elif pair == 'P2P3': #if introgression is between P2 and P3

			if len(tree.trace(P1,P2)) == 2: #if the topology is AB
				dAC_AB += tree.distance(P1, P3) #get AC distance
				dAC_AB_n += 1 #count tree
			elif len(tree.trace(P2,P3)) == 2: #if the topology is BC
				dAC_BC += tree.distance(P1, P3)
				dAC_BC_n += 1 #count tree


	return (dAC_AB/float(dAC_AB_n)) - (dAC_BC/float(dAC_BC_n))

trees = parse_genetrees(sys.argv[1])
D2 = calc_D2(trees, str(sys.argv[2]), str(sys.argv[3]), str(sys.argv[4]), str(sys.argv[5]))
print(','.join([str(sys.argv[2]),str(sys.argv[3]),str(sys.argv[4])]), D2)
