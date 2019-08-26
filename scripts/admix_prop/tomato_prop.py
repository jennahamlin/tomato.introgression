import sys

def parse_alignment(alignment, P1, P2, P3, outgroup):

	'''
	Parses the sequences for the specified trio
	from the given input alignment.
	'''

	with open(alignment) as alignment_file:
		for line in alignment_file:
			if P1 in line:
				P1_seq = next(alignment_file, '').strip() #Parse P1 sequence    
			elif P2 in line:
				P2_seq = next(alignment_file, '').strip() #Parse P2 sequence
			elif P3 in line:
				P3_seq = next(alignment_file, '').strip() #Parse P3 sequence
			elif outgroup in line:
				outgroup_seq = next(alignment_file, '').strip() #Parse outgroup sequence

	return P1_seq, P2_seq, P3_seq, outgroup_seq


def calc_newD(P1, P2, P3, outgroup):

	'''
	Calculates the ABBA-BABA test for the specified trio
	'''

	bases = ['A', 'C', 'T', 'G']
	ABBA = 0
	BABA = 0
	BBAA = 0

	for i in range(len(P1)):
		if P1[i] in bases and P2[i] in bases and P3[i] in bases and outgroup[i] in bases: #if all bases at site are resolved
			if P2[i] == P3[i] and P1[i] != P3[i] and P1[i] == outgroup[i]: #count ABBA sites
				ABBA += 1
			elif P1[i] == P3[i] and P2[i] != P3[i] and P2[i] == outgroup[i]: #count BABA sites
				BABA += 1
			elif P1[i] == P2[i] and P1[i] != P3[i] and P3[i] == outgroup[i]:
				BBAA += 1

	return BBAA, ABBA, BABA, float(ABBA-BABA)/(BBAA+ABBA+BABA)

P1, P2, P3, outgroup = parse_alignment('fasta_files/solanum.all.filtered.fasta', str(sys.argv[1]), str(sys.argv[2]), str(sys.argv[3]), 'Potato')

BBAA, ABBA, BABA, newD = calc_newD(P1, P2, P3, outgroup)

print('.'.join([str(sys.argv[1]), str(sys.argv[2]), str(sys.argv[3])]), BBAA, ABBA, BABA, abs(newD)) 
