import sys
from Bio import Phylo
from io import StringIO


def parse_seqfile(seqfile):

	'''
	Parses the sequences from the output file of SeqGen
	'''
	seqs = []

	with open(seqfile, 'r') as seq_file:
		for line in seq_file:
			if '4 100000' not in line:
				seqs.append(str.strip(line))

	out_genome, P3_genome, P2_genome, P1_genome = [], [], [], []

	for i in range(len(seqs)):
		if '1' in seqs[i]:
			out_genome.append(seqs[i].split()[1])
		elif '2' in seqs[i]:
			P3_genome.append(seqs[i].split()[1])
		elif '3' in seqs[i]:
                        P2_genome.append(seqs[i].split()[1])
		else:
			P1_genome.append(seqs[i].split()[1])

	return (P1_genome), (P2_genome), (P3_genome), (out_genome)


def parse_treefile(treefile):

	'''
	Parses the tree file from the output of ms
	'''

	trees = []
	
	with open(treefile, 'r') as tree_file:
		for line in tree_file:
			if ';' in line:
				trees.append(str.strip(line))

	return trees	

def calc_D2(P1, P2, P3, out, trees):

	'''
	Calculcates D2 given the input set of gene trees
	and alignments
	'''

	dAC_AB = 0
	dAC_BC = 0
	count_AB = 0
	count_BC = 0

	for i in range(len(trees)):
		
		nAC_AB = 0
		nAC_BC = 0

		tree = Phylo.read(StringIO(trees[i]), "newick")
		
		if len(tree.trace('3','4')) == 2:
			count_AB += 1
			for j in range(len(P1[i])):
				if P1[i][j] != P3[i][j]:
					nAC_AB += 1
		
		elif len(tree.trace('2','3')) == 2:
			count_BC += 1
			for j in range(len(P1[i])):
				if P1[i][j] != P3[i][j]:
					nAC_BC += 1

		dAC_AB += nAC_AB/(float(len(P1[i])))
		dAC_BC += nAC_BC/(float(len(P1[i])))		

	
	return (dAC_AB/(float(count_AB))) - (dAC_BC/(float(count_BC)))
			

trees = parse_treefile(sys.argv[1])

P1, P2, P3, out = parse_seqfile(sys.argv[2])

D2 = calc_D2(P1, P2, P3, out, trees)

print(D2)


