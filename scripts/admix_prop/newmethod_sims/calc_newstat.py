import sys

def parse_seqfile(seqfile):
	
	'''
	Parses the sequences from the output file of SeqGen
	'''
	seqs = []
	
	with open(seqfile, 'r') as seq_file:
		for line in seq_file:
			if '4 10000' not in line:
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

	return ''.join(P1_genome), ''.join(P2_genome), ''.join(P3_genome), ''.join(out_genome)

def calc_D_new(P1, P2, P3, out):
	
	'''
	Calculates the ABBA-BABA test and the proposed adjusted
	test for estimating the proportion of the genome differentially
	introgressed
	'''
	
	ABBA_count, BABA_count, BBAA_count = 0, 0, 0

	for i in range(len(P1)):

		if P2[i] == P3[i] and P1[i] != P3[i] and P1[i] == out[i]:
			ABBA_count += 1
		elif P1[i] == P3[i] and P2[i] != P3[i] and P2[i] == out[i]:
			BABA_count += 1
		elif P1[i] == P2[i] and P1[i] != P3[i] and P3[i] == out[i]:
			BBAA_count += 1

	D = (float(ABBA_count) - float(BABA_count)) / (float(ABBA_count) + float(BABA_count))
	D_new = (float(ABBA_count) - float(BABA_count)) / (float(ABBA_count) + float(BABA_count) + float(BBAA_count))

	return D, D_new


P1, P2, P3, out = parse_seqfile(sys.argv[1])
D, D_new = calc_D_new(P1, P2, P3, out)
print(','.join([str(D), str(D_new), str(sys.argv[2])]))
