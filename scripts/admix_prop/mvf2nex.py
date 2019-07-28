import sys
from Bio import Phylo 
from io import StringIO
import os

'''
This script takes the output of MVFtools' InferTree function and 
a phylogenetic network topology, and writes a NEXUS-formatted file
that can be used as input for PhyloNet. 
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
				genetrees.append(line.split()[4]) #parse gene tree topologies	

	return genetrees

def reroot_trees(trees):
	
	'''
	Reroots all gene trees in the specified list
	using the specified outgroup taxon.
	'''

	for i in range(len(trees)):

		tree = Phylo.read(StringIO(trees[i]), "newick") #convert newick string to Tree object
		tree.root_with_outgroup({'name': 'Potato.sorted.bam'}) #re-root the tree
		Phylo.write(tree, 'newtree.tmp', 'newick') #write the new newick tree to a temp file
		
		with open('newtree.tmp') as temp: #read in the new tree
			newtree = temp.readline()

		newtree = newtree.replace(':0.00000', '') #remove the placeholder branch lengths
	
		trees[i] = newtree.strip() #replace old tree in list with the new one	

	os.remove('newtree.tmp') #delete the temp file


def write_nex(network, genetrees, filename, introgressed_taxa):
	
	'''
	Writes a NEXUS-formatted file for input to PhyloNet 
	using the specified network topology and list of gene 
	trees.
	'''
	
	#Give network and gene trees PhyloNet-friendly taxa labels 

	oldlabels = network.replace('(','').replace(')','').split(',')
	oldlabels = [label.replace('#H1','') if '#H1' in label else label for label in oldlabels]
	oldlabels = [label.strip() for label in oldlabels]
	del oldlabels[3]
	
	if str(introgressed_taxa) == 'P1P3':
		network = network.replace(oldlabels[0], 'P2')
		network = network.replace(oldlabels[1], 'P1')
		network = network.replace(oldlabels[2], 'P3')
		network = network.replace(oldlabels[3], 'Out')
	elif str(introgressed_taxa) == 'P2P3':
		network = network.replace(oldlabels[0], 'P1')
		network = network.replace(oldlabels[1], 'P2')
		network = network.replace(oldlabels[2], 'P3')
		network = network.replace(oldlabels[3], 'Out')

	for i in range(len(genetrees)):
		
		if str(introgressed_taxa) == 'P1P3':
			genetrees[i] = genetrees[i].replace(oldlabels[0], 'P2')
			genetrees[i] = genetrees[i].replace(oldlabels[1], 'P1')
			genetrees[i] = genetrees[i].replace(oldlabels[2], 'P3')
			genetrees[i] = genetrees[i].replace(oldlabels[3], 'Out')
		
		elif str(introgressed_taxa) == 'P2P3':
			genetrees[i] = genetrees[i].replace(oldlabels[0], 'P1')
			genetrees[i] = genetrees[i].replace(oldlabels[1], 'P2')
			genetrees[i] = genetrees[i].replace(oldlabels[2], 'P3')
			genetrees[i] = genetrees[i].replace(oldlabels[3], 'Out')

	#Write the NEXUS file

	with open(filename, 'w+') as nexfile:
	
		#Write the network topology
		nexfile.write('#NEXUS\n')
		nexfile.write('\n')
		nexfile.write('BEGIN NETWORKS;\n')
		nexfile.write('\n')
		nexfile.write(''.join(['Network net = ', network, ';\n']))
		nexfile.write('\n')
		nexfile.write('END;\n')
		nexfile.write('\n')
		nexfile.write('\n')
		
		#Write the gene trees
		nexfile.write('BEGIN TREES;\n')
		nexfile.write('\n')

		for i in range(len(genetrees)):
			nexfile.write(''.join(['Tree gt', str(i), ' = ', genetrees[i], '\n']))
		nexfile.write('\n')
		nexfile.write('END;\n')

		#Write PhyloNet command
		nexfile.write('\n')
		nexfile.write('\n')
		nexfile.write('BEGIN PHYLONET;\n')
		nexfile.write('\n')
		nexfile.write('CalGTProb net (all) -o -r 1000 -i 0.0001 -x 20;\n')
		nexfile.write('\n')
		nexfile.write('END;')  				
			
trees = parse_genetrees(sys.argv[1])
reroot_trees(trees)
write_nex(sys.argv[3], trees, sys.argv[2], sys.argv[4])
